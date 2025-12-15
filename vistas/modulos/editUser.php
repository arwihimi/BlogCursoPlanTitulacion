<div class="content-wrapper">
    <div class="content-header">
        <div class="container">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1 class="m-0">Datos Usuario<small></small></h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="<?= BASE_URL ?>">Inicio</a></li>
                        <li class="breadcrumb-item">Datos Usuario</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>

    <div class="container">
        <form method="POST" enctype="multipart/form-data">
            <div class="row">
                <div class="col-md-3">
                    <!-- Profile Image -->
                    <div class="card card-primary card-outline">
                        <div class="card-body box-profile">
                            <div class="text-center">
                                <img class="img-fluid img-circle" style="height: 100px important;" src="<?= BASE_URL . $_SESSION['imagen'] ?>" alt="User profile picture">
                            </div>
                        </div>
                        <!-- /.card-body -->
                    </div>s
                    <!-- /.card -->

                </div>
                <!-- /.col -->
                <div class="col-md-9">
                    <div class="card">
                        <div class="card-header">
                            <div class="d-flex justify-content-between">
                                <h3>Datos Personales</h3>
                                <button type="submit" class="btn btn-primary ">Editar</button>
                            </div>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="form-group col-md-4">
                                    <label for="titulo">Nombre</label>
                                    <input type="text" class="form-control" id="nombre" name="nombre"
                                        placeholder="Nombre" required 
                                        value="<?php echo htmlspecialchars($_SESSION['nombre'] ?? ''); ?>"/>
                                </div>
                                <div class="form-group col-md-4">
                                    <label for="paterno">Apellido Paterno</label>
                                    <input type="text" class="form-control" id="paterno" name="paterno"
                                        placeholder="Paterno" required 
                                        value="<?php echo htmlspecialchars($_SESSION['paterno'] ?? ''); ?>"/>
                                </div>
                                <div class="form-group col-md-4">
                                    <label for="materno">Apellido Materno</label>
                                    <input type="text" class="form-control" id="materno" name="materno"
                                        placeholder="Materno" required 
                                        value="<?php echo htmlspecialchars($_SESSION['materno'] ?? ''); ?>"/>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group col-md-4">
                                    <label for="titulo">Correo</label>
                                    <input type="text" class="form-control" id="correo" name="correo"
                                        placeholder="correo" required 
                                        value="<?php echo htmlspecialchars($_SESSION['usuario'] ?? ''); ?>"/>
                                </div>
                                <div class="form-group col-md-6">
                                <label for="exampleInputFile">Cargar Imagen</label>
                                <div class="input-group">
                                    <div class="custom-file">
                                        <input type="file" class="custom-file-input" id="foto" name="foto"/>
                                        <label class="custom-file-label" for="foto">seleccione la foto</label>
                                    </div>
                                </div>
                            </div>
                            </div>
                        </div><!-- /.card-body -->
                    </div>
                    <!-- /.card -->
                </div>
                <!-- /.col -->
            </div>

            <?php
                $usuario=new Usuario();
                $usuario->editarUsuario();
            ?>
        </form>
    </div>
</div>