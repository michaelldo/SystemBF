package daos;

import beans.Sabor;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class SaborDAO extends Conexao {

    public void salvar(Sabor sabor) throws Exception {
        String sql = "INSERT INTO Sabor (descricao) VALUE(?)";
        this.conectar();
        
        PreparedStatement pstm = con.prepareStatement(sql);
        pstm.setString(1, sabor.getDescricao());
        
        pstm.execute();
        this.desconectar();
    }

    public void alterar(Sabor sabor) throws Exception {
        String sql = "UPDATE Sabor SET descricao=? WHERE idSabor=?";
        this.conectar();
        
        PreparedStatement pstm = con.prepareStatement(sql);
        pstm.setString(1, sabor.getDescricao());
        pstm.setInt(2, sabor.getIdSabor());
        
        pstm.execute();
        this.desconectar();
    }

    public ArrayList<Sabor> getListar() throws Exception {
        ArrayList<Sabor> lista = new ArrayList<Sabor>();
        String sql = "SELECT * FROM Sabor";
        this.conectar();
        PreparedStatement pstm = con.prepareStatement(sql);

        ResultSet rs = pstm.executeQuery();
        while (rs.next()) {
            Sabor sabor = new Sabor();
            sabor.setIdSabor(rs.getInt("idSabor"));
            sabor.setDescricao(rs.getString("descricao"));
            lista.add(sabor);
        }
        this.desconectar();
        return lista;
    }
    public boolean excluir(int id) throws Exception {
        String sql = "DELETE FROM Sabor WHERE idSabor=?";
        this.conectar();
        PreparedStatement pstm = con.prepareStatement(sql);
        pstm.setInt(1, id);
        pstm.execute();
        this.desconectar();
        return true;
    }

    public Sabor getCarregar(int parametro) throws Exception {
        Sabor sabor = new Sabor();
        String sql = "SELECT * FROM Sabor WHERE idSabor=?";

        this.conectar();
        PreparedStatement pstm = con.prepareStatement(sql);
        pstm.setInt(1, parametro);
        ResultSet rs = pstm.executeQuery();
        while (rs.next()) {
            sabor.setIdSabor(rs.getInt("idSabor"));
            sabor.setDescricao(rs.getString("descricao"));
         }
        this.desconectar();
        return sabor;
    }
}
