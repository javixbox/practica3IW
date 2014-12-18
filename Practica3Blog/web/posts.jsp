<%-- 
    Document   : index
    Created on : 12-dic-2014, 19:35:56
    Author     : Alberto
--%>

<%@page import="java.util.List"%>
<%@page import="entity.Posts"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            List<Posts> posts = (List<Posts>) request.getAttribute("posts");
        %>
        <form method="POST" action="${pageContext.request.contextPath}/AddPost">
            <input type="hidden" name="type" value="new"/>
            <input type="submit" value="A&ntilde;adir entrada"/>
        </form>
        <table>
            <%
                if (posts.isEmpty()) {
            %>
            <tr><td>No existen elementos</td></tr>
            <% } else
                for (Posts p : posts) {
            %>
            <tr>
                <td><h2><a href="<%= getServletContext().getContextPath()%>/SeePost?id=<%= p.getId()%>">
                            <%= p.getTitulo()%></a></h2></td>
                <td><img src="<%= p.getImagen() != null ? p.getImagen().substring(0, p.getImagen().length() - 4) + "_t.jpg" : "#"%>"/></td>
                <td><%= p.getTexto().length() >= 150 ? p.getTexto().substring(0, 147) + "..."
                        : p.getTexto()%></td>
            </tr>
            <%
                }
            %>
        </table>
    </body>
</html>
