<%@page import="util.Upload"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="org.mypackage.catalogo.Livro"%>
<%@page import="dao.LivroDAO"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% Upload upload = new Upload();
            upload.setFolderUpload("fotos");
            if (upload.formProcess(getServletContext(), request)) {
                try {
                    Livro pro = new Livro();
                    LivroDAO prd = new LivroDAO();
                    
                        pro.setTitulo(request.getParameter("titulo"));
                        pro.setAutor(request.getParameter("autor"));
                        pro.setAno(Integer.parseInt(request.getParameter("ano")));
                        pro.setPreco(Double.parseDouble(request.getParameter("preco")));
                        pro.setIdEditora(Integer.parseInt(request.getParameter("idEditora")));
                        if (!upload.getFiles().isEmpty()) {
                            pro.setFoto(upload.getFiles().get(0));
                        }
                        prd.alterar2(pro);
                        response.sendRedirect("listalivrosedicao.jsp");
                    
                } catch (Exception erro) {
                    throw new RuntimeException("Erro 9: " + erro);
                }
            }
        %>

    </body>
</html>
