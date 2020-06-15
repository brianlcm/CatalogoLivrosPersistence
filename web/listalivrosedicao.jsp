<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dao.LivroDAO"%>
<%@page import="org.mypackage.catalogo.Livro"%>
<%@page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="estilo.css" rel="stylesheet">
        <title>Editar Livros</title>
    </head>
    <body>
        <form class="tabelaPesquisa" action="listalivrosedicao.jsp" method="post">
            <label>Título: </label>
            <input type="text" name="titulo"/>
            <button type="submit">
                Pesquisar
            </button>
            <br/><br/>
            <%
                try {
                    out.print("<table class='tabela'>");
                    out.print("<tr>");
                    out.print("<th>Capa</th><th>ID</th><th>Título</th><th>Autor(a)</th><th>Ano</th><th>Preço</th><th>ID da Editora</th><th>Editar</th>");
                    out.print("</tr>");
                    LivroDAO prd = new LivroDAO();
                    if (request.getParameter("titulo") == "" || request.getParameter("titulo") == null) {
                        ArrayList<Livro> lista = prd.listarTodos();
                        for (int num = 0; num < lista.size(); num++) {
                            out.print("<tr>");
                            out.print("<td><img src='fotos/"+lista.get(num).getFoto()+"'width='100px' height='140px'/> </td>");
                            out.print("<td>" + lista.get(num).getId() + "</td>");
                            out.print("<td>" + lista.get(num).getTitulo() + "</td>");
                            out.print("<td>" + lista.get(num).getAutor() + "</td>");
                            out.print("<td>" + lista.get(num).getAno() + "</td>");
                            out.print("<td>" + "R$ " + lista.get(num).getPreco() + "</td>");
                            out.print("<td>" + lista.get(num).getIdEditora() + "</td>");
                            out.print("<td><a href='editarlivro.jsp?titulo=" + lista.get(num).getTitulo() + "&autor=" + lista.get(num).getAutor() + "&ano=" + lista.get(num).getAno() + "&preco=" + lista.get(num).getPreco() + "&foto=" + lista.get(num).getFoto() + "&idEditora=" + lista.get(num).getIdEditora() + "&id=" + lista.get(num).getId()+" '> Editar</a></td>");
                            out.print("<tr>");
                        }
                    } else {
                        ArrayList<Livro> lista = prd.listarTodosTitutlo(request.getParameter("titulo"));
                        for (int num = 0; num < lista.size(); num++) {
                            out.print("<tr>");
                            out.print("<td><img src='fotos/"+lista.get(num).getFoto()+"'width='100px' height='140px'/> </td>");
                            out.print("<td>" + lista.get(num).getId() + "</td>");
                            out.print("<td>" + lista.get(num).getTitulo() + "</td>");
                            out.print("<td>" + lista.get(num).getAutor() + "</td>");
                            out.print("<td>" + lista.get(num).getAno() + "</td>");
                            out.print("<td>" + "R$ " + lista.get(num).getPreco() + "</td>");
                            out.print("<td>" + lista.get(num).getIdEditora() + "</td>");
                            out.print("<td><a href='editarlivro.jsp?titulo=" + lista.get(num).getTitulo() + "&autor=" + lista.get(num).getAutor() + "&ano=" + lista.get(num).getAno() + "&preco=" + lista.get(num).getPreco() + "&foto=" + lista.get(num).getFoto() + "&idEditora=" + lista.get(num).getIdEditora() + "&id=" + lista.get(num).getId()+" '> Editar</a></td>");
                            out.print("<tr>");
                        }
                    }
                    out.print("</table>");
                } catch (Exception erro) {
                    throw new RuntimeException("Erro 12: " + erro);
                }
            %>
            <br/>
            <b><a class="linkVoltarParaHome" href="gerenciamento.jsp">Voltar para a página de Gerenciamento</a></b>
    </body>
</html>