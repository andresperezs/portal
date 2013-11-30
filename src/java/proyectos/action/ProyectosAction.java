/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package proyectos.action;
import proyectos.contributor.ProyectosContibutor;
import proyectos.dao.ProyectosDao;
import dao.DbUtil;
import proyectos.dominio.Proyecto;
import proyectos.form.ProyectoForm;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author ar00112343
 */
public class ProyectosAction extends Action{
    
    private final static String INDEX= "showIndex";
    private final static String VER_DETALLE= "detalle";
    private final static String VOLVER= "volver";
    private final static String BUSCAR= "buscar";
    private final static String BUSCAR_DETALLE= "buscarDetalle";
    private final static String EMPTY= "vacio";
    private final static String BORRAR_COTIZACION= "borrar";
    private final static String BORRAR_COTIZACION_DETALLE= "borrarDetalle";
    private final static String ALTA_COMENTARIO= "create";   
    private final static String INSERTAR_DETALLE= "insertarDetalle"; 
    private final static String EXPORTAR= "exportarDetalle"; 
    private final static String EDITAR_DETALLE= "editar"; 
    private final static String INFO="saveInfo";
    private final static String EDITINFO="editInfo";
    private final static String CREATE="crearProyecto";
    
    public ActionForward execute(ActionMapping mapping,ActionForm form,HttpServletRequest request,
            HttpServletResponse response)
                {
                   ProyectoForm proyectosForm = (ProyectoForm) form;
                   
                   System.out.println("ACCION - "+proyectosForm.getAccion());
                   getUser(proyectosForm,request);
                    
                   if (proyectosForm.getAccion().equals(INDEX))
                       return showIndex(mapping);
                   if (proyectosForm.getAccion().equals(VER_DETALLE))
                       return verDetalle(mapping,request,proyectosForm);
                   if (proyectosForm.getAccion().equals(BUSCAR))
                       return  buscar(mapping,request,proyectosForm);
                   if (proyectosForm.getAccion().equals(BUSCAR_DETALLE))
                       return  verDetalle(mapping,request,proyectosForm);
                   if (proyectosForm.getAccion().equals(VOLVER))
                       return  buscar(mapping,request,proyectosForm);
                   if (proyectosForm.getAccion().equals(BORRAR_COTIZACION))
                       return borrar(mapping,request,proyectosForm);
                   if (proyectosForm.getAccion().equals(BORRAR_COTIZACION_DETALLE))
                       return borrarDetalle(mapping,request,proyectosForm);
                   if (proyectosForm.getAccion().equals(ALTA_COMENTARIO))
                       return create(mapping,request,proyectosForm);
                   if (proyectosForm.getAccion().equals(INSERTAR_DETALLE))
                       return insertarDetalle(mapping,request,proyectosForm);
                   if (proyectosForm.getAccion().equals(EXPORTAR))
                       exportar(mapping,request,proyectosForm,response);
                   if (proyectosForm.getAccion().equals(EDITAR_DETALLE))
                       return editar(mapping,request,proyectosForm);
                   if (proyectosForm.getAccion().equals(INFO))
                       return saveInfo(mapping,request,proyectosForm);
                   if (proyectosForm.getAccion().equals(EDITINFO))
                       return editProyecto(mapping,request,proyectosForm);
                   if (proyectosForm.getAccion().equals(CREATE))
                       return crearProyecto(mapping,request,proyectosForm);
                   
                   return null;
                }

    private ActionForward showIndex(ActionMapping mapping) {
         
        return mapping.findForward(EMPTY);
    }
    
    private ActionForward buscar(ActionMapping mapping,HttpServletRequest request,ProyectoForm form) {
        
        ProyectosDao dao = new ProyectosDao(form.getMoneda());
        
        ArrayList<Proyecto> lista = dao.getListaProyectos(form.getNombre());
           
        form.setLista(lista);
        request.setAttribute("lista",lista );
        
        if(lista.isEmpty())
            return mapping.findForward(EMPTY);
        else    
            return mapping.findForward(INDEX);
    }
    
    private ActionForward verDetalle(ActionMapping mapping,HttpServletRequest request,ProyectoForm form) {
        
        ProyectosDao dao = new ProyectosDao(form.getMoneda());
        
        ArrayList<Proyecto> lista = dao.getListaDetalles(form.getIndice());
        
        form.setLista(lista);
        form.setSimbolo(dao.getSimboloMoneda());
        request.setAttribute("lista",lista );
       
        if(lista.isEmpty())
            return mapping.findForward("vacioDetalle");
        else    
            return mapping.findForward("showDetalle");
    }
    
