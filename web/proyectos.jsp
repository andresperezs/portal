<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<html>
    <head>
        <title>Cotizaciones</title>

        <script type="text/javascript">
         
            function buscar()
            {
               document.forms["ProyectoForm"]["accion"].value="buscar";
               document.forms["ProyectoForm"].submit();
            }
            
            function borrar(indice)
            {
               document.forms["ProyectoForm"]["accion"].value="borrar";
               document.forms["ProyectoForm"]["indice"].value=indice;
               document.forms["ProyectoForm"].submit();
            }
            
            function detalle(indice)
            {
               document.forms["ProyectoForm"]["accion"].value="detalle";
               document.forms["ProyectoForm"]["indice"].value=indice;
               document.forms["ProyectoForm"].submit();
            }
            
            function edit(indice)
            {
               document.forms["ProyectoForm"]["accion"].value="editInfo";
               document.forms["ProyectoForm"]["indice"].value=indice;
               document.forms["ProyectoForm"].submit();
            }
            
            function nuevo()
            {
               document.forms["ProyectoForm"]["accion"].value="crearProyecto";
               document.forms["ProyectoForm"].submit();
            }
            
            function exportar()
            {
               document.forms["ProyectoForm"]["accion"].value="exportar";
               document.forms["ProyectoForm"].submit();
            }
        </script>

    </head>
     <body background="images/prosegurFondo.jpg"  style="width:98%; text-align:center; margin-top:50px;">

        <div style="color:red">
            <html:errors />
        </div>
        <html:form action="/proyectos" >
            
            <html:hidden name="ProyectoForm" property="accion" />
            <html:hidden name="ProyectoForm" property="indice" />
            <html:hidden name="ProyectoForm" property="descripcion" />
            <div style="background-color:#FFCC01">   
            <hr style="color: black">
            <table>
                <tr>    

                   
                    <td>
                        <button style="border: solid 1px #2A4E77;text-decoration: none;" 
                                name="search" onclick="buscar();">Buscar</button> 
                    </td>
                    <td>
                        <button style="border: solid 1px #2A4E77;text-decoration: none;" 
                                name="new" onclick="nuevo();">Nuevo</button> 
                    </td>
                    <td>
                        <html:text name="ProyectoForm"  size="35" maxlength="20" value="" property="nombre" />
                    </td>  
                </tr>
            </table>
            <hr style="color: black">
            </div> 
            <table  style="width:100%; text-align:center; border-collapse: collapse;" id="dataTable" border="2" bordercolor="BLACK">
                <tr>
                    <td bgcolor="#000000"><b><font color="yellow">&nbsp&nbsp</font></b></td> 
                    <td bgcolor="#000000"><b><font color="yellow">&nbsp&nbsp</font></b></td> 
                    <td bgcolor="#000000"><b><font color="yellow">&nbsp&nbsp</font></b></td> 
                    <td bgcolor="#000000"><b><font color="yellow">&nbsp&nbsp</font></b></td> 
                    <td bgcolor="#000000"><b><font color="FFCC01">Nombre del proyecto</font></b></td>      
                    <td bgcolor="#000000"><b><font color="FFCC01">Prioridad</font></b></td>  
                    <td bgcolor="#000000"><b><font color="FFCC01">Clarity</font></b></td>  
                    <td bgcolor="#000000"><b><font color="FFCC01">Estado</font></b></td>  
                    <td bgcolor="#000000"><b><font color="FFCC01">Lider</font></b></td>  
                </tr>
            
                <c:forEach var="proyectos" items="${ProyectoForm.lista}">
                        <tr>
                            <c:if test="${ProyectoForm.perfil == 1}">
                            <td bgcolor="#E6E6E6"><img src="images/delete.png" width="20" height="20" alt="delete" onclick="borrar(${proyectos.id});"/>
                            </td>
                            </c:if>
                            <c:if test="${ProyectoForm.perfil != 1}">
                            <td>
                            </td>
                            </c:if>
                            <td bgcolor="#E6E6E6"><img src="images/lupa.jpg" width="20" height="20" alt="ver comentarios" onclick="detalle(${proyectos.id});"/>
                            </td>
                            <td bgcolor="#E6E6E6"><img src="images/info.jpg" width="20" height="20" alt="Editar informacion" onclick="edit(${proyectos.id});"/>
                            </td>
                            
                            <td bgcolor="#E6E6E6"><img src="images/pdf.png" width="20" height="20" alt="exportar" onclick="exportarDetalle(${proyectos.id},'${proyectos.nombre}');"/>
                            </td>
                            
                            <td bgcolor="#E6E6E6"><font face="times new roman" color="black"><c:out value="${proyectos.nombre}"/></font></td>
                            <td bgcolor="#E6E6E6"><font face="times new roman" color="black"><c:out value="${proyectos.prioridad}"/></font></td>
                            <td bgcolor="#E6E6E6"><font face="times new roman" color="black"><c:out value="${proyectos.clarity}"/></font></td>
                            <td bgcolor="#E6E6E6"><font face="times new roman" color="black"><c:out value="${proyectos.estado}"/></font></td>
                            <td bgcolor="#E6E6E6"><font face="times new roman" color="black"><c:out value="${proyectos.lider}"/></font></td>
                        </tr>
                 </c:forEach>
                        
            </table>  
    
        </html:form>
    </body>
</html>