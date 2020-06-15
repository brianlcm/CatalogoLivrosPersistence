<%@page import="dao.UsuarioDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dao.LivroDAO"%>
<%@page import="org.mypackage.catalogo.Livro"%>
<%@page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="estilo.css" rel="stylesheet">
        <title>Resultado</title>
    </head>
    <body>
        <h2 class="titulo">Pesquisar livros</h2>
        <form class="tabelaPesquisa" action="resultadoPesquisa.jsp" method="post">
            <label>Título: </label>
            <input type="text" name="titulo"/>
            <button type="submit">
                Pesquisar
            </button>

            <h2 class="titulo">Resultado da Pesquisa</h2>
            <%
                try {
                    LivroDAO prd = new LivroDAO();
                    ArrayList<Livro> lista = prd.listarTodosTitutlo(request.getParameter("titulo"));
                    if (lista.size() == 0) {
                        out.print("<p>:/</br>Livro não encontrado no catálogo</p>");
                    } else {
                        out.print("<table class='tabela'>");
                        out.print("<tr>");
                        out.print("<th>Capa</th><th>ID</th><th>Título</th><th>Autor(a)</th><th>Ano</th><th>Preço</th><th>ID da Editora</th>");
                        out.print("</tr>");

                        for (int num = 0; num < lista.size(); num++) {
                            out.print("<tr>");
                            out.print("<td><img src='fotos/" + lista.get(num).getFoto() + "'width='100px' height='140px'/> </td>");
                            out.print("<td>" + lista.get(num).getId() + "</td>");
                            out.print("<td>" + lista.get(num).getTitulo() + "</td>");
                            out.print("<td>" + lista.get(num).getAutor() + "</td>");
                            out.print("<td>" + lista.get(num).getAno() + "</td>");
                            out.print("<td>" + "R$ " + lista.get(num).getPreco() + "</td>");
                            out.print("<td>" + lista.get(num).getIdEditora() + "</td>");
                            out.print("<tr>");
                        }
                        out.print("</table>");
                    }

                } catch (Exception erro) {
                    throw new RuntimeException("Erro 12: " + erro);
                }
            %>

        </form>
    </body>
</html>
