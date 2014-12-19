/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import entity.Comments;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;

/**
 *
 * @author Alberto
 */
@Stateless
@Path("entity.comments")
public class CommentsFacadeREST extends AbstractFacade<Comments> {
    @PersistenceContext(unitName = "Practica3ServerPU")
    private EntityManager em;

    public CommentsFacadeREST() {
        super(Comments.class);
    }

    @POST
    @Override
    @Consumes({"application/json"})
    public void create(Comments entity) {
        super.create(entity);
    }

    @PUT
    @Path("{id}")
    @Consumes({"application/json"})
    public void edit(@PathParam("id") Integer id, Comments entity) {
        super.edit(entity);
    }

    @DELETE
    @Path("{id}")
    public void remove(@PathParam("id") Integer id) {
        super.remove(super.find(id));
    }
    
    /**
     * Método para buscar la lista de comentarios de un post.
     * @param id La ID del post.
     * @return 
     */
    @GET
    @Path("post/{id}")
    @Produces({"application/json"})
    public List<Comments> findByPost(@PathParam("id") Integer id){
        return em.createNamedQuery("Comments.findByPostId", Comments.class).setParameter("postId", id)
                .getResultList();
    }

    @GET
    @Path("{id}")
    @Produces({"application/json"})
    public Comments find(@PathParam("id") Integer id) {
        return super.find(id);
    }

    @GET
    @Override
    @Produces({"application/json"})
    public List<Comments> findAll() {
        return super.findAll();
    }

    @GET
    @Path("{from}/{to}")
    @Produces({"application/json"})
    public List<Comments> findRange(@PathParam("from") Integer from, @PathParam("to") Integer to) {
        return super.findRange(new int[]{from, to});
    }

    @GET
    @Path("count")
    @Produces("text/plain")
    public String countREST() {
        return String.valueOf(super.count());
    }

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }
    
}
