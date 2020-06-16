package dao;

import java.sql.Connection;
import dao.Conexao;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import org.mypackage.catalogo.Livro;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;


public class LivroDAO {

    private Connection conn;
    private PreparedStatement stmt;
    private Statement st;
    private ResultSet rs;
    private ArrayList<Livro> lista = new ArrayList<>();
    EntityManager em;
    

    public LivroDAO() throws Exception {
        conn = new ConnectionFactory().getConexao();
        EntityManagerFactory emf;
        emf = Conexao.getConexao();
        em = emf.createEntityManager();
    }

    public void incluir(Livro obj) throws Exception {
        try {
            em.getTransaction().begin();
            em.persist(obj);
            em.getTransaction().commit();
        } catch (RuntimeException e) {
            em.getTransaction().rollback();
            throw e;
        } finally {
            em.close();

        }
    }

    public void alterar(Livro obj) throws Exception {

        try {
            em.getTransaction().begin();
            em.merge(obj);
            em.getTransaction().commit();
        } catch (RuntimeException e) {
            em.getTransaction().rollback();
            throw e;
        } finally {
            em.close();
        }
    }
    
    public List<Livro> listar() throws Exception {
        return em.createNamedQuery("Livro.findAll").getResultList();
    }
    
    public List<Livro> listar(String filtro) throws Exception {
        return em.createNamedQuery("Livro.findFilter").setParameter("filtro", "%" + filtro + "%").getResultList();
    }
    
    public ArrayList<Livro> listarTodos() {
        String sql = "SELECT * FROM livro";
        try {
            st = conn.createStatement();
            rs = st.executeQuery(sql);
            while (rs.next()) {
                Livro livro = new Livro();
                livro.setTitulo(rs.getString("titulo"));
                livro.setAutor(rs.getString("autor"));
                livro.setAno(rs.getInt("ano"));
                livro.setPreco(rs.getDouble("preco"));
                livro.setFoto(rs.getString("foto"));
                livro.setId(rs.getInt("id"));
                livro.setIdEditora(rs.getInt("idEditora"));
                lista.add(livro);
            }
        } catch (Exception erro) {
            throw new RuntimeException("Erro 11: " + erro);
        }
        return lista;
    }

    public ArrayList<Livro> listarTodosTitutlo(String valor) {
        String sql = "SELECT * FROM livro WHERE titulo LIKE '%" + valor + "%' ";
        try {
            st = conn.createStatement();
            rs = st.executeQuery(sql);
            while (rs.next()) {
                Livro livro = new Livro();
                livro.setTitulo(rs.getString("titulo"));
                livro.setAutor(rs.getString("autor"));
                livro.setAno(rs.getInt("ano"));
                livro.setPreco(rs.getDouble("preco"));
                livro.setFoto(rs.getString("foto"));
                livro.setId(rs.getInt("id"));
                livro.setIdEditora(rs.getInt("idEditora"));
                lista.add(livro);
            }
        } catch (Exception erro) {
            throw new RuntimeException("Erro 12: " + erro);
        }
        return lista;
    }
    
}
