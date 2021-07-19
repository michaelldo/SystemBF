package daos;

import beans.Categoria;
import beans.Pedido;
import beans.Pessoa;
import beans.Produto;
import beans.ProdutoPedido;
import beans.Sabor;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class PedidoDAO extends Conexao {

    public boolean salvar(Pedido p) {

        try {
            this.conectar();

            String sql = "INSERT INTO pedido (pessoaId, observacao) VALUES (?,?)";
            PreparedStatement ps = con.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);
            ps.setInt(1, p.getCliente().getIdPessoa());
            ps.setString(2, p.getObservacao());
            ps.execute();
// recuperar o ID criado pelo banco de dados para o Pedido inserido
            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) {
                p.setIdPedido(rs.getInt(1));
            }
            this.desconectar();
            ProdutoPedidoDAO pmDao = new ProdutoPedidoDAO();
            return pmDao.gravar(p);

        } catch (Exception e) {
            System.out.println("Erro ao inserir pedido.");
            System.out.println(e.getMessage());
            return false;
        }
    }

    public Pedido getRecuperar(int idPedido) {
        try {
            String sql = "SELECT ped.idPedido,ped.dataHoraPedido,pp.quantidade,pp.qtdBola,ped.observacao,\n"
                    + "prod.preco,prod.idProduto,pes.nome,pes.idPessoa,cat.Idcategoria,cat.nome,cat.tipo,sab.idSabor,sab.descricao\n"
                    + "FROM Pedido ped \n"
                    + "LEFT JOIN ProdutoPedido pp ON ped.IdPedido = pp.PedidoId\n"
                    + "LEFT JOIN Produto prod ON pp.ProdutoId = prod.IdProduto\n"
                    + "LEFT JOIN categoria cat ON cat.Idcategoria = prod.categoriaId\n"
                    + "LEFT JOIN sabor sab ON sab.idSabor = prod.saborId\n"
                    + "LEFT JOIN pessoa pes ON pes.idPessoa = ped.pessoaId\n"
                    + "WHERE ped.idPedido=?";
            this.conectar();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, idPedido);
            ResultSet rs = ps.executeQuery();
            Pedido pedido = null;
            CategoriaDAO cDAO = new CategoriaDAO();
            SaborDAO sDAO = new SaborDAO();
            PessoaDAO pDAO = new PessoaDAO();
            ProdutoPedido pp = new ProdutoPedido();
            Produto produto = new Produto();
            pedido = new Pedido();

            if (rs.next()) {

                pedido.setIdPedido(rs.getInt("idPedido"));
                pedido.setObservacao(rs.getString("observacao"));
                pedido.setDataHora(rs.getTimestamp("dataHoraPedido"));
                Pessoa cliente = pDAO.getCarregar(rs.getInt("idPessoa"));
                pedido.setCliente(cliente);
                List<ProdutoPedido> listaPP = new ArrayList<ProdutoPedido>();
                do {
                    produto.setIdProduto(rs.getInt("idProduto"));
                    produto.setPreco(rs.getDouble("preco"));
                    Categoria categoria = cDAO.carregar(rs.getInt("Idcategoria"));
                    produto.setCategoriaId(categoria);
                    Sabor sabor = sDAO.getCarregar(rs.getInt("idSabor"));
                    produto.setSaborId(sabor);

                    pp.setPedido(pedido);
                    pp.setQuantidade(rs.getInt("quantidade"));
                    pp.setQtdBola(rs.getInt("qtdBola"));
                    pp.setProduto(produto);
                    
                } while (rs.next());
                listaPP.add(pp);
                pedido.setProdutos(listaPP);
            }
            this.desconectar();
            return pedido;

        } catch (Exception e) {
            System.out.println(e);
            return null;
        }

    }
    public ArrayList<Pedido> getListar() throws Exception {
        ArrayList<Pedido> lista = new ArrayList<Pedido>();
        String sql = "SELECT * from Pedido order by idPedido DESC";
        PessoaDAO pDAO = new PessoaDAO();
        this.conectar();
        PreparedStatement pstm = con.prepareStatement(sql);

        ResultSet rs = pstm.executeQuery();
        while (rs.next()) {
            Pedido ped = new Pedido();
            ped.setIdPedido(rs.getInt("idPedido"));
            ped.setDataHora(rs.getTimestamp("dataHoraPedido"));
            ped.setObservacao(rs.getString("observacao"));
            Pessoa cliente = pDAO.getCarregar(rs.getInt("PessoaId"));
            ped.setCliente(cliente);
            ped.setStatus(rs.getInt("status"));
            lista.add(ped);

        }
        this.desconectar();

        return lista;
    }

    public void alterar(Pedido pedido) throws Exception {
        String sql = "UPDATE pedido SET status=? WHERE idPedido=?";
        this.conectar();

        PreparedStatement pstm = con.prepareStatement(sql);
        pstm.setInt(1, pedido.getStatus());
        pstm.setInt(2, pedido.getIdPedido());

        pstm.execute();
        this.desconectar();
    }

}
