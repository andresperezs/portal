<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<html>
    <head>
        <title>Alta de cotizaciones</title>

        <script type="text/javascript">
         
            function buscar()
            {
               document.forms["ProyectoForm"]["accion"].value="buscarDetalle";
               document.forms["ProyectoForm"].submit();
            }
            
            function borrar(indice,idDetalle)
            {
              
               document.forms["ProyectoForm"]["accion"].value="borrarDetalle";
               document.forms["ProyectoForm"]["idDetalle"].value=idDetalle;  
               document.forms["ProyectoForm"]["indice"].value=indice;
              
               document.forms["ProyectoForm"].submit();
            }
            
            function editar(indice,idDetalle)
            {
              
               document.forms["ProyectoForm"]["accion"].value="editar";
               document.forms["ProyectoForm"]["idDetalle"].value=idDetalle;  
               document.forms["ProyectoForm"]["indice"].value=indice;
              
               document.forms["ProyectoForm"].submit();
            }
            
            function volver()
            {
               document.forms["ProyectoForm"]["accion"].value="volver";
               document.forms["ProyectoForm"].submit();
            }
            
            function nuevo()
            {
               document.forms["ProyectoForm"]["accion"].value="create";
               document.forms["ProyectoForm"].submit();
            }
            
        </script>

    </head>
    <body background="images/prosegurFondo.jpg">

        <div style="color:red">
            <html:errors />
        </div>
        <html:form action="/proyectos" >
            
            <html:hidden name="ProyectoForm" property="accion" />
            <html:hidden name="ProyectoForm" property="indice" />
            <html:hidden name="ProyectoForm" property="idDetalle" />
            <div style="background-color:#FFCC01">    
            <hr style="color: black">
            <table>
                <tr>    

                    <td>
                        <button style="border: solid 1px #2A4E77;text-decoration: none;" 
                                name="search" onclick="buscar();">Buscar</button> 
                    </td>
                    
                    <c:if test="${ProyectoForm.perfil == 1}">
                    <td>
                        <button style="border: solid 1px #2A4E77;text-decoration: none;" 
                                name="new" onclick="nuevo();">Agregar Comentarios</button> 
                    </td>
                    </c:if>
            </table>
            
            <hr style="color: black">
            </div>      
            <table  style="width:100%; text-align:center; border-collapse: collapse;" id="dataTable" border="1" bordercolor="BLACK">
                <tr>
                    <td bgcolor="#000000"><b><font color="yellow">&nbsp&nbsp</font></b></td> 
                    <td bgcolor="#000000"><b><font color="yellow">&nbsp&nbsp</font></b></td> 
                    <td bgcolor="#000000"><b><font color="yellow">Observacion</font></b></td> 
                    <td bgcolor="#000000"><b><font color="yellow">Fecha</font></b></td>       
                   <!--  <td bgcolor="#000000"><b><font color="yellow">Naturaleza</font></b></td>    -->   
                </tr>
            
                <c:forEach var="proyecto" items="${ProyectoForm.lista}">
                        <tr>
                            <td bgcolor="#E6E6E6"><img src="images/delete.png" width="20" height="20" alt="delete" onclick="borrar(${proyecto.id},'${proyecto.orden}');"/>
                            </td>
                            <td bgcolor="#E6E6E6"><img src="images/info.jpg" width="20" height="20" alt="editar" onclick="editar(${proyecto.id},'${proyecto.orden}');"/>
                            </td>                            
                            <td bgcolor="#E6E6E6"><font face="times new roman" color="black"><c:out value="${proyecto.observaciones}"/></font></td>
                            <td bgcolor="#E6E6E6"><font face="times new roman" color="black"><c:out value="${proyecto.fecha}"/></font></td>
                        </tr>
                 </c:forEach>
                        
            </table>  
    
        </html:form>
    </body>
</html>