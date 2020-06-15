package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import org.mypackage.catalogo.Usuario;

public class UsuarioDAO {
    private Connection conn;
    private PreparedStatement stmt;
    private Statement st;
    private ResultSet rs;
    
    public UsuarioDAO() {
        conn = new ConnectionFactory().getConexao();
    }

    public void inserir(Usuario usuario) {
        String sql = "INSERT INTO usuario (nome, senha) VALUES (?,?)";
        try {
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, usuario.getNome());
            stmt.setString(2, usuario.getSenha());
            stmt.execute();
            stmt.close();
        } catch (Exception erro) {
            throw new RuntimeException("Erro 10: " + erro);
        }
    }
}
