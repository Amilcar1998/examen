
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Usuario;
import modelo.Validar;

/**
 *
 * @author Chmod
 */
public class ProcesarLogin extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
      
        //Intancias
        Usuario u = new Usuario();
        Validar validar = new Validar();
        RequestDispatcher rd = null;
        try {
            //Captura de datos
            u.setUsername(request.getParameter("txtUsuario"));
            u.setClave(request.getParameter("txtPassword"));
            //Validar credenciales
            u.setNivel(validar.validarUsuario(u));
            //Pasar datos a jsp
            request.setAttribute("nivel", u.getNivel());
            request.setAttribute("username", u.getUsername());
            //Redireccionamiento
            rd = request.getRequestDispatcher("login.jsp");
            //response.sendRedirect("login.jsp");
        } catch (Exception e) {
            request.setAttribute("Error ", e.toString());
        }
        rd.forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
