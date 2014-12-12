<%-- 
    Document   : index
    Created on : 12-dic-2014, 19:35:56
    Author     : Alberto
--%>

<%@page import="java.util.List"%>
<%@page import="entity.Posts"%>
<%@page import="rest.JerseyPosts"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            getServletContext().getRequestDispatcher("/TestServlet").forward(request, response);
        %>
        <h1>Hello World!</h1>
    </body>
</html>
