<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="estilo.css" rel="stylesheet">
        <title>Adicionar Livro</title>
    </head>
    <body>
        <h1 class="titulo">Adicionar Livro</h1>
        <form class="tabelaFormulario" action="executaadicionarlivro.jsp" method="post" enctype="multipart/form-data">
            
            <label>Título:</label><br/>
            <input type="text" name="titulo" /><br/>

            <label>Autor(a):</label><br/>
            <input type="text" name="autor" /><br/>

            <label>Ano:</label><br/>
            <input type="number" name="ano" /><br/>

            <label>Preço:</label><br/>
            <input type="number" name="preco" /><br/>
            
            <label>ID da Editora:</label><br/>
            <input type="number" name="idEditora" /><br/>

            <label>Foto da Capa:</label><br/>
            <input type="file" name="foto" /><br/><br/>

            <button type="submit">
                <b>Confirmar</b>
            </button>
        </form>
        <br/><b><a class="linkVoltarParaHome" href="gerenciamento.jsp">Voltar para a página de Gerenciamento</a></b>
    </body>
</html>
