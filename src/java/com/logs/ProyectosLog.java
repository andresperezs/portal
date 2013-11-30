package com.logs;

import proyectos.dao.ProyectosDao;
import java.util.logging.Logger;

public class ProyectosLog {
        private static volatile ProyectosLog instance = null;
 
        public static Logger logger;
        private ProyectosLog() {       }
 
        public static ProyectosLog getInstance() {
                if (instance == null) {
                        synchronized (ProyectosLog.class){
                                if (instance == null) {
                                        instance = new ProyectosLog ();
                                       
                                }
                      }
                }
                return instance;
        }
        
      
         public void log(String mensaje){
             
             ProyectosDao dao = new ProyectosDao("latam1");
             dao.ejecutar("insert into logger values('"+mensaje+"',null)");
             System.out.println(mensaje);
         }
}