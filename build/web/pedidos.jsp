<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="ModeloDAO.*"%>
<%@page import="Modelo.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Highway</title>
        <link rel="stylesheet" href="estilo.css">
        <script src="js/jquery-3.3.1.min.js"></script>
    </head>
    <body class="body2">
        <nav class="header">
            <img src="img/logo.jpg" alt="logo" width="230px"/>
            <ul>
                <li><a href="index.jsp">Inicio</a></li>
                <li><a href="pedidos.jsp">Ver Pedidos</a></li>
                <li><a href="ayuda.jsp">Ayuda</a></li>
            </ul>
        </nav>
        <div class="article">
            <form action="Controller">
                <h1>Ingrese rut:</h1> <input type="text" name="txtrut"/><button type="button" value="buscar">Buscar</button>
            </form>
            
            <table class="formulario">
                <thead>
                    <tr>
                        <th><h1>Id Pedido</h1></th>
                        <th><h1>Total</h1></th>
                        <th><h1></h1></th>
                    </tr>
                </thead>
                <%
                    Queries q = new Queries();
                    List<Boleta> list = q.listarBOL();
                    Iterator<Boleta> iter = list.iterator();
                    Boleta boleta = null;
                    while (iter.hasNext()) {
                        boleta = iter.next();
                %>
                <tbody>
                    <tr>
                        <td><%= boleta.getId_boleta()%></td>
                        <td><%= boleta.getTotal()%></td>
                        <td>
                            <a style="padding: 10px 10px 10px 10px" href="Controller?accion=editar&id=<%= boleta.getId_boleta()%>">Editar</a>
                            <a style="padding: 10px 10px 10px 10px" href="Controller?accion=eliminar&id=<%= boleta.getId_boleta()%>">Eliminar</a>
                        </td>
                    </tr>
                    <%}%>
                </tbody>
            </table>
        </div>
        <div class="aside">
            <a href="carreteras.jsp">Ver Carreteras</a>
        </div>
    </body>
</html>
