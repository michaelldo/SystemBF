<%@page import="java.util.List"%>
<%@page import="beans.Pessoa"%>
<%@page import="controle.ServletSeguranca" %>
<% Pessoa verifica = ServletSeguranca.verificarAcesso(request, response);
    if (!verifica.getPerfilid().getDescricao().equals("Administrador")) {%>
<script>alert('Você não pode acessar esta página.');history.back();</script>
<%}%>
<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Detalhes ${ver.nome}</title>
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <link href="css/AdminLTE.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="js/jQuery-2.1.4.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <link href="css/jquery.dataTables.min.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery.dataTables.min.js" type="text/javascript"></script>
        <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/_all-skins.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/custom.css" rel="stylesheet" type="text/css"/>
    </head>
    <body class="skin-green fixed sidebar-mini">
        <div class="wrapper">
            <header class="main-header">
                <a href="" class="logo">
                    <span class="logo-mini">Lista</span>
                    <span class="logo-lg"><img src="" alt="Lista de Pedidos" width="200" height="45"></span>
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
                    <h1>Detalhes ${ver.nome}</h1>
                    <ol class="breadcrumb">
                        <li><a href=""><i class="fa fa-dashboard"></i> Principal</a></li>
                        <li class="active">Pedidos</li>
                    </ol>
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
                                <div class="box-body">
                                    <table class="table table-striped">
                                        <thead>
                                        <td><img src="imagens/LOGO.PNG" width="100"></td>
                                        <td colspan="3">
                                            <p>
                                                <strong>SORVETERIA BIG FRUTA LTDA</strong><BR/>
                                                <b>CNPJ:</b><br/>
                                                <b>ENDEREÇO:</b> QUADRA 16 LOTE 04 JARDIM DA BARRAGEM III<br/>
                                                <b>CIDADE:</b> ÁGUAS LINDAS DE GOIÁS -GO</p>
                                        </td>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td colspan="3">
                                                    <b>NOME:</b> ${ver.nome}
                                                </td>
                                                <td>
                                                    <b>CÓDIGO:</b> ${ver.idPessoa}
                                                </td>
                                            </tr>
                                            <tr>
                                                <td><b>RG:</b> ${ver.rg}<td>
                                                <td><b>CPF:</b> ${ver.cpf} </td>
                                                <td><b>CNPJ:</b> ${ver.cnpj} </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2"><b>TELEFONE:</b> ${ver.telefone}</td>
                                                <td colspan="2"><b>CELULAR:</b> ${ver.celular}</td>
                                            </tr>
                                            <tr>
                                                <c:if test="${ver.status == true}">
                                                    <td colspan="2"><b>STATUS</b> ATIVO</td>
                                                </c:if>
                                                <c:if test="${ver.status == false}">
                                                    <td colspan="2"><b>STATUS</b> INATIVO</td>
                                                </c:if>
                                                <td colspan="2"><b>EMAIL</b> ${ver.email}</td>
                                            </tr>
                                            <tr>
                                                <td colspan="2"><b>PERFIL</b> ${ver.perfilid.descricao}</td>
                                                <td colspan="2"><b>LOGIN:</b> ${ver.login}</td>
                                            </tr>
                                            <tr>
                                                <td colspan="4"><b>ENDEREÇO</b> ${ver.endereco}</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <a href="ListaPessoa.jsp" class="btn btn-success">Voltar</a>

                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>

            <script src="js/app.min.js" type="text/javascript"></script>
            <!--Rodapé-->
            <%@include file="footer.jsp" %>
            <!--Fim Rodapé-->
    </body>
</html>

