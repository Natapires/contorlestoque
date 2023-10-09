<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="domain.model.Produto" %>
<%@ page import="domain.dao.ProdutoDAO" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de Produtos</title>
    </head>
    <body>
        <h1>Lista de Produtos</h1>

        <%
            ProdutoDAO produtoDAO = new ProdutoDAO();
            List<Produto> listaDeProdutos = produtoDAO.listarProdutos();
        %>

        <table border="1">
            <tr>
                <th>ID</th>
                <th>Nome</th>
                <th>Descrição</th>
                <th>Quantidade</th>
                <th>Ações</th>
            </tr>
            <%
                for (Produto produto : listaDeProdutos) {
            %>
            <tr>
                <td><%= produto.getId()%></td>
                <td><%= produto.getNome()%></td>
                <td><%= produto.getDescricao()%></td>
                <td><%= produto.getQuantidade()%></td>
                <td>
                    <a href="/ControleEstoque/atualizar/editar_produto.jsp?id=<%= produto.getId()%>">Editar</a> |
                    <a href="/ControleEstoque/deletar/excluir_produto.jsp?id=<%= produto.getId()%>">Excluir</a>
                </td>


            </tr>
            <%
                }
            %>
        </table>

    </body>
</html>
