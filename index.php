<?php
error_reporting(0);
include './CONEXION.php';
$ape = $_POST['apellido'];
$name = $_POST['nombres'];
$ingre = $_POST['ingre'];
$tele = $_POST['telefono'];
$carg = $_POST['cargos'];
$depart = $_POST['departamento'];
$sueldito = $_POST['sueldo'];
$comi = $_POST['comision'];
$emaill = $_POST['correo'];
$ID_Emple = $_POST['codigoemple'];
$ESRS = $mysqli->query("select * from cargo");
$ESRS_DEPA = $mysqli->query("select * from departamento");

if (isset($_POST['actualizar'])) {
    $boton = $_POST['actualizar'];
    if ($boton == 'BUSCAR') {
        $rs = $mysqli->query(" SELECT * FROM empleado WHERE idempleado='$ID_Emple'");
        $Empleado = mysqli_fetch_array($rs);
    }
    if ($boton == 'ACTUALIZAR') {
        $sql = "UPDATE empleado set apellidos='$ape',nombre='$name',fecingreso='$ingre',telefono='$tele',idcargo='$carg',iddepartamento='$depart',sueldo='$sueldito',comision='$comi',email='$emaill'  WHERE idempleado='$ID_Emple'";

        $Empleado_acc = $mysqli->query($sql);



        if ($Empleado_acc == true)
            echo "<script>
            alert('EMPLEADO ACTUALIZADO CON EXITO');
            history.back();
            </script>";
        else
            echo "<script>
            alert('ERROR AL ACTUALIZAR DATOS');
            history.back();
            </script>";
        $cerrar = mysqli_close($sql);
    }
    if ($boton == 'AGREGAR') {
        $sql = "insert into empleado (idempleado,apellidos,nombre,fecingreso,telefono,idcargo,iddepartamento,sueldo,comision,email)values ('$ID_Emple','$ape','$name','$ingre','$tele','$carg','$depart','$sueldito','$comi','$emaill' )";
        $rpta = $mysqli->query($sql);
        if ($rpta) {
            echo "<script>alert('EMPLEADO REGISTRADO CON EXITO'); history.back(); </script>";
        } else {
            echo '<script>alert("ERROR AL REGISTRAR EMPLEADO' . mysqli_error() . '"); history.back();</script>';
        }
    }
if ($boton == 'ELIMINAR') {
        $sql = "DELETE FROM empleado WHERE idempleado='$ID_Emple'";
        $rpta = $mysqli->query($sql);
        if ($rpta)
            echo "<script>
            alert('EMPLEADO ELIMINADO CORRECTAMENTE');
            history.back();
            </script>";
        else
            echo "<script>
            alert('ERROR AL ELIMINAR EMPLEADO');
            history.back();
            </script>";
    }
}
?>

<html>
    <head>
        <meta charset="UTF-8">
        <title></title>
    </head>
    <body style="background-color:Powderblue">
    <center>
        <header align="center">
            <h2>ACTUALIZACION DE EMPLEADOS DE LA EMPRESA SUMMERCODE</h2>

            <img src="Marca_SUMMER/logo.PNG">
          
        </header>
        <br>
        <form method="post" action="">
            <table width="500" border="1">
                <tr>    
                    <td>Ingrese ID_EMPLEADO</td>
                    <td><input  type="text" name="codigoemple" value="<?php echo $ID_Emple; ?>" /></td>
                    <td><input  style="background-color:orange" type="submit" value="BUSCAR" name="actualizar" /></td>
                </tr>      


            </table>
            <br>

            <table width="500" border="1">
                <tr>
                    <td>Nombres</td>
                    <td><input type="text" name="nombres" value="<?php echo $Empleado[2]; ?>" /></td>
                    <td>Apellido</td>
                    <td><input type="text" name="apellido" value="<?php echo $Empleado[1]; ?>" /></td>
                </tr>
                <tr>



                    <td>Telefono</td>
                    <td><input type="text" name="telefono" value="<?php echo $Empleado[4]; ?>" /></td>
                    <td>E_mail</td>
                    <td><input type="text" name="correo" value="<?php echo $Empleado[9]; ?>" /></td>
                </tr>

                <tr>
                    <td>Cargo</td>
                    <td><select name="cargos">
<?php
while ($cargos_emple = mysqli_fetch_array($ESRS)) {
    if ($Empleado[5] == $cargos_emple[0])
        $seleccionado = 'SELECTED';
    else
        $seleccionado = '';
    ?>
                                <option value='<?php echo $cargos_emple[0]; ?>'<?php echo $seleccionado; ?>><?php echo $cargos_emple[1]; ?></option>
                                <?php
                            }
                            ?>
                        </select>

                    </td>
                    <td>Departamento</td>
                    <td><select name="departamento">
<?php
while ($depa = mysqli_fetch_array($ESRS_DEPA)) {
    if ($Empleado[6] == $depa[0])
        $seleccionado = 'SELECTED';
    else
        $seleccionado = '';
    ?>
                                <option value='<?php echo $depa[0]; ?>'<?php echo $seleccionado; ?>><?php echo $depa[1]; ?></option>
                                <?php
                            }
                            ?>
                        </select>

                    </td>
                </tr>
                <tr>
                    <td>Sueldo</td>
                    <td><input type="text" name="sueldo" value="<?php echo $Empleado[7]; ?>" /></td>

                    <td>Fecha de Ingreso</td>
                    <td><input type="text" name="ingre" value="<?php echo $Empleado[3]; ?>"  size="40"/></td>

                </tr>
                <tr>


                    <td>Comision</td>
                    <td><input type="text" name="comision" value="<?php echo $Empleado[8]; ?>" /></td>

                </tr>
                <tr>



                </tr>

            </table>
            <br>
            <table width="500" border="1">
                <tr>
                    <td align="center">
                        <input style="background-color:YellowGreen" type="submit" value="ACTUALIZAR" name="actualizar"/>
                    </td>
                    <td align="center" >
                        <input style="background-color:YellowGreen" type="submit" value="AGREGAR" name="actualizar"/>
                    </td>
                    <td align="center">
                        <input style="background-color:YellowGreen" type="submit" value="ELIMINAR" name="actualizar"/>
                   
                </tr>
                
            </table>
            <br>
            <table align="center" width="500" border ="2">
                <tr>
                    <td  align="center"><a style="color: blue" href="index.php">ACTUALIZAR PAGINA</a></td>
                </tr>
            </table>
        </form>
    </center>
</body>
</html>
