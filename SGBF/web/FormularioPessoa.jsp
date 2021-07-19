<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.util.List"%>
<%@page import="beans.Pessoa"%>
<%@page import="controle.ServletSeguranca" %>
<% Pessoa verifica = ServletSeguranca.verificarAcesso(request, response);
    if (!verifica.getPerfilid().getDescricao().equals("Administrador")) {%>
<script>alert('Você não pode acessar esta página.');history.back();</script>
<%}%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Adicionar Pessoa</title>
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <link href="css/AdminLTE.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="js/jQuery-2.1.4.min.js" type="text/javascript"></script>
        <script src="js/jquery.maskedinput.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/_all-skins.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/custom.css" rel="stylesheet" type="text/css"/>
        <script>
    jQuery(function ($) {
        $("#telefone").mask("(99) 9999-9999");
        $("#celular").mask("(99)99999-9999");
        $("#cpf").mask("***.***.***-**");
        $("#cnpj").mask("**.***.***/****-**");
    });

    $(document).ready(function () {
        $('#usuario').on('change', function () {
            if (this.value == "2" || this.value == "3") {
                $("#ocultar").hide();
                $("#cnpj").show();
             }else{
                 $("#ocultar").show();
                 $("#cnpj").hide();
             }
        });
    });
        </script>
    </head>
    <body class="skin-green fixed sidebar-mini">
        <div class="wrapper">

            <header class="main-header">
                <a href="" class="logo">
                    <span class="logo-mini">CLI</span>
                    <span class="logo-lg"><img src="" alt="Pessoa" width="200" height="45"></span>
                </a>
                <nav class="navbar navbar-static-top" role="navigation">
                    <a href="" class="sidebar-toggle" data-toggle="offcanvas" role="button">
                        <span class="sr-only">Navegação</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </a>
                    <div class="navbar-custom-menu">
                        <!--Área de notificação-->
                        <%@include file="areaNotificacao.jsp" %>
                        <!--Fim da Área de notificação-->
                    </div>

                </nav>
            </header>
            <aside class="main-sidebar">
                <!--Menu Principal-->
                <%@include file="menu.jsp" %>
                <!--Fim menu Principal-->
            </aside>

            <div class="content-wrapper" style="min-height: 562px;">
                <section class="content-header">
                    <h1>Adicionar Pessoa</h1>
                    <ol class="breadcrumb">
                        <li><a href="Administracao.jsp"><i class="fa fa-dashboard"></i> Principal</a></li>
                        <li><a href="" class="active">Pessoa</a></li><li class="active">Adicionar Pessoa</li>            </ol>
                </section>

                <div class="col-lg-12 alerts">
                    <div id="custom-alerts" style="display:none;">
                        <div class="alert alert-dismissable">
                            <div class="custom-msg"></div>
                        </div>
                    </div>
                </div>
                <section class="content">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="box box-primary">
                                <div class="box-header">
                                    <h3 class="box-title">Por favor, preencha as informações abaixo</h3>
                                </div>
                                <div class="box-body">
                                    <!--CADASTRO DE CLIENTE-->

                                    <form action="ServletPessoa" method="post">
                                        <input type="hidden" name="idPessoa" value="${p.idPessoa}">
                                        <div class="col-md-10">
                                            <div class="row">
                                                <div class="form-group col-md-10">
                                                    <label  for="nome">NOME COMPLETO</label>
                                                    <input type="text" required name="nome" value="${p.nome}" class="form-control " id="nome" placeholder="Preencha aqui o nome completo">

                                                </div>
                                                <div class="form-group col-md-2">
                                                    <label for="perfil">PERFIL</label>
                                                    <select name="perfil" class="form-control" id="usuario">
                                                        <option disable selected value="null">Selecione</option>
                                                        <jsp:useBean id="dao" class="daos.PerfilDAO"></jsp:useBean>
                                                        <c:forEach var="perfil" items="${dao.listar}">
                                                            <c:if test="${p.perfilid.idPerfil == perfil.idPerfil }">
                                                                <option id='${perfil.idPerfil}' value="${perfil.idPerfil}" selected>${perfil.descricao}</option>  
                                                            </c:if>
                                                            <c:if test="${p.perfilid.idPerfil != perfil.idPerfil }">
                                                                <option id='${perfil.idPerfil}' value="${perfil.idPerfil}">${perfil.descricao}</option>  
                                                            </c:if>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="form-group col-md-6">
                                                    <label  for="telefone">TELEFONE</label>
                                                    <input type="text" name="telefone" value="${p.telefone}"class="form-control"id="telefone" placeholder="EX:. (00) 0000-0000">
                                                </div>
                                                <div class="form-group col-md-6">
                                                    <label  for="celular">CELULAR</label>
                                                    <input type="text" name="celular" value="${p.celular}"class="form-control " id="celular" placeholder="EX:. (00)0 0000-0000">
                                                </div>
                                            </div>
                                            <div id="cnpj" class="form-group">
                                                <label  for="cnpj">CNPJ</label>
                                                <input type="text" name="cnpj" value="${p.cnpj}"class="form-control " id="cnpj" placeholder="EX:. 00.000.000/0000-00">
                                            </div>
                                            <div class="row">
                                                <div class="form-group col-md-6">
                                                    <label  for="cpf">CPF</label>
                                                    <input type="text" name="cpf" value="${p.cpf}" class="form-control " id="cpf" placeholder="EX:. 000.000.000-00">
                                                </div>

                                                <div class="form-group col-md-6">
                                                    <label  for="rg">RG</label>
                                                    <input type="text" name="rg" value="${p.rg}"class="form-control " id="rg" placeholder="EX:. 0.000.000">
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="form-group col-md-6">
                                                    <c:if test="${p.status == true || p.status == null}">
                                                        <div class="radio">

                                                            <label>

                                                                <input type="radio" name="status" value="true" checked> ATIVO
                                                            </label>
                                                        </div>
                                                        <div class="radio">
                                                            <label>
                                                                <input type="radio" name="status" value="false" > INATIVO

                                                            </label>
                                                        </div>
                                                    </c:if>
                                                    <c:if test="${p.status == false}">
                                                        <div class="radio">

                                                            <label>

                                                                <input type="radio" name="status" value="true" > ATIVO
                                                            </label>
                                                        </div>
                                                        <div class="radio">
                                                            <label>
                                                                <input type="radio" name="status" value="false" checked> INATIVO

                                                            </label>
                                                        </div>
                                                    </c:if>

                                                </div>
                                                <div id="ocultar">
                                                <div  class="form-group col-md-3">
                                                    <label  for="login">LOGIN</label>
                                                    <input type="text" value="${p.login} "name="login" class="form-control " id="login">
                                                </div>
                                                <div class="form-group col-md-3">
                                                    <label  for="senha">SENHA</label>
                                                    <input type="password" value="${p.senha}" name="senha" class="form-control " id="senha">
                                                </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label  for="email_address">E-MAIL</label>
                                                <input type="email" name="email" value="${p.email}"class="form-control " id="email_address" placeholder="EX:. nomedeusuario@email.com">
                                            </div>
                                            <div class="form-group">
                                                <label  for="endereco">ENDEREÇO RESIDENCIAL</label>
                                                <textarea class="form-control" id="endereco" name="endereco" rows="3">${p.endereco}</textarea>
                                            </div>
                                            <div class="form-group">
                                                <input type="submit" value="SALVAR" class="btn btn-success">
                                            </div>
                                        </div>
                                </div>
                                </form>
                            </div>
                        </div>
                    </div>
            </div>
        </section>
    </div>
    <!--Rodapé-->
    <%@include file="footer.jsp" %>
    <!--Fim Rodapé-->
</div>
<!--Scripts javascript-->
<script src="js/app.min.js" type="text/javascript"></script>
<!--Scripts javascript-->
</body>
</html>