<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="domain.model.Produto" %>
<%@ page import="domain.dao.ProdutoDAO" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Produto</title>
    </head>
    <body>
        <h1>Editar Produto</h1>

        <%
            int id = Integer.parseInt(request.getParameter("id"));
            ProdutoDAO produtoDAO = new ProdutoDAO();
            Produto produto = produtoDAO.buscarProdutoPorId(id);

            if (produto != null) {
        %>

        <form action="realiza_edicao.jsp" method="post">
            <input type="hidden" name="produtoId" value="<%= produto.getId()%>">
            <label for="nome">Nome:</label>
            <input type="text" id="nome" name="nome" value="<%= produto.getNome()%>" required><br><br>

            <label for="descricao">Descrição:</label>
            <input type="text" id="descricao" name="descricao" value="<%= produto.getDescricao()%>" required><br><br>

            <label for="quantidade">Quantidade:</label>
            <input type="number" id="quantidade" name="quantidade" value="<%= produto.getQuantidade()%>" required><br><br>

            <input type="submit" value="Atualizar">
        </form>

        <%
            } else {
                out.println("Produto não encontrado.");
            }
        %>
    </body>
</html>
