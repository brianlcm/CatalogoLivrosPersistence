<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="org.mypackage.catalogo.Editora"%>
<%@page import="dao.EditoraDAO"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            try{
                Editora pro = new Editora();
                EditoraDAO prd = new EditoraDAO();
                if(request.getParameter("nome").equals("") || request.getParameter("cidade").equals("")){
                    response.sendRedirect("gerenciamento.jsp");
                }else{
                    pro.setNome(request.getParameter("nome"));
                    pro.setCidade(request.getParameter("cidade"));
                    prd.inserir(pro);
                    response.sendRedirect("gerenciamento.jsp");
                }
            }catch(Exception erro){
                throw new RuntimeException("Erro 8: "+erro);
            }
        %>
    </body>
</html>
