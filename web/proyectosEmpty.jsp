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
            
            function nuevo()
            {
               document.forms["ProyectoForm"]["accion"].value="crearProyecto";
               document.forms["ProyectoForm"].submit();
            }
        </script>

    </head>
    <body background="images/prosegurFondo.jpg" style="width:98%; text-align:center; margin-top:50px;">

        <div style="color:red">
            <html:errors />
        </div>
        <html:form action="/proyectos" >
        <div style="background-color:#FFCC01">   
            <html:hidden name="ProyectoForm" property="accion" />
            <hr style="color: black">
            <table>
                <tr>    

                    <td>
                        <button style="border: solid 1px #2A4E77;text-decoration: none;" 
                                name="search" onclick="buscar();">Buscar</button> 
                    </td><td>
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
            <table  style="width:100%; text-align:center;" id="dataTable" style="border:1px solid black;">
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
                
            </table>
            
        </html:form>
    </body>
</html>