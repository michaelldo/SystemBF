package daos;

import java.sql.Connection;
import java.sql.DriverManager;

public abstract class Conexao {
    Connection con;

    public void conectar() throws Exception {
        Class.forName("org.gjt.mm.mysql.Driver");
        String url = "jdbc:mysql://localhost/sgbf";
        String user = "root";
        String pass = "";

        con = DriverManager.getConnection(url, user, pass);

    }

    public void desconectar() throws Exception {
        if (!con.isClosed()) {
            con.close();
        }
    }
}
