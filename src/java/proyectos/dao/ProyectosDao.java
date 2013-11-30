/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package proyectos.dao;

import proyectos.action.ProyectosAction;
import proyectos.dominio.Proyecto;
import proyectos.form.ProyectoForm;
import dao.DbUtil;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ar00112343
 */
public class ProyectosDao {
    
    String region = "";
    
    public ProyectosDao(String moneda){
        region = moneda;
    }

    public HashMap<String, String> getEstados(String tipo) {
        
        DbUtil util = new DbUtil(region);
        HashMap<String, String> estados = new HashMap<String, String>();
        
        ResultSet rs = util.getResult("select id,descripcion from estados order by id asc ");        
        
        try {
            while(rs.next()){
        
               estados.put(rs.getString(1), rs.getString(2));
               
            }
        rs.close();util.closeConnection();      
        } catch (SQLException ex) {
           System.out.println(ex);
        }
        
        return estados;
            
    }
        
    public ArrayList<Proyecto> getListaProyectos(String nombre) {
        
        DbUtil util = new DbUtil(region);
        ArrayList<Proyecto> lista = new ArrayList<Proyecto>();
        ResultSet rs = util.getResult("select nombre,id,prioridad,clarity,lider,(select descripcion from estados where id=estado) "
                + " from proyectos_cabecera where nombre like '%"+nombre+"%' order by prioridad asc");        
        
        try {
            while(rs.next()){
        
               Proyecto proy =  new Proyecto();
               proy.setNombre(rs.getString(1));
               proy.setId(rs.getString(2));
               proy.setPrioridad(rs.getString(3));
               proy.setClarity(rs.getString(4));
               proy.setLider(rs.getString(5));
               proy.setEstado(rs.getString(6));
               lista.add(proy);
               
            }
        rs.close();
        util.closeConnection();     
        } catch (SQLException ex) {
           System.out.println(ex);      
        }
        
        return lista;
    }
    
    public void setInfo(int id,ProyectoForm form) {
        
        DbUtil util = new DbUtil(region);
        ResultSet rs = util.getResult("select nombre,prioridad,clarity,estado,lider from proyectos_cabecera where id= "+id+" order by nombre");        
        
        try {
            while(rs.next()){
        
              
               form.setNombre(rs.getString(1));
               form.setPrioridad(rs.getString(2));
               form.setClarity(rs.getString(3));
               form.setEstado(rs.getString(4));
               form.setLider(rs.getString(5));
               
            }
            rs.close();
            util.closeConnection();     
        } catch (SQLException ex) {
           System.out.println(ex);      
        }
        
    }
    
     public ArrayList<Proyecto> getListaDetalles(int indice) {
        
        DbUtil util = new DbUtil(region);
        ArrayList<Proyecto> lista = new ArrayList<Proyecto>();
        ResultSet rs = util.getResult("select * from proyectos_detalle where id='"+indice+"' order by orden desc");        
        
        try {
            while(rs.next()){
        
               Proyecto proy =  new Proyecto();
               proy.setId(rs.getString(1));
               proy.setOrden(rs.getInt(2));
               proy.setObservaciones(rs.getString(3));
               proy.setFecha(rs.getString(4));
               lista.add(proy);
               
            }
        rs.close();
        util.closeConnection();     
        
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        
        return lista;
    }
     
     public String getObservacion(int indice,String idDetalle) {
        
        DbUtil util = new DbUtil(region);
        String obs = util.queryValor("select observaciones from proyectos_detalle "
                + " where id='"+indice+"' and orden='"+idDetalle+"'");        
        
        return obs;
    }
     
  
    public int getIdProyecto() {
        
        DbUtil util = new DbUtil(region);
        int resultado = 1;
        
        ResultSet rs = util.getResult(" select max(id)+1 from proyectos_cabecera ");        
        
        try {
            while(rs.next()){
        
              resultado = rs.getInt(1);
               
            }
        rs.close();
        util.closeConnection();     
        } catch (SQLException ex) {
            Logger.getLogger(ProyectosAction.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return resultado;
            
    }
     
     public int getIdDetalle(int id) {
        
        DbUtil util = new DbUtil(region);
        int resultado = 1;
        
        ResultSet rs = util.getResult("select nvl(max(CONVERT(orden,UNSIGNED INTEGER)),0)+1 from  proyectos_detalle where id ='"+id+"' ");        
        
        try {
            while(rs.next()){
        
              resultado = rs.getInt(1);
               
            }
        rs.close();util.closeConnection();     
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        
        return resultado;
            
    }
   

    public boolean ejecutar(String string) {
        
        DbUtil util = new DbUtil(region);
        boolean retorno = util.ejecutar(string); 
        util.closeConnection();
        return retorno;
    }

    public boolean existeId(String id) {
        
        DbUtil util = new DbUtil(region);
        int resultado=0;
        if(id.equals(""))
            return false;
        
        ResultSet rs = util.getResult(" select count(*) "
                + "from proyectos_detalle where CONCAT(cotizacion_id,producto_id,ambiente)="+id);        
        
        try {
            while(rs.next()){
        
              resultado = rs.getInt(1);
               
            }
        rs.close();util.closeConnection();     
        } catch (SQLException ex) {
           System.out.println(ex);
        }
        
        if(resultado > 0)
            return true;
        
        return false;
    }

    public String getSimboloMoneda() {
        
        DbUtil util = new DbUtil(region);
        String resultado = "";
        
        ResultSet rs = util.getResult(" select valor from parametros where descripcion ='moneda'");        
        
        try {
            while(rs.next()){
        
              resultado = rs.getString(1);
               
            }
        rs.close();util.closeConnection();     
        } catch (SQLException ex) {
           System.out.println(ex);
        }
        
        return resultado;
    }
}
