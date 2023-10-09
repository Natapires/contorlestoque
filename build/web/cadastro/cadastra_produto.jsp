<%@page import="java.sql.SQLException"%>
<%@page import="domain.dao.ProdutoDAO"%>
<%@page import="domain.model.Produto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Cadastro de Produto</title>
</head>
<body>
    <h1>Cadastro de Produto</h1>
    <%
        if (request.getMethod().equals("POST")) {
            String nome = request.getParameter("nome");
            String descricao = request.getParameter("descricao");

            if (nome != null && descricao != null) {
                try {
                    Produto produto = new Produto(nome, descricao);

                    ProdutoDAO produtoDAO = new ProdutoDAO();
                    produtoDAO.cadastrarProduto(produto);

                    out.println("<p>Produto cadastrado com sucesso:</p>");
                    out.println("<p>Nome: " + produto.getId() + "</p>");
                    out.println("<p>Nome: " + produto.getNome() + "</p>");
                    out.println("<p>Descrição: " + produto.getDescricao() + "</p>");
                } catch (SQLException ex) {
                    out.println("<p>Erro ao cadastrar o produto:</p>");
                    out.println("<p>" + ex.getMessage() + "</p>");
                }
            }
        }
    %>
</body>
</html>
