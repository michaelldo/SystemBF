<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
  
    HttpSession sessao = request.getSession();
    if (sessao.getAttribute("pessoa") != null){
        response.sendRedirect("Administracao.jsp");
    }

%>
<!doctype html>
<html lang="pt-br">
    <head>
        <title>Login-SGBF</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <meta name="author" content="Marcos Cordeiro">
        <link href="css/signin.css" rel="stylesheet">
    </head>
    <body>
        <div class="container">
            <div class="form-signin">
                <form action="ServletSeguranca" method="post">
                    <h2 class="form-signin-heading"><img src="imagens/LOGO.PNG" width="200"/></h2>
                    <label for="login" class="sr-only">Login</label>
                    <input type="text" name="login" id="login" class="form-control" placeholder="Login"  autofocus>
                    <label for="senha" class="sr-only">Senha</label>
                    <input type="password" name="senha" id="inputPassword" class="form-control" placeholder="Senha" >
                    <button class="btn btn-lg btn-primary btn-block" style="background-color:#008000;border-color:#008000;"type="submit">Entrar</button>
                </form>
            </div>
        </div>
    </body>
</html>