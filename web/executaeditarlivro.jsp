<%@page import="util.Upload"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="org.mypackage.catalogo.Livro"%>
<%@page import="dao.LivroDAO"%>
<%@page import="java.util.Map.Entry"%>
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
                Livro pro = new Livro();
                LivroDAO prd = new LivroDAO();

                pro.setTitulo(upload.getForm().get("titulo").toString());
                pro.setAutor(upload.getForm().get("autor").toString());
                pro.setAno(Integer.parseInt(upload.getForm().get("ano").toString()));
                pro.setPreco(Double.parseDouble(upload.getForm().get("preco").toString()));
                pro.setIdEditora(Integer.parseInt(upload.getForm().get("idEditora").toString()));
                pro.setId(Integer.parseInt(upload.getForm().get("id").toString()));
                if (!upload.getFiles().isEmpty()) {
                    pro.setFoto(upload.getFiles().get(0));
                }

                prd.alterar(pro);
                response.sendRedirect("listalivrosedicao.jsp");
                

            }
        %>

    </body>
</html>
