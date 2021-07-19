package daos;

import beans.Categoria;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class CategoriaDAO extends Conexao{
public void salvar(Categoria categoria) throws Exception {
        String sql = "INSERT INTO categoria (nome,tipo) VALUES(?,?)";

        this.conectar();
        PreparedStatement pstm = con.prepareStatement(sql);
        pstm.setString(1, categoria.getNome());
        pstm.setString(2, categoria.getTipo());
        pstm.execute();
        this.desconectar();
    }

    public void alterar(Categoria categoria) throws Exception {
        String sql = "UPDATE categoria SET nome=?,tipo=? WHERE idCategoria=?";
        this.conectar();
        PreparedStatement pstm = con.prepareStatement(sql);
        pstm.setString(1, categoria.getNome());
        pstm.setString(2, categoria.getTipo());
        pstm.setInt(3, categoria.getIdCategoria());
        pstm.execute();
        this.desconectar();
    }

    public ArrayList<Categoria> getListar() throws Exception {
        ArrayList<Categoria> lista = new ArrayList<Categoria>();
        String sql = "SELECT * FROM categoria";
        this.conectar();
        PreparedStatement pstm = con.prepareStatement(sql);

        ResultSet rs = pstm.executeQuery();
        while (rs.next()) {
            Categoria cr = new Categoria();
            cr.setIdCategoria(rs.getInt("idCategoria"));
            cr.setNome(rs.getString("nome"));
            cr.setTipo(rs.getString("tipo"));
            lista.add(cr);

        }
        this.desconectar();

        return lista;
    }

    public Categoria carregar(int parametro) throws Exception {
        Categoria categoria = new Categoria();
        String sql = "SELECT * FROM categoria WHERE idCategoria=?";
        
        this.conectar();
        PreparedStatement pstm = con.prepareStatement(sql);
        pstm.setInt(1, parametro);
        
        
        ResultSet rs = pstm.executeQuery();
        while (rs.next()) {
            categoria.setIdCategoria(rs.getInt("idCategoria"));
            categoria.setNome(rs.getString("nome"));
            categoria.setTipo(rs.getString("tipo"));
            
        }
        this.desconectar();
        return categoria;
    }
}