    private ActionForward crearProyecto(ActionMapping mapping,HttpServletRequest request,ProyectoForm form) {
        
        ProyectosDao dao = new ProyectosDao(form.getMoneda());
        form.setIndice(dao.getIdProyecto());
        form.setPrioridad("");
        form.setNombre("");
        form.setClarity("");
        form.setEstado("");
        form.setLider("");
        dao.setInfo(form.getIndice(),form);
        request.setAttribute("estados", dao.getEstados(form.getMoneda())); 
        
        return mapping.findForward("editInfo");
    }
    
    private ActionForward editProyecto(ActionMapping mapping,HttpServletRequest request,ProyectoForm form) {
        
        ProyectosDao dao = new ProyectosDao(form.getMoneda());
        dao.setInfo(form.getIndice(),form);
        request.setAttribute("estados", dao.getEstados(form.getMoneda())); 
        
        return mapping.findForward("editInfo");
    }
    
    private ActionForward borrar(ActionMapping mapping,HttpServletRequest request,ProyectoForm form) {
        
        DbUtil util = new DbUtil(form.getMoneda());
        
        util.ejecutar("delete from proyectos_detalle where id='"+form.getIndice()+"'"); 
        util.ejecutar("delete from proyectos_cabecera where id='"+form.getIndice()+"'");        
        util.closeConnection();
        return  buscar(mapping,request,form);
    }
    
    private ActionForward borrarDetalle(ActionMapping mapping,HttpServletRequest request,ProyectoForm form) {
        
        DbUtil util = new DbUtil(form.getMoneda());
        util.ejecutar("delete from proyectos_detalle where id='"+form.getIndice()+"' and orden='"+form.getIdDetalle()+"'");        
        util.closeConnection();
        return  verDetalle(mapping,request,form);
    }
     
    private ActionForward insertarDetalle(ActionMapping mapping,HttpServletRequest request,ProyectoForm form) {
        
        ProyectosDao dao = new ProyectosDao(form.getMoneda());
        int id = form.getIndice(); 
        
        if(form.getEdita().equals("N")){
            int idDetalle = dao.getIdDetalle(id); 
            dao.ejecutar("insert into proyectos_detalle values ('"+id+"','"+idDetalle+"','"+form.getObservaciones()+"',null)");
        }else{
            int idDetalle = (dao.getIdDetalle(id)-1); 
            dao.ejecutar("delete from proyectos_detalle where id='"+id+"' and orden='"+idDetalle+"'");
            dao.ejecutar("insert into proyectos_detalle values ('"+id+"','"+idDetalle+"','"+form.getObservaciones()+"',null)");
        }
        
        return  verDetalle(mapping,request,form);
    }
    
    private ActionForward create(ActionMapping mapping,HttpServletRequest request,ProyectoForm form) {
         
        form.setIdDetalle("");
        form.setObservaciones("");
        request.setAttribute("descripcion", "");
        form.setEdita("N");
        return mapping.findForward(ALTA_COMENTARIO);
    }
    
    private ActionForward saveInfo(ActionMapping mapping,HttpServletRequest request,ProyectoForm form) {
         
        ProyectosDao dao = new ProyectosDao(form.getMoneda());
        int id = form.getIndice();
        
        dao.ejecutar("delete from proyectos_cabecera where id="+id);
        dao.ejecutar("insert into proyectos_cabecera values("+id+",'"+form.getNombre()+"','"+form.getPrioridad()+"','"
                +form.getClarity()+"',null,null,'"+form.getEstado()+"','"+form.getLider()+"', null)");    
        
        form.setNombre("");
        return  buscar(mapping,request,form);
    }
    
 
    private void exportar(ActionMapping mapping, HttpServletRequest request, ProyectoForm proyectosForm,HttpServletResponse res) {
       
        ProyectosContibutor cc = new ProyectosContibutor();
        cc.exportar(request, proyectosForm, res);    
            
    }
    
    private ActionForward editar(ActionMapping mapping,HttpServletRequest request,ProyectoForm proyectosForm) {
         
        ProyectosDao dao = new ProyectosDao(proyectosForm.getMoneda());
        
        int id = proyectosForm.getIndice();
        String idDetalle = proyectosForm.getIdDetalle();        
        proyectosForm.setEdita("S");
        proyectosForm.setObservaciones(dao.getObservacion(id,idDetalle));         
        return mapping.findForward(ALTA_COMENTARIO);
    }
    
    private void getUser(ProyectoForm form,HttpServletRequest request) {
        
         HttpSession session = request.getSession();
         form.setUsuario(session.getAttribute("UserName").toString());
         form.setMoneda(session.getAttribute("region").toString());
         DbUtil dbu = new DbUtil(form.getMoneda());
         form.setPerfil(dbu.queryValor("select tipo from usuarios where id='"+form.getUsuario()+"'"));
         System.out.println("FIN GETUSER - ");
    }
    
}