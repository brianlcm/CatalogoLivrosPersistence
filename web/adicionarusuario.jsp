<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="estilo.css" rel="stylesheet">
        <title>Adicionar Usuário</title>
    </head>
    <body>
        <h1 class="titulo">Adicionar Usuário</h1>
        <form class="tabelaFormulario" action="executaadicionarusuario.jsp" method="post">
            <label>Nome</label><br/>
            <input type="text" name="nome" /><br/>
            
            <label>Senha</label><br/>
            <input type="password" name="senha" /><br/><br/>
            
            <button type="submit">
                <b>Confirmar</b>
            </button>
        </form>
        <br/><b><a class="linkVoltarParaHome" href="gerenciamento.jsp">Voltar para a página de Gerenciamento</a></b>
    </body>
</html>
