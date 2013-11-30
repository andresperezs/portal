<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<html>
    <head>
        <title>Totales</title>

        <script type="text/javascript">
            function rechazar()
            {
               document.forms["ProyectoForm"]["accion"].value="buscarDetalle";
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
                                name="search" onclick="javascript:rechazar();">Volver</button> 
                    </td>      
                </tr>
            </table>
            <hr style="color: black"> 
            </div> 
            <table  style="width:100%; text-align:center; border-collapse: collapse;" id="dataTable" border="1" bordercolor="BLACK" >
                <tr>
                    
                    <td bgcolor="#000000"><b><font color="yellow">Ambiente</font></b></td> 
                    <td bgcolor="#000000"><b><font color="yellow">Costos</font></b></td>    
                </tr>
            
                <c:forEach var="cotizacion" items="${ProyectoForm.listaAmbientes}">
                        <tr>
                            <td bgcolor="#E6E6E6"><font color="black"><c:out value="${cotizacion.descripcion}"/></font></td>
                            <td bgcolor="#E6E6E6"><font color="black"><c:out value="${cotizacion.id}"/></font></td>
                        </tr>
                 </c:forEach>
                        
            </table>  
            <table  style="width:100%; text-align:center; border-collapse: collapse;" id="dataTable" border="1" bordercolor="BLACK" >
                <tr>
                    
                    <td bgcolor="#000000"><b><font color="yellow">Naturaleza</font></b></td> 
                    <td bgcolor="#000000"><b><font color="yellow">Costos</font></b></td>    
                </tr>
            
                <c:forEach var="cotizacion" items="${ProyectoForm.listaNaturaleza}">
                        <tr>
                            <td bgcolor="#E6E6E6"><font color="black"><c:out value="${cotizacion.descripcion}"/></font></td>
                            <td bgcolor="#E6E6E6"><font color="black"><c:out value="${cotizacion.id}"/></font></td>
                        </tr>
                 </c:forEach>
                        
            </table>  
            
             <table  style="width:100%; text-align:center; border-collapse: collapse;" id="dataTable" border="1" bordercolor="BLACK" >
                <tr>
                    
                    <td bgcolor="#000000"><b><font color="yellow">Total general</font></b></td> 
                    <td bgcolor="#E6E6E6"><font color="black"><c:out value="${ProyectoForm.total}"/></font></td>
                </tr>
                        
            </table>  
        </html:form>
    </body>
</html>