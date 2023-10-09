<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="domain.model.Produto" %>
<%@ page import="domain.dao.ProdutoDAO" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Excluir Produto</title>
</head>
<body>
    <h1>Excluir Produto</h1>

    <%
        // Recupere o ID do produto da solicitação
        int produtoId = Integer.parseInt(request.getParameter("id"));
        ProdutoDAO produtoDAO = new ProdutoDAO();

        Produto produto = produtoDAO.buscarProdutoPorId(produtoId);
        if (produto != null) {
            try {
            
                produtoDAO.excluirProduto(produto.getId());
                out.println("Produto excluído com sucesso!");
            } catch (SQLException e) {
                out.println("Erro ao excluir o produto: " + e.getMessage());
            }
        } else {
            out.println("Produto não encontrado.");
        }
    %>
</body>
</html>
