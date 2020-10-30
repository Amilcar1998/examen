<%-- 
    Document   : jugador
    Created on : 30-oct-2020, 9:24:27
    Author     : Dennis
--%>

<%@page import="modelo.Jugador"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Equipo"%>
<%@page import="modelo.DaoJugador"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CRUD</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
     <script>
            function cargar(codigo, nombre, edad, salario, salario){
            document.frmJugador.txtCodigo.value=codigo;
            document.frmJugador.txtNombre.value=nombre;
            document.frmJugador.txtEdad.value=edad;
            document.frmJugador.txtSalario.value=salario;
            document.frmJugador.equipo.value=salario;
        }
    </script>
</head>
<body>
    <%--Validaciones de cerrar sesion--%>
          <%
        HttpSession sesion = request.getSession();
        if(sesion.getAttribute("nivel")==null){
            response.sendRedirect("../login.jsp");
        } else {
            int nivel = (Integer)sesion.getAttribute("nivel");
            if(nivel!=1){
                response.sendRedirect("../login.jsp");
            }
        }
    %>
    <%--Inicio del menu--%>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <a class="navbar-brand" href="#">EXAMEN PARCIAL FINAL DAUTE</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ml-auto">
            <li class="nav-item active">
                <a href="../Reportes/reporteSimple.jsp" class="btn btn-warning btn-sm btn-outline-dark my-2 my-sm-0">Reporte Simple
             </a> 
            </li>
            <li>
            <a href="../Reportes/reporteSimple.jsp" class="btn btn-warning btn-sm btn-outline-dark my-2 my-sm-0">Reporte Simple
             </a>
            </li>
            <li class="nav-item">
            <a class="navbar-brand" href="#">Bienvenido: <%=sesion.getAttribute("username")%></a>
            </li>
            </ul>
            <form class="form-inline my-2 my-lg-0">
                <a class="btn btn-warning btn-sm btn-outline-dark my-2 my-sm-0" href="../login.jsp?cerrar=true">Cerrar sesión</a>
            </form>
        </div>
    </nav>
    <h1></h1>
   
   <%--Fin del menu--%>
   
   <%--Instancia de dao para listar Equipo--%>
    <%
   DaoJugador dao = new DaoJugador();
   %>
   
    <form action="../ProcesarDatosJugador" method="POST" name="frmJugador">
        <div class="container">        
            <div class="row mt-4 mb-4 text-center">
                <div class="col-lg-12 col-md-6 col-md-12 bg-light">
                    <h1>CRUD DE JUGADOR</h1>
                </div>
            </div>
            <div class="row mb-4">           
                <div class="col-lg-4 col-md-6 col-md-12">                
                    Código: <input class="form-control form-control-sm" name="txtCodigo" type="text">
                    Nombre: <input class="form-control form-control-sm" name="txtNombre" type="text" required>
                    Edad: <input class="form-control form-control-sm" name="txtEdad" type="text" required>
                </div>
                <div class="col-lg-4 col-md-6 col-md-12">
                    Salario: <input class="form-control form-control-sm" name="txtSalario" type="text" required>
                    
                    Equipo: 
                    <select class="form-control form-control-sm" name="equipo" required>
                        <%
                        List<Equipo> listaEquipo = dao.listarEquipo();
                        for(Equipo na:listaEquipo){
                        %>
                        <option value="<%=na.getCodigoEquipo()%>"><%=na.getEquipo()%></option>
                        <%
                        }
                        %>                        
                    </select>
                </div>
                <div class="col-lg-4 col-md-12 col-sm-12">
                    <button class="btn btn-block btn-dark mt-4 btn-sm" name="btnAgregar" type="submit">Agregar</button>
                    <button class="btn btn-block btn-dark mt-4 btn-sm" name="btnEditar" type="submit">Editar</button>                 
                    <button class="btn btn-block btn-danger mt-4 btn-sm" name="btnEliminar" type="submit">Eliminar</button>   
                
                </div>                
            </div> 
        </div>
    </form>  
    <div class="container"> 
        <div class="row mb-4">
            <div class="col-lg-12 col-md-12 col-sm-12">
                <div class="table-responsive">
                    <table class="table">
                        <thead>
                            <tr class="table-active">
                                <th scope="col">Código</th>
                                <th scope="col">Nombre</th>
                                <th scope="col">Edad</th>
                                <th scope="col">Salario</th>
                                <th scope="col">Equipo</th>
                                <th scope="col"></th>
                            </tr>
                        </thead>
                        <tbody>
                         <%
                         List<Jugador> listaJugador = dao.listarJugador();
                         for(Jugador j:listaJugador){
                         %>
                            <tr>
                               
                                <td><%= j.getCodigoJugador() %></td>
                                <td><%= j.getNombre() %></td>
                                <td><%= j.getEdad() %></td>
                                <td><%= j.getSalario() %></td>
                                <td><%= j.getEquipo().getEquipo() %></td>
                                <td>
                                    <a class="btn btn-dark btn-sm" href="javascript:cargar(
                                       '<%= j.getCodigoJugador() %>','<%= j.getNombre() %>','<%= j.getEdad() %>',
                                       '<%= j.getSalario()%>','<%= j.getEquipo().getCodigoEquipo() %>')">Seleccionar</a>
                                </td>
                            </tr> 
                            <%
                            }
                            %>
                                                                               
                        </tbody>
                    </table>  
                </div> 
            </div>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
</body>
</html>
