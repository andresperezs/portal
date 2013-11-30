/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package proyectos.dominio;

/**
 *
 * @author ar00112343
 */
public class Proyecto {
    
    private String id;
    private int orden;
    private String nombre;
    private String descripcion;
    private String observaciones;
    private String fecha_ini;
    private String fecha_fin;
    private String estado;
    private String lider;
    private String interesado;
    private String prioridad;
    private String clarity;
    private String fecha;

    public Proyecto(){

    };

    /**
     * @return the id
     */
    public String getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(String id) {
        this.id = id;
    }

    /**
     * @return the orden
     */
    public int getOrden() {
        return orden;
    }

    /**
     * @param orden the orden to set
     */
    public void setOrden(int orden) {
        this.orden = orden;
    }

    /**
     * @return the descripcion
     */
    public String getDescripcion() {
        return descripcion;
    }

    /**
     * @param descripcion the descripcion to set
     */
    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    /**
     * @return the observaciones
     */
    public String getObservaciones() {
        return observaciones;
    }

    /**
     * @param observaciones the observaciones to set
     */
    public void setObservaciones(String observaciones) {
        this.observaciones = observaciones;
    }

    /**
     * @return the fecha_ini
     */
    public String getFecha_ini() {
        return fecha_ini;
    }

    /**
     * @param fecha_ini the fecha_ini to set
     */
    public void setFecha_ini(String fecha_ini) {
        this.fecha_ini = fecha_ini;
    }

    /**
     * @return the fecha_fin
     */
    public String getFecha_fin() {
        return fecha_fin;
    }

    /**
     * @param fecha_fin the fecha_fin to set
     */
    public void setFecha_fin(String fecha_fin) {
        this.fecha_fin = fecha_fin;
    }

    /**
     * @return the estado
     */
    public String getEstado() {
        return estado;
    }

    /**
     * @param estado the estado to set
     */
    public void setEstado(String estado) {
        this.estado = estado;
    }

    /**
     * @return the lider
     */
    public String getLider() {
        return lider;
    }

    /**
     * @param lider the lider to set
     */
    public void setLider(String lider) {
        this.lider = lider;
    }

    /**
     * @return the interesado
     */
    public String getInteresado() {
        return interesado;
    }

    /**
     * @param interesado the interesado to set
     */
    public void setInteresado(String interesado) {
        this.interesado = interesado;
    }

    /**
     * @return the pgi
     */
    public String getPrioridad() {
        return prioridad;
    }

    /**
     * @param pgi the pgi to set
     */
    public void setPrioridad(String prioridad) {
        this.prioridad = prioridad;
    }

    /**
     * @return the clarity
     */
    public String getClarity() {
        return clarity;
    }

    /**
     * @param clarity the clarity to set
     */
    public void setClarity(String clarity) {
        this.clarity = clarity;
    }

    /**
     * @return the nombre
     */
    public String getNombre() {
        return nombre;
    }

    /**
     * @param nombre the nombre to set
     */
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    /**
     * @return the fecha
     */
    public String getFecha() {
        return fecha;
    }

    /**
     * @param fecha the fecha to set
     */
    public void setFecha(String fecha) {
        this.fecha = fecha;
    }
    
    
}
