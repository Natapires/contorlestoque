<h2>Remover Produto</h2>

<form action="remover_estoque.jsp" method="post">
    <label for="produtoId">ID do Produto:</label>
    <input type="text" id="produtoId" name="produtoId" required><br><br>

    <label for="quantidade">Quantidade:</label>
    <input type="number" id="quantidade" name="quantidade" required><br><br>

    <input type="submit" value="remover">
</form>
