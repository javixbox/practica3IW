<%-- 
    Document   : index
    Created on : 12-dic-2014, 19:35:56
    Author     : Alberto
--%>

<%@page import="java.net.URLDecoder"%>
<%@page import="java.util.List"%>
<%@page import="entity.Posts"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Aplicaci&oacute;n de blogs</title>
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
                            <%= URLDecoder.decode(p.getTitulo(), "UTF-8") %></a></h2></td>
                <td><img src="<%= p.getImagen() != null ? p.getImagen().split(";")[0] : "#"%>"/></td>
                <td><%= p.getTexto().length() >= 150 ? URLDecoder.decode(p.getTexto(), "UTF-8")
                        .substring(0, 147) + "..." : URLDecoder.decode(p.getTexto(), "UTF-8") %></td>
            </tr>
            <%
                }
            %>
        </table>
    </body>
</html>
