package daos;


import beans.Pedido;
import beans.Produto;
import beans.ProdutoPedido;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class ProdutoPedidoDAO extends Conexao {

    public boolean gravar(Pedido pedido) throws Exception {
        //boolean excluido = excluir( pedido.getIdPedido());
        boolean sucesso = true;
        if (sucesso) {
            for (ProdutoPedido prod : pedido.getProdutos()) {
                prod.setPedido(pedido);
                sucesso = sucesso && gravar(prod);
            }
        }
        return sucesso;
    }

    public boolean gravar(ProdutoPedido pp) throws Exception {

        String sql = "INSERT INTO ProdutoPedido (pedidoId, ProdutoId,quantidade,qtdBola) VALUES (?,?,?,?)";
        this.conectar();
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, pp.getPedido().getIdPedido());
        ps.setInt(2, pp.getProduto().getIdProduto());
        ps.setInt(3, pp.getQuantidade());
        ps.setInt(4, pp.getQtdBola());
        ps.execute();
        this.desconectar();
        System.out.println("ProdutoPedidoDAO::Sucesso!");
        return true;
    }

   
    public ProdutoPedido getCarregar(int parametro) throws Exception {
        ProdutoPedido pp = new ProdutoPedido();
        String sql = "SELECT * FROM ProdutoPedido WHERE pedidoId=?";
        this.conectar();
        PreparedStatement pstm = con.prepareStatement(sql);
        pstm.setInt(1, parametro);

        ResultSet rs = pstm.executeQuery();
        PedidoDAO pdao = new PedidoDAO();
        ProdutoDAO pro = new ProdutoDAO();
        while (rs.next()) {
            Pedido pedido = pdao.getRecuperar(rs.getInt("pedidoId"));
            pp.setPedido(pedido);
            pp.setQuantidade(rs.getInt("quantidade"));
            pp.setQtdBola(rs.getInt("qtdBola"));
            Produto produto = pro.getCarregar(rs.getInt("ProdutoId"));
            pp.setProduto(produto);
            
        }
        this.desconectar();
        return pp;
    }
    public ProdutoPedido getListar() throws Exception {
        ProdutoPedido pp = new ProdutoPedido();
        String sql = "SELECT * FROM ProdutoPedido";
        this.conectar();
        PreparedStatement pstm = con.prepareStatement(sql);
        ResultSet rs = pstm.executeQuery();
        PedidoDAO pdao = new PedidoDAO();
        ProdutoDAO pro = new ProdutoDAO();
        while (rs.next()) {
            Pedido pedido = pdao.getRecuperar(rs.getInt("pedidoId"));
            pp.setPedido(pedido);
            pp.setQuantidade(rs.getInt("quantidade"));
            pp.setQtdBola(rs.getInt("qtdBola"));
            Produto produto = pro.getCarregar(rs.getInt("ProdutoId"));
            pp.setProduto(produto);
            
        }
        this.desconectar();
        return pp;
    }

}
