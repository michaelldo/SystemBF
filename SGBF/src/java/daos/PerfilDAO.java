package daos;

import beans.Perfil;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class PerfilDAO extends Conexao{

   
    public void salvar(Perfil perfil) throws Exception {
        String sql = "INSERT INTO perfil (descricao) VALUE(?)";
        this.conectar();
        
        PreparedStatement pstm = con.prepareStatement(sql);
        pstm.setString(1, perfil.getDescricao());
        
        pstm.execute();
        this.desconectar();
    }

    public void alterar(Perfil perfil) throws Exception {
        String sql = "UPDATE perfil SET descricao=? WHERE idPerfil=?";
        this.conectar();
        
        PreparedStatement pstm = con.prepareStatement(sql);
        pstm.setString(1, perfil.getDescricao());
        pstm.setInt(2, perfil.getIdPerfil());
        
        pstm.execute();
        this.desconectar();
    }

    public ArrayList<Perfil> getListar() throws Exception {
        ArrayList<Perfil> lista = new ArrayList<Perfil>();
        String sql = "SELECT * FROM perfil";
        this.conectar();
        PreparedStatement pstm = con.prepareStatement(sql);

        ResultSet rs = pstm.executeQuery();
        while (rs.next()) {
            Perfil sabor = new Perfil();
            sabor.setIdPerfil(rs.getInt("idPerfil"));
            sabor.setDescricao(rs.getString("descricao"));
            lista.add(sabor);
        }
        this.desconectar();
        return lista;
    }
    public boolean excluir(int id) throws Exception {
        String sql = "DELETE FROM perfil WHERE idPerfil=?";
        this.conectar();
        PreparedStatement pstm = con.prepareStatement(sql);
        pstm.setInt(1, id);
        pstm.execute();
        this.desconectar();
        return true;
    }

    public Perfil getCarregar(int parametro) throws Exception {
        Perfil sabor = new Perfil();
        String sql = "SELECT * FROM perfil WHERE idPerfil=?";

        this.conectar();
        PreparedStatement pstm = con.prepareStatement(sql);
        pstm.setInt(1, parametro);
        ResultSet rs = pstm.executeQuery();
        while (rs.next()) {
            sabor.setIdPerfil(rs.getInt("idPerfil"));
            sabor.setDescricao(rs.getString("descricao"));
         }
        this.desconectar();
        return sabor;
    }
}
