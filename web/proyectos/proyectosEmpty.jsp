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
            
            function borrar(indice,idDetalle,virtual)
            {
               if(virtual == "N"){ 
                    document.forms["ProyectoForm"]["accion"].value="borrarDetalle";
                    document.forms["ProyectoForm"]["idDetalle"].value=idDetalle;  
                    document.forms["ProyectoForm"]["indice"].value=indice;
               }else{ 
                    document.forms["ProyectoForm"]["accion"].value="borrarDetalleVirtual";
                    document.forms["ProyectoForm"]["idDetalle"].value=idDetalle;               }
                   
               
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
            
                        
            </table>  
    
        </html:form>
    </body>
</html>