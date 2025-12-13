<?php
    class Conexion{
        static public function conectar(){
            $conexion=new PDO("mysql:host=localhost;dbname=blog2","root",""); //ca,biar nombre de base de datos
            $conexion->exec("SET NAMES utf8mb4"); //se aumento para poder arreglar en la codificacion de la base de datos
            return $conexion;
        }
    }
?>