<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="domain.dao.ProdutoDAO" %>
<%@ page import="java.sql.SQLException" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Adicionar Estoque</title>
    </head>
    <body>
        <%
            int produtoId = Integer.parseInt(request.getParameter("produtoId"));
            int quantidade = Integer.parseInt(request.getParameter("quantidade"));
            
            ProdutoDAO produtoDAO = new ProdutoDAO();

            produtoDAO.adicionarQuantidadeAoProdutoPorId(produtoId, quantidade);
            out.println("Estoque adicionado com sucesso!");

        %>
    </body>
</html>
