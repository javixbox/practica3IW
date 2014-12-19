<%-- 
    Document   : seepost
    Created on : 19-dic-2014, 15:28:48
    Author     : Alberto
--%>

<%@page import="java.net.URLDecoder"%>
<%@page import="java.text.DateFormat"%>
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
        <title><%= URLDecoder.decode(p.getTitulo(), "UTF-8") %></title>
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

            var request;

            function addComment() {
                var user = document.getElementById('userId').value;
                var comment = document.getElementById('commentId').value;
                document.getElementById('userId').value = '';
                document.getElementById('commentId').value = '';
                if (request)
                    request.abort();
                request = $.ajax({
                    url: "${pageContext.request.contextPath}/AddComment",
                    type: "POST",
                    data: {
                        username: user,
                        commentText: comment,
                        id: $("#postId").val()
                    },
                    success: function (data, textStatus, jqXHR) {
                        $("#comments").append(data);
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        alert('Error: ' + errorThrown);
                    }
                });
            }
        </script>
    </head>
    <body>
        <div>
            <h1><%= URLDecoder.decode(p.getCiudad(), "UTF-8") %>
                - <%= URLDecoder.decode(p.getTitulo(), "UTF-8") %></h1>
            <img src="<%= p.getImagen() != null ? p.getImagen().split(";")[0] : "#"%>"/>
        </div>
            <input id="city" type="hidden" value="<%= URLDecoder.decode(p.getCiudad(), "UTF-8") %>"/>
        <div>
            Created by: <%= URLDecoder.decode(p.getAutor(), "UTF-8") %> at <%= DateFormat.getInstance().format(p.getFechaCreacion()) %>
        </div>
        <div>
            <p><%= URLDecoder.decode(p.getTexto(), "UTF-8") %></p>
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
        <br/><h3>Comentarios:</h3><br/>
            <div id="comments">
                <%
                    for (Comments c : comments) {
                %>
                <div>
                    <b><%= URLDecoder.decode(c.getAutor(), "UTF-8") %>:</b><br/>
                    <small><%= DateFormat.getInstance().format(c.getFechaCreacion()) %></small><br/>
                    <%= URLDecoder.decode(c.getCommentText(), "UTF-8") %>
                </div>
                <%
                    }
                %>
            </div><br/>
            <div>Usuario:<br/><input id="userId" type="text" name="user"/></div>
            <div>Comentario:<br/><textarea id="commentId" cols="150" rows="3" name="comment"></textarea></div>
            <input type="submit" value="A&ntilde;adir" onclick="addComment()"/>
            <input id="postId" type="hidden" value="<%= p.getId()%>"/>
    </body>
</html>
