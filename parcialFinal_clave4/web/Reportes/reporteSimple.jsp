<%-- 
    Document   : reporteSimple
    Created on : 10-30-2020, 04:37:10 PM
    Author     : Chmod Lopez
--%>

<%@page import="net.sf.jasperreports.engine.JasperRunManager"%>
<%@page import="java.io.File"%>
<%@page import="conexion.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reporte Simple</title>
    </head>
    <body>
         <%
            //Conexion
            Conexion cnx = new Conexion();
            cnx.conectar();
            //Ruta del reporte
            File file = new File(application.getRealPath("Reportes/reporteSimple.jasper"));
            //Lectura del reporte
            byte[] bytes = JasperRunManager.runReportToPdf(file.getPath(), null, cnx.getCon());
            //Tamaño y tipo de respuesta
            response.setContentType("application/pdf");
            response.setContentLength(bytes.length);
            //Obtener respuesta
            ServletOutputStream output = response.getOutputStream();
            //Escribir respuesta
            output.write(bytes, 0, bytes.length);
            output.flush();
            output.close();
        %>
    </body>
</html>
