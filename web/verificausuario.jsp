<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="dao.ConnectionFactory"%>
<%@page import="dao.UsuarioDAO"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
                try {
                    Connection conn;
                    PreparedStatement stmt;
                    Statement st;
                    ResultSet rs;
                    UsuarioDAO user = new UsuarioDAO();
                    String usu = request.getParameter("nome");
                    String sen = request.getParameter("senha");

                    if (usu.equals("") || sen.equals("")) {
                        response.sendRedirect("index.jsp");
                    }

                    String sql = "SELECT * FROM usuario WHERE nome LIKE '%" + usu + "%' and senha LIKE '%" + sen + "%'";
                    conn = new ConnectionFactory().getConexao();
                    st = conn.createStatement();
                    rs = st.executeQuery(sql);
                    if (rs.next()) {
                        response.sendRedirect("gerenciamento.jsp");
                    } else {
                        response.sendRedirect("index.jsp");
                    }
                } catch (Exception e) {
                    out.println(e);
                }
        %>
    </body>
</html>
