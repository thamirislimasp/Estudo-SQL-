<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

    <style>
        h4{
            text-align: center;
            color: blue;           
        }
        div {
            text-align: center;
            margin: 5%;
        }
     
    </style>
</head>

<body>
    <?php
    include 'conexao.php';
    $id_categoria = $_POST['id_categoria'];
    $sql = "DELETE FROM categorias WHERE id_categoria = '$id_categoria'";
    $editar = mysqli_query($conexao, $sql);
    ?>

    <div class="container">
        <h4>Categoria excluida com sucesso!</h4>
        <a href="lista_categoria.php" class="btn btn-primary">Voltar</a>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>     

</body>
</html>