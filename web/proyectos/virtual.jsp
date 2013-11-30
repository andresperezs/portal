<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %> 
<html>
    <head>
        <title>Equipo virtual</title>

        <script type="text/javascript">
            
            function guarda()
            {
               if(document.forms["ProyectoForm"]["disco"].value == "" || document.forms["ProyectoForm"]["disco"].value == "0" ){
                   alert("Debe ingresar un tamaño se storage en GB");
                   return false;
               }
               if(document.forms["ProyectoForm"]["memoria"].value == "" || document.forms["ProyectoForm"]["memoria"].value == "0" ){
                   alert("Debe ingresar un tamaño de memoria en GB");
                   return false;
               }
               if(document.forms["ProyectoForm"]["procesador"].value == "" || document.forms["ProyectoForm"]["procesador"].value == "0" ){
                   alert("Debe ingresar una cantidad de procesadores para el equipo");
                   return false;
               }
               if(document.forms["ProyectoForm"]["cantidad"].value == "" || document.forms["ProyectoForm"]["cantidad"].value == "0" ){
                   alert("Debe ingresar la cantidad de equipos con estas caracteristicas quiere cotizar");
                   return false;
               }
               document.forms["ProyectoForm"]["accion"].value="insertarVirtual";
               document.forms["ProyectoForm"].submit();
            }
            
            function rechazar()
            {
               document.forms["ProyectoForm"]["accion"].value="buscarDetalle";
               document.forms["ProyectoForm"].submit();
            }
            
        </script>

    </head>
    <body background="images/prosegurFondo.jpg"  style="width:100%; text-align:center; margin-top:50px;">
        <div style="background-color:#FFCC01"> 
        <HR color="black" width=100% align="center">
            <b>Nuevo equipo virtual</b>
        <HR color="black" width=100% align="center">
        </div>
        <div style="color:red">
            <html:errors />
        </div>
        <html:form action="/proyectos" >
            
            <table align="center" style="width:30%; text-align:center; border-collapse: collapse;" id="dataTable" border="1" bordercolor="BLACK">
                     
                <tr>
                    <td bgcolor="#E6E6E6"><b><font color="black">Sistema Operativo</font></b></td>
                    <td bgcolor="#E6E6E6">
                        <html:select style="width: 300px" name="ProyectoForm" property="sistemaOperativo" > 
                        <html:options collection="so" property="key" labelProperty="value" />
                        </html:select> 
                    </td>
                </tr>   
                
                <tr>
                    <td bgcolor="#E6E6E6"><b><font color="black">Raid</font></b></td>
                    <td bgcolor="#E6E6E6">
                        <html:select style="width: 300px" name="ProyectoForm" property="raid"> 
                        <html:options collection="raid" property="key" labelProperty="value" />
                        </html:select> 
                    </td>
                </tr>      
                
                <tr>
                    <td bgcolor="#E6E6E6"><b><font color="black">Storage</font></b></td>
                    <td bgcolor="#E6E6E6"><html:text style="width: 300px" maxlength="20" name="ProyectoForm" property="disco" /></td>    
                </tr>
                
                <tr>
                    <td bgcolor="#E6E6E6"><b><font color="black">Ambiente</font></b></td>
                    <td bgcolor="#E6E6E6">
                        <html:select style="width: 300px" name="ProyectoForm" property="ambiente"> 
                        <html:options collection="ambientes" property="key" labelProperty="value" />
                        </html:select> 
                    </td>
                </tr>      
                
                <tr>
                    <td bgcolor="#E6E6E6"><b><font color="black">Memoria</font></b></td>
                    <td bgcolor="#E6E6E6"><html:text style="width: 300px" maxlength="20" name="ProyectoForm" property="memoria" /></td>    
                </tr>
                
                <tr>
                    <td bgcolor="#E6E6E6"><b><font color="black">Procesadores</font></b></td>
                    <td bgcolor="#E6E6E6"><html:text style="width: 300px" maxlength="20"  name="ProyectoForm" property="procesador" /></td>                   
                </tr>  
                <tr>
                    <td bgcolor="#E6E6E6"><b><font color="black">Cantidad</font></b></td>
                    <td bgcolor="#E6E6E6"><html:text style="width: 300px" maxlength="20"  name="ProyectoForm" property="cantidad" /></td>                   
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