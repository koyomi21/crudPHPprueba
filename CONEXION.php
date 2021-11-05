<?php 

$mysqli = new mysqli("localhost", "root", "admin123","rrhh");
if($mysqli->connect_errno){
    echo "ERROR : FALLO AL CONECTAR BASE DE DATOS";
    echo "Errno:".$mysqli->connect_error."\n";
    exit();
}
   

?>
