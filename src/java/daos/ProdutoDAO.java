package daos;

import beans.Categoria;
import beans.Produto;
import beans.Sabor;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.util.ArrayList;
import java.sql.Date;

public class ProdutoDAO extends Conexao {

    public void salvar(Produto produto) throws Exception {
        String sql = "INSERT INTO Produto ("
                + "status,"
                + "dataFabricacao,"
                + "dataVencimento,"
                + "preco,"
                + "quantidade,"
                + "quantidadeMin,"
                + "undMedida,"
                + "descricao,"
                + "peso,"
                + "categoriaId,"
                + "saborId"
                + ")VALUES(?,?,?,?,?,?,?,?,?,?,?)";
        this.conectar();
        PreparedStatement pstm = con.prepareStatement(sql);
        pstm.setBoolean(1, produto.isStatus());
        pstm.setDate(2, new Date(produto.getDataFabricacao().getTime()));
        pstm.setDate(3, new Date(produto.getDataVencimento().getTime()));
        pstm.setDouble(4, produto.getPreco());
        pstm.setInt(5, produto.getQuantidade());
        pstm.setInt(6, produto.getQuantidadeMin());
        pstm.setString(7, produto.getUndMedida());
        pstm.setString(8, produto.getDescricao());
        pstm.setDouble(9, produto.getPeso());
        pstm.setInt(10, produto.getCategoriaId().getIdCategoria());
        pstm.setInt(11, produto.getSaborId().getIdSabor());
        pstm.execute();
        this.desconectar();
    }

    public void alterar(Produto produto) throws Exception {
        String sql = "UPDATE produto SET status=?,dataFabricacao=?,dataVencimento=?,preco=?,quantidade=?,quantidadeMin=?,undMedida=?,descricao=?,peso=?,categoriaId=?,saborId=? WHERE idProduto=?";
        this.conectar();
        PreparedStatement pstm = con.prepareStatement(sql);
        pstm.setBoolean(1, produto.isStatus());
        pstm.setDate(2, new Date(produto.getDataFabricacao().getTime()));
        pstm.setDate(3, new Date(produto.getDataVencimento().getTime()));
        pstm.setDouble(4, produto.getPreco());
        pstm.setInt(5, produto.getQuantidade());
        pstm.setInt(6, produto.getQuantidadeMin());
        pstm.setString(7, produto.getUndMedida());
        pstm.setString(8, produto.getDescricao());
        pstm.setDouble(9, produto.getPeso());
        pstm.setInt(10, produto.getCategoriaId().getIdCategoria());
        pstm.setInt(11, produto.getSaborId().getIdSabor());
        pstm.setInt(12, produto.getIdProduto());
        pstm.execute();
        this.desconectar();
    }
    

    public ArrayList<Produto> getListar() throws Exception {
        ArrayList<Produto> lista = new ArrayList<Produto>();
        String sql = "SELECT * FROM Produto";
        this.conectar();
        PreparedStatement pstm = con.prepareStatement(sql);

        ResultSet rs = pstm.executeQuery();
        CategoriaDAO daoCate = new CategoriaDAO();
        SaborDAO daoSabor = new SaborDAO();

        while (rs.next()) {
            Produto produto = new Produto();
            produto.setIdProduto(rs.getInt("idProduto"));
            produto.setStatus(rs.getBoolean("status"));
            produto.setDataFabricacao(rs.getDate("dataFabricacao"));
            produto.setDataVencimento(rs.getDate("dataVencimento"));
            produto.setPreco(rs.getDouble("preco"));
            produto.setQuantidade(rs.getInt("quantidade"));
            produto.setQuantidadeMin(rs.getInt("quantidadeMin"));
            produto.setUndMedida(rs.getString("undMedida"));
            produto.setDescricao(rs.getString("descricao"));
            produto.setPeso(rs.getDouble("peso"));

            Categoria categoria = daoCate.carregar(rs.getInt("categoriaId"));
            produto.setCategoriaId(categoria);

            Sabor sabor = daoSabor.getCarregar(rs.getInt("saborId"));
            produto.setSaborId(sabor);

            lista.add(produto);

        }
        this.desconectar();

        return lista;
    }

    public Produto getCarregar(int parametro) throws Exception {
        Produto produto = new Produto();
        String sql = "SELECT * FROM Produto WHERE idProduto=?";

        this.conectar();
        PreparedStatement pstm = con.prepareStatement(sql);
        pstm.setInt(1, parametro);

        ResultSet rs = pstm.executeQuery();
        CategoriaDAO daoCate = new CategoriaDAO();
        SaborDAO daoSabor = new SaborDAO();
        while (rs.next()) {
            produto.setIdProduto(rs.getInt("idProduto"));
            produto.setStatus(rs.getBoolean("status"));
            produto.setDataFabricacao(rs.getDate("dataFabricacao"));
            produto.setDataVencimento(rs.getDate("dataVencimento"));
            produto.setPreco(rs.getDouble("preco"));
            produto.setQuantidade(rs.getInt("quantidade"));
            produto.setQuantidadeMin(rs.getInt("quantidadeMin"));
            produto.setUndMedida(rs.getString("undMedida"));
            produto.setDescricao(rs.getString("descricao"));
            produto.setPeso(rs.getDouble("peso"));

            Categoria categoria = daoCate.carregar(rs.getInt("categoriaId"));
            produto.setCategoriaId(categoria);

            Sabor sabor = daoSabor.getCarregar(rs.getInt("saborId"));
            produto.setSaborId(sabor);
        }
        this.desconectar();
        return produto;
    }

}
