/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package proyectos.contributor;

import com.logs.ProyectosLog;
import proyectos.form.ProyectoForm;
import dao.DbUtil;
import java.io.InputStream;
import java.sql.Connection;
import java.util.HashMap;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.design.JasperDesign;
import net.sf.jasperreports.engine.fonts.FontUtil;
import net.sf.jasperreports.engine.xml.JRXmlLoader;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author ar00112343
 */
public class ProyectosContibutor {
    
    public ProyectosContibutor(){

    };
    
   
    public void exportar(HttpServletRequest request, ProyectoForm proyectosForm,HttpServletResponse res) {
       
            DbUtil dbUtil = new DbUtil(proyectosForm.getMoneda());
            try {
            
            Connection con = dbUtil.getConnection();
            
            ProyectosLog.getInstance().log("ok conexion base - reporte");
            InputStream template = request.getSession().getServletContext().getResourceAsStream("/reportes/cotizacionesReport.jrxml");
               
            int id = proyectosForm.getIndice();
            HashMap map = new HashMap();
            map.put("id",id); 
            map.put("nombre",proyectosForm.getDescripcion()); 
            map.put("total",String.valueOf(proyectosForm.getTotal())); 
            ProyectosLog.getInstance().log("indice - reporte" + id);
            res.setContentType( "application/pdf" );  
            res.setHeader("Content-disposition","attachment; filename=" +"cotizacion.pdf" );
               
                ServletOutputStream servletOutputStream = res.getOutputStream();
                ProyectosLog.getInstance().log(template.toString());
                JasperDesign jasperDesign = JRXmlLoader.load(template);
                ProyectosLog.getInstance().log("post load");
                JasperReport jasperReport = JasperCompileManager.compileReport(jasperDesign);
                ProyectosLog.getInstance().log("post compile");
                JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport,map,con);
                ProyectosLog.getInstance().log("ok pre export");
                JasperExportManager.exportReportToPdfStream(jasperPrint, servletOutputStream);
                ProyectosLog.getInstance().log("ok post export");
                servletOutputStream.flush();
                servletOutputStream.close(); 
                dbUtil.closeConnection();
                
            } catch (Exception ex) {
             
             dbUtil.closeConnection();
             ProyectosLog.getInstance().log("a- "+ex.getMessage());
             dbUtil.closeConnection();
             
             ProyectosLog.getInstance().log("error");
             ProyectosLog.getInstance().log(ex.getMessage());
            }  
       
    }
    
    
}
