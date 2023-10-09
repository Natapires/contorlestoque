package domain.dao;

import domain.model.Produto;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import util.ConnectionDAO;

public class ProdutoDAO {

    private Connection connection;

    public ProdutoDAO() {
        try {
            this.connection = ConnectionDAO.conectar();
        } catch (ClassNotFoundException e) {
            System.out.println("ERRO: " + e.getMessage());
        }
    }

    public void cadastrarProduto(Produto produto) throws SQLException {
        String sql = "INSERT INTO produtos (nome, descricao, quantidade) VALUES (?, ?, ?)";
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setString(1, produto.getNome());
        ps.setString(2, produto.getDescricao());
        ps.setInt(3, produto.getQuantidade());
        ps.execute();
    }

    public void atualizarProduto(Produto produto) throws SQLException {
        String sql = "UPDATE produtos SET nome=?, descricao=?, quantidade=? WHERE id=?";
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setString(1, produto.getNome());
        ps.setString(2, produto.getDescricao());
        ps.setInt(3, produto.getQuantidade());
        ps.setInt(4, produto.getId());
        ps.execute();
    }

    public List<Produto> listarProdutos() throws SQLException {
        List<Produto> produtos = new ArrayList<>();
        String sql = "SELECT * FROM produtos";
        PreparedStatement ps = connection.prepareStatement(sql);
        ResultSet resultSet = ps.executeQuery();
        while (resultSet.next()) {
            int id = resultSet.getInt("id");
            String nome = resultSet.getString("nome");
            String descricao = resultSet.getString("descricao");
            int quantidade = resultSet.getInt("quantidade");
            Produto produto = new Produto(nome, descricao); // Agora não passamos o id no construtor
            produto.setId(id);
            produto.setQuantidade(quantidade);
            produtos.add(produto);
        }
        return produtos;
    }

    public Produto buscarProdutoPorId(int id) throws SQLException {
        String sql = "SELECT * FROM produtos WHERE id=?";
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setInt(1, id);
        ResultSet resultSet = ps.executeQuery();
        if (resultSet.next()) {
            String nome = resultSet.getString("nome");
            String descricao = resultSet.getString("descricao");
            int quantidade = resultSet.getInt("quantidade");
            Produto produto = new Produto(nome, descricao); // Agora não passamos o id no construtor
            produto.setId(id);
            produto.setQuantidade(quantidade);
            return produto;
        }
        return null;
    }

    public void excluirProduto(int id) throws SQLException {
        String sql = "DELETE FROM produtos WHERE id=?";
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setInt(1, id);
        ps.execute();
    }

    public void adicionarQuantidadeAoProdutoPorId(int id, int quantidadeAdicional) throws SQLException {
        Produto produto = buscarProdutoPorId(id);

        if (produto != null) {
            int novaQuantidade = produto.getQuantidade() + quantidadeAdicional;
            produto.setQuantidade(novaQuantidade);
            atualizarProduto(produto);
        }
    }

    public void removerQuantidadeDoProdutoPorId(int id, int quantidadeRemovida) throws SQLException {
        Produto produto = buscarProdutoPorId(id);

        if (produto != null) {
            int quantidadeAtual = produto.getQuantidade();

            // Verifica se a quantidade a ser removida não é maior do que a quantidade atual
            if (quantidadeRemovida <= quantidadeAtual) {
                int novaQuantidade = quantidadeAtual - quantidadeRemovida;
                produto.setQuantidade(novaQuantidade);
                atualizarProduto(produto);
            } else {
                // Caso a quantidade a ser removida seja maior que a quantidade atual, você pode lidar com isso aqui.
                // Pode gerar uma exceção ou tomar outra ação adequada.
                throw new IllegalArgumentException("Quantidade a ser removida maior do que a quantidade atual.");
            }
        }
    }

}
