<?php
class Usuario
{
    /*static public function listarRespuestaPregunta($tabla, $columna, $valor)
    {
        $respuesta = RespuestaModel::listar($tabla, $columna, $valor);
        return $respuesta;
    }*/

    public function registroUsuario()
    {
        //var_dump($_POST);
        if (isset($_POST['nombre']) && isset($_POST['paterno']) && isset($_POST['materno']) && isset($_POST['correo']) && isset($_POST['clave']) && isset($_POST['repita_clave'])) {
            if ($_POST['clave'] === $_POST['repita_clave']) {
                if (self::validarEntrada($_POST['nombre']) && self::validarEntrada($_POST['paterno']) && self::validarEntrada($_POST['materno'])) {
                    $datos = array(
                        'nombre' => trim($_POST['nombre']),
                        'paterno' => trim($_POST['paterno']),
                        'materno' => trim($_POST['materno'])
                    );

                    $id_persona = UsuarioModel::registroPersona("persona", $datos);
                    /*var_dump($id_persona);
                    exit;*/

                    if ($id_persona) {
                        $datos = array(
                            'id_usuario' => $id_persona,
                            'usuario' => trim($_POST['correo']),
                            'clave' => password_hash(trim($_POST['clave']), PASSWORD_DEFAULT),
                            'rol' => 'USUARIO'
                        );

                        $respuesta = UsuarioModel::registroUsuario("usuario", $datos);
                        if ($respuesta) {
                            /*var_dump($respuesta);
                            exit;*/
                            $persona = UsuarioModel::obtenerPersona($id_persona);
                            self::iniciarSesion($persona, 1);
                        }
                    }
                } else {
                    echo "<div class='alert alert-danger mt-2' role='alert'>
                    Datos inválidos los campos solo pueden contener letra y espacios
                    </div>";
                }
            } else {
                echo "<div class='alert alert-danger mt-2' role='alert'>
                Las contraseñas no coinciden
                </div>";
            }
        }
    }
    public function editarUsuario()
    {
        //var_dump($_POST);
        if (isset($_POST['nombre']) && isset($_POST['paterno']) && isset($_POST['materno']) && isset($_POST['correo']) ) {
            if (self::validarEntrada($_POST['nombre']) && self::validarEntrada($_POST['paterno']) && self::validarEntrada($_POST['materno'])) {
                $foto = $_SESSION['imagen'];
                if (!empty($_FILES['foto']['type'])) {
                    if (self::validarImagen($_FILES['foto']['type'])) {
                        $directorio = "vistas/upload/personas/";
                        $archivo = $directorio . time(). $_SESSION['nombre'] . $_SESSION['id'] . '.' . pathinfo($_FILES['foto']['name'], PATHINFO_EXTENSION);
                        if (move_uploaded_file($_FILES['foto']['tmp_name'], $archivo)) {
                            $foto = $archivo;
                        }else{
                            echo "<div class='alert alert-danger mt-2' role='alert'>
                                Ocurrio un error al guardar la imagen, intente de nuevo.
                            </div>";

                        }
                    } else {
                        echo "<div class='alert alert-danger mt-2' role='alert'>
                            Debe ingresar una imagen en el formato: jpeg, png o jpg.
                        </div>";
                    }
                    
                } 
                
                $datos = array(
                    'nombre' => trim($_POST['nombre']),
                    'paterno' => trim($_POST['paterno']),
                    'materno' => trim($_POST['materno']),
                    'id' => trim($_SESSION['id']),
                    'imagen' => $foto
                );

                $id_persona = UsuarioModel::editarPersona("persona", $datos);
                

                $datos = array(
                    'id_usuario' => trim($_SESSION['id']),
                    'usuario' => trim($_POST['correo']),
                );

                $respuesta = UsuarioModel::editarUsuario("usuario", $datos);
                if ($respuesta) {
                    /*var_dump($respuesta);
                    exit;*/
                    echo "<div class='alert alert-danger mt-2' role='alert'>
                    Datos editados correctamente
                    </div>";
                    $persona = UsuarioModel::obtenerPersona($_SESSION['id']);
                    self::iniciarSesion($persona,2);
                }

            } else {
                echo "<div class='alert alert-danger mt-2' role='alert'>
                Datos inválidos los campos solo pueden contener letra y espacios
                </div>";
            }
        }
    }

    static private function validarEntrada($input)
    {
        return preg_match('/^[a-zA-ZñÑáéíóúÁÉÍÓÚ ]+$/', $input);
    }

    static private function validarImagen($tipo)
    {
        return $tipo == 'image/jpeg' || $tipo == 'image/png' || $tipo == 'image/jpg';
    }

    static private function iniciarSesion($persona, $vista)
    {
        $_SESSION['id'] = $persona['id_persona'];
        $_SESSION['nombre'] = $persona['nombre'];
        $_SESSION['paterno'] = $persona['paterno'];
        $_SESSION['materno'] = $persona['materno'];
        $_SESSION['usuario'] = $persona['usuario'];
        $_SESSION['imagen'] = $persona['imagen'];
        $_SESSION['rol'] = $persona['rol'];
        if ($vista == 1) {
            echo '<script>
                window.location="' . BASE_URL . '";
            </script>';
        } else {
            echo '<script>
                window.location="' . BASE_URL . '/perfil";
            </script>';
        }
        
    }
    static public function loginUsuario()
    {
        if (isset($_POST['usuario']) && isset($_POST['clave'])) {
            $usuario = UsuarioModel::obtenerPersonaPorUsuario($_POST['usuario']);
            if ($usuario) {
                if (password_verify($_POST['clave'], $usuario['clave'])) {
                    self::iniciarSesion($usuario, 1);
                } else {
                    echo "<div class='alert alert-danger mt-2' role='alert'>
                    Contraseña incorrecta
                    </div>";
                }
            } else {
                echo "<div class='alert alert-danger mt-2' role='alert'>
                Usuario no encontrado
                </div>";
            }
        }
    }

    static public function ListarUsuarios(){
        $usuarios = UsuarioModel::obetenerUsuarios();

        return $usuarios;
    }
}
