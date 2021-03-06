/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import entity.Posts;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import rest.JerseyPosts;

/**
 *
 * @author Alberto
 */
@WebServlet(name = "AddPostServlet", urlPatterns = {"/AddPost"})
public class AddPostServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String type = request.getParameter("type");
        switch (type) {
            case "new":
                getServletContext().getRequestDispatcher("/addpost.jsp").forward(request, response);
                break;
            case "commit":
                String user = request.getParameter("user"),
                 title = request.getParameter("title"),
                 desc = request.getParameter("description"),
                 city = request.getParameter("city"),
                 thumbnail = request.getParameter("thumbnail");
                String[] images = request.getParameterValues("image");
                StringBuilder image = new StringBuilder(thumbnail != null
                        ? thumbnail.substring(0, thumbnail.length() - 4) + "_t.jpg" : "#");
                if (images != null) {
                    for (String i : images) {
                        image.append(";").append(i);
                    }
                }
                Posts post = new Posts();
                post.setAutor(URLEncoder.encode(user, "UTF-8"));
                post.setCiudad(URLEncoder.encode(city, "UTF-8"));
                post.setFechaCreacion(new Date());
                post.setImagen(image.toString());
                post.setTexto(URLEncoder.encode(desc, "UTF-8"));
                post.setTitulo(URLEncoder.encode(title, "UTF-8"));
                JerseyPosts jersey = new JerseyPosts();
                jersey.create(post);
                jersey.close();
                response.sendRedirect(getServletContext().getContextPath());
                break;
        }
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
