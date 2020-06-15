<%@page import="util.Upload"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="org.mypackage.catalogo.Livro"%>
<%@page import="dao.LivroDAO"%>
<%@page import="org.apache.commons.fileupload.servlet.*"%>
<%@page import="org.apache.commons.fileupload.*"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            Upload upload = new Upload();
            upload.setFolderUpload("fotos");
            if (upload.formProcess(getServletContext(), request)) {

                LivroDAO prd = new LivroDAO();
                Livro pro = new Livro();

                pro.setTitulo(upload.getForm().get("titulo").toString());
                pro.setAutor(upload.getForm().get("autor").toString());
                pro.setAno(Integer.parseInt(upload.getForm().get("ano").toString()));
                pro.setPreco(Double.parseDouble(upload.getForm().get("preco").toString()));
                pro.setIdEditora(Integer.parseInt(upload.getForm().get("idEditora").toString()));
                if (!upload.getFiles().isEmpty()) {
                    pro.setFoto(upload.getFiles().get(0));
                }
                prd.incluir(pro);
                response.sendRedirect("gerenciamento.jsp");

            }
        %>
    </body>
</html>
