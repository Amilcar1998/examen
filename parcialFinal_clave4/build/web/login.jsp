<%-- 
    Document   : login
    Created on : 30-oct-2020, 8:50:22
    Author     :Chmod
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
</head>
<body>
         <%
        //Sesión
        HttpSession sesion = request.getSession();
        int nivel;
        if(request.getAttribute("nivel")!=null){
            //Variables de sesión
            sesion.setAttribute("nivel", request.getAttribute("nivel"));
            sesion.setAttribute("username", request.getAttribute("username"));
            //Nivel de acceso
            nivel = (Integer)request.getAttribute("nivel");
            if(nivel==1){
                //Administrador
                response.sendRedirect("Administrador/jugador.jsp");
            } 
        }
        //Cerrar sesión
        if(request.getParameter("cerrar")!=null){
            sesion.invalidate();
        }
    %>
    <div class="d-flex align-items-center min-vh-100 bg-dark"> 
        <div class="container">
            <div class="row">            
                <div class="col-lg-5 col-md-6 col-sm-12 mx-auto">                
                    <div class="card">
                        <div class="card-body">
                            <h3 class="text-center mb-4">Login</h3>
                            <form action="ProcesarLogin" method="POST">
                                <div class="form-group">
                                    <label>Usuario</label>
                                    <input type="text" class="form-control form-control-sm" name="txtUsuario" required>
                                </div>
                                <div class="form-group mb-4">
                                    <label>Contraseña</label>
                                    <input type="password" class="form-control form-control-sm" name="txtPassword" required>
                                </div>
                                <button type="submit" class="btn btn-dark btn-block btn-sm btn-pill" name="btnLogin">Login</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
</body>
</html>
