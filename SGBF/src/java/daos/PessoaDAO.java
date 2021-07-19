package daos;

import beans.Perfil;
import beans.Pessoa;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class PessoaDAO extends Conexao {

    public void salvar(Pessoa pessoa) throws Exception {

        String sql = "INSERT INTO pessoa("
                + "nome,"
                + "cpf,"
                + "endereco,"
                + "rg,"
                + "telefone,"
                + "celular,"
                + "status,"
                + "email,"
                + "perfilId,"
                + "cnpj,"
                + "login,"
                + "senha"
                + ") VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";

        this.conectar();
        PreparedStatement pstm = con.prepareStatement(sql);
        pstm.setString(1, pessoa.getNome());
        pstm.setString(2, pessoa.getCpf());
        pstm.setString(3, pessoa.getEndereco());
        pstm.setString(4, pessoa.getRg());
        pstm.setString(5, pessoa.getTelefone());
        pstm.setString(6, pessoa.getCelular());
        pstm.setBoolean(7, pessoa.isStatus());
        pstm.setString(8, pessoa.getEmail());
        pstm.setInt(9, pessoa.getPerfilid().getIdPerfil());
        pstm.setString(10, pessoa.getCnpj());
        pstm.setString(11, pessoa.getLogin());
        pstm.setString(12, pessoa.getSenha());
        pstm.execute();
        this.desconectar();

    }

    public void deletar(Pessoa pessoa) throws Exception {

        String sql = "DELETE FROM pessoa WHERE idPessoa = ?";

        this.conectar();
        PreparedStatement pstm = con.prepareStatement(sql);
        pstm.setInt(1, pessoa.getIdPessoa());
        pstm.execute();
        this.desconectar();
    }

    public void alterar(Pessoa pessoa) throws Exception {

        String sql = "UPDATE pessoa SET nome=?,cpf=?,endereco=?,rg=?,telefone=?,celular=?,status=?,email=?,perfilId=?,cnpj=?,login=?,senha=?"
                + "WHERE idPessoa=?";

        this.conectar();
        PreparedStatement pstm = con.prepareStatement(sql);
        pstm.setString(1, pessoa.getNome());
        pstm.setString(2, pessoa.getCpf());
        pstm.setString(3, pessoa.getEndereco());
        pstm.setString(4, pessoa.getRg());
        pstm.setString(5, pessoa.getTelefone());
        pstm.setString(6, pessoa.getCelular());
        pstm.setBoolean(7, pessoa.isStatus());
        pstm.setString(8, pessoa.getEmail());
        pstm.setInt(9, pessoa.getPerfilid().getIdPerfil());
        pstm.setString(10, pessoa.getCnpj());
        pstm.setString(11, pessoa.getLogin());
        pstm.setString(12, pessoa.getSenha());
        pstm.setInt(13, pessoa.getIdPessoa());
        pstm.execute();
        this.desconectar();

    }

    public Pessoa getCarregar(int parametro) throws Exception {
        Pessoa pessoa = new Pessoa();
        String sql = "SELECT * FROM pessoa WHERE idPessoa = ?";

        this.conectar();
        PreparedStatement pstm = con.prepareStatement(sql);
        pstm.setInt(1, parametro);

        ResultSet rs = pstm.executeQuery();
        PerfilDAO perfDAO = new PerfilDAO();

        while (rs.next()) {
            pessoa.setIdPessoa(rs.getInt("idPessoa"));
            pessoa.setNome(rs.getString("nome"));
            pessoa.setCpf(rs.getString("cpf"));
            pessoa.setEndereco(rs.getString("endereco"));
            pessoa.setRg(rs.getString("rg"));
            pessoa.setTelefone(rs.getString("telefone"));
            pessoa.setCelular(rs.getString("celular"));
            pessoa.setStatus(rs.getBoolean("status"));
            pessoa.setEmail(rs.getString("email"));
            Perfil perfil = perfDAO.getCarregar(rs.getInt("PerfilId"));
            pessoa.setPerfilid(perfil);
            pessoa.setCnpj(rs.getString("cnpj"));
            pessoa.setLogin(rs.getString("login"));
            pessoa.setSenha(rs.getString("senha"));

        }
        this.desconectar();
        return pessoa;
    }

    public ArrayList<Pessoa> getListar() throws Exception {
        ArrayList<Pessoa> lista = new ArrayList<Pessoa>();
        String sql = "SELECT * FROM pessoa";
        this.conectar();
        PreparedStatement pstm = con.prepareStatement(sql);
        ResultSet rs = pstm.executeQuery();
        PerfilDAO perfDAO = new PerfilDAO();
        while (rs.next()) {
            Pessoa pessoa = new Pessoa();
            pessoa.setIdPessoa(rs.getInt("idPessoa"));
            pessoa.setNome(rs.getString("nome"));
            pessoa.setCpf(rs.getString("cpf"));
            pessoa.setEndereco(rs.getString("endereco"));
            pessoa.setRg(rs.getString("rg"));
            pessoa.setTelefone(rs.getString("telefone"));
            pessoa.setCelular(rs.getString("celular"));
            pessoa.setStatus(rs.getBoolean("status"));
            pessoa.setEmail(rs.getString("email"));
            Perfil perfil = perfDAO.getCarregar(rs.getInt("perfilId"));
            pessoa.setPerfilid(perfil);
            pessoa.setCnpj(rs.getString("cnpj"));
            pessoa.setLogin(rs.getString("login"));
            pessoa.setSenha(rs.getString("senha"));
            lista.add(pessoa);

        }
        this.desconectar();
        return lista;
    }

    public Pessoa buscarLogin(String login) throws Exception {
        Pessoa pessoa = null;

        String sql = "SELECT * FROM pessoa WHERE login=?";
        this.conectar();
        PreparedStatement pstm = con.prepareStatement(sql);
        pstm.setString(1, login);
        ResultSet rs = pstm.executeQuery();
        PerfilDAO perfDAO = new PerfilDAO();
        if (rs.next()) {
            pessoa = new Pessoa();
            pessoa.setIdPessoa(rs.getInt("idPessoa"));
            pessoa.setLogin(rs.getString("login"));
            pessoa.setSenha(rs.getString("senha"));
            pessoa.setStatus(rs.getBoolean("status"));
            pessoa.setNome(rs.getString("nome"));
            Perfil perfil = perfDAO.getCarregar(rs.getInt("perfilId"));
            pessoa.setPerfilid(perfil);
        }
        rs.close();
        pstm.close();

        return pessoa;
    }
}
