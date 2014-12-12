/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import entity.Posts;
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
@Path("entity.posts")
public class PostsFacadeREST extends AbstractFacade<Posts> {
    @PersistenceContext(unitName = "Practica3ServerPU")
    private EntityManager em;

    public PostsFacadeREST() {
        super(Posts.class);
    }

    @POST
    @Override
    @Consumes({"application/xml", "application/json"})
    public void create(Posts entity) {
        super.create(entity);
    }

    @PUT
    @Path("{id}")
    @Consumes({"application/xml", "application/json"})
    public void edit(@PathParam("id") Integer id, Posts entity) {
        super.edit(entity);
    }

    @DELETE
    @Path("{id}")
    public void remove(@PathParam("id") Integer id) {
        super.remove(super.find(id));
    }

    @GET
    @Path("{id}")
    @Produces({"application/xml", "application/json"})
    public Posts find(@PathParam("id") Integer id) {
        return super.find(id);
    }
    
    /**
     * Metodo para buscar una entrada dando el nombre de una ciudad.
     * @param city
     * @return 
     */
    @GET
    @Path("{city}")
    @Produces({"application/xml", "application/json"})
    public List<Posts> find(@PathParam("city") String city){
        return em.createNamedQuery("Posts.findByCiudad", Posts.class).setParameter("ciudad", city)
                .getResultList();
    }

    @GET
    @Override
    @Produces({"application/xml", "application/json"})
    public List<Posts> findAll() {
        return super.findAll();
    }

    @GET
    @Path("{from}/{to}")
    @Produces({"application/xml", "application/json"})
    public List<Posts> findRange(@PathParam("from") Integer from, @PathParam("to") Integer to) {
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
