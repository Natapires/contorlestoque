<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="domain.model.Produto" %>
<%@ page import="domain.dao.ProdutoDAO" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Atualizar Produto</title>
</head>
<body>
    <h1>Atualizar Produto</h1>

    <%
        // Recupere os parâmetros da solicitação
        int produtoId = Integer.parseInt(request.getParameter("produtoId"));
        String nome = request.getParameter("nome");
        String descricao = request.getParameter("descricao");
        int quantidade = Integer.parseInt(request.getParameter("quantidade"));

        ProdutoDAO produtoDAO = new ProdutoDAO();
        Produto produto = produtoDAO.buscarProdutoPorId(produtoId);

        if (produto != null) {
            // Atualize os campos do produto
            produto.setNome(nome);
            produto.setDescricao(descricao);
            produto.setQuantidade(quantidade);

            try {
                produtoDAO.atualizarProduto(produto);
                out.println("Produto atualizado com sucesso!");
            } catch (Exception e) {
                out.println("Erro ao atualizar o produto: " + e.getMessage());
            }
        } else {
            out.println("Produto não encontrado.");
        }
    %>
</body>     
</html>
