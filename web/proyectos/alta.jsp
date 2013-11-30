<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %> 
<html>
    <head>
        <title>Agregar comentarios</title>

        <script type="text/javascript">
            
            function guarda()
            {
               document.forms["ProyectoForm"]["accion"].value="insertarDetalle";
               document.forms["ProyectoForm"].submit();
            }
            
            function rechazar()
            {
               document.forms["ProyectoForm"]["accion"].value="buscarDetalle";
               document.forms["ProyectoForm"].submit();
            }
            
        </script>

    </head>
    <body background="images/prosegurFondo.jpg" style="width:100%; text-align:center; margin-top:50px;">
        <div style="background-color:#FFCC01"> 
        <HR color="black" width=100% align="center">
            <b>Agregar Comentarios</b>
        <HR color="black" width=100% align="center">
        </div>    
        <div style="color:red">
            <html:errors />
        </div>
        <html:form action="/proyectos" >
            
            <table align="center"  style="width:50%; text-align:center; border-collapse: collapse;" id="dataTable" border="1" bordercolor="BLACK">
                     
                <tr>
                    <td bgcolor="#E6E6E6"><b><font color="black">Observaciones</font></b></td>
                    <td bgcolor="#E6E6E6"><html:text style="width: 300px" maxlength="100"  name="ProyectoForm" property="observaciones" /></td>                   
                </tr> 
                
                <tr>
                    <html:hidden name="ProyectoForm" property="accion" />
                    <html:hidden name="ProyectoForm" property="cantidad" />
                </tr>
            </table>
            
            <button name="guardar" onclick="javascript:guarda();">Guardar</button> 
            <button name="cancelar" onclick="javascript:rechazar();">Cancelar</button> 
        </html:form>
    </body>
</html>