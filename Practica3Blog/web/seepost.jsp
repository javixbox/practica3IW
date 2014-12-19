<%-- 
    Document   : seepost
    Created on : 19-dic-2014, 15:28:48
    Author     : Alberto
--%>

<%@page import="java.util.List"%>
<%@page import="entity.Comments"%>
<%@page import="entity.Posts"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%
        Posts p = (Posts) request.getAttribute("post");
        List<Comments> comments = (List<Comments>) request.getAttribute("comments");
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%= p.getTitulo()%></title>
        <link rel="stylesheet" href="http://code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
        <script src="http://code.jquery.com/jquery-1.10.2.js"></script>
        <script src="http://code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
        <script>
            $(document).ready(function () {
                $("#map").load(function () {
                    $("#map").contents().find("#panel").hide();
                    $("#map").contents().find("#address").val(document.getElementById('city').value);
                    $("#map")[0].contentWindow.codeAddress();
                });
            });
        </script>
    </head>
    <body>
        <div>
            <h1><%= p.getCiudad()%> - <%= p.getTitulo()%></h1>
            <img src="<%= p.getImagen() != null ? p.getImagen().split(";")[0] : "#"%>"/>
        </div>
        <input id="city" type="hidden" value="<%= p.getCiudad()%>"/>
        <div>
            Created by: <%= p.getAutor()%> at <%= p.getFechaCreacion().toString()%>
        </div>
        <div>
            <p><%= p.getTexto()%></p>
        </div>
        <div>
            <%
                String[] images = p.getImagen().split(";");
                boolean ignore = true;
                for (String i : images) {
                    if (ignore) {
                        ignore = false;
                        continue;
                    }
            %>
            <img src="<%= i%>"/>
            <%
                }
            %>
        </div>
        <iframe id="map" height="400px" width="100%" frameborder="0" scrolling="no"
                src="${pageContext.request.contextPath}/map.html"></iframe>
        <div id="comments">
            Comentarios:<br/>
            <%
                for(Comments c : comments){
                    
                }
            %>
        </div>
    </body>
</html>
