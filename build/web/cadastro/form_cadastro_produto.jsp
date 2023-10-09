<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Cadastro de Produto</title>
        <!-- Inclua os links para os arquivos CSS e JavaScript do Bootstrap -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <div class="container mt-5 w-50">
            <h1 class="text-center">Cadastro de Produto</h1>
            <form action="cadastra_produto.jsp" method="POST">
                <div class="mb-3 mt-5">
                    <label for="nome" class="form-label">Nome do Produto:</label>
                    <input type="text" class="form-control" id="nome" name="nome" required>
                </div>
                <div class="mb-3">
                    <label for="descricao" class="form-label">Descrição do Produto:</label>
                    <textarea class="form-control" id="descricao" name="descricao" rows="4" required></textarea>
                </div>
            </form>
            <button type="submit" class="btn btn-primary btn-block w-100">Cadastrar Produto</button>
        </div>

        <!-- Inclua o JavaScript do Bootstrap (opcional, dependendo das funcionalidades que você precisa) -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
    </body>
</html>
