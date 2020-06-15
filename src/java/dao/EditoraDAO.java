package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import org.mypackage.catalogo.Editora;

public class EditoraDAO {

    private Connection conn;
    private PreparedStatement stmt;
    private Statement st;
    private ResultSet rs;

    public EditoraDAO() {
        conn = new ConnectionFactory().getConexao();
    }

    public void inserir(Editora editora) {
        String sql = "INSERT INTO editora (nome, cidade) VALUES (?,?)";
        try {
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, editora.getNome());
            stmt.setString(2, editora.getCidade());
            stmt.execute();
            stmt.close();
        } catch (Exception erro) {
            throw new RuntimeException("Erro 4: " + erro);
        }
    }

}
