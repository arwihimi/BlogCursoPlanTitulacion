<?php
$usuarios = Usuario::ListarUsuarios();
// var_dump($usuarios);
// exit;
?>
<div class="content-wrapper">
    <div class="content-header">
        <div class="container">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1 class="m-0">Usuarios<small></small></h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="<?= BASE_URL ?>">Inicio</a></li>
                        <li class="breadcrumb-item">Usuarios</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>

    <div class="container">
        <div class="row">
            <?php foreach ($usuarios as $res):  ?>
            <div class="col-md-3">
                <div class="card card-primary card-outline">
                    <div class="card-body box-profile">
                        <div class="text-center">
                            <img class="profile-user-img img-fluid img-circle" src="<?= BASE_URL ?>vistas/dist/images/user.png" alt="User profile picture">
                        </div>

                        <h3 class="profile-username text-center"> <?= $res['nombre'] . ' ' . $res['paterno'] . ' ' . $res['materno'] ?></h3>

                        <p class="text-muted text-center"><?= $res['usuario'] ?></p>

                        <ul class="list-group list-group-unbordered mb-3">
                            <li class="list-group-item">
                                <b>Preguntas</b> <a class="float-right">
                                    <?= $res['cantidad_preguntas'] ?>
                                </a>
                            </li>
                            <li class="list-group-item">
                                <b>Respuestas</b> <a class="float-right">
                                    <?= $res['cantidad_respuestas'] ?>
                                </a>
                            </li>
                        </ul>

                        <!-- <a href="#" class="btn btn-primary btn-block"><b>Editar</b></a> -->
                    </div>
                </div>
            </div>
            <?php endforeach; ?>
            <!-- /.col -->
        </div>
    </div>
</div>