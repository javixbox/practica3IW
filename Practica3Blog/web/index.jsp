<%-- 
    Document   : index
    Created on : 12-dic-2014, 19:35:56
    Author     : Alberto
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Aplicaci&oacute;n de blogs</title>
    </head>
    <body>
        <% getServletContext().getRequestDispatcher("/index").forward(request, response); %>
    </body>
</html>
