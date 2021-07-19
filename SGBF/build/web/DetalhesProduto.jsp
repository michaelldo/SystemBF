<%@page import="java.util.List"%>
<%@page import="beans.Pessoa"%>
<%@page import="controle.ServletSeguranca" %>

<% Pessoa verifica = ServletSeguranca.verificarAcesso(request, response);
    if (!verifica.getPerfilid().getDescricao().equals("Administrador")) {

%>
<script>alert('Você não pode acessar esta página.');history.back();</script>
<%}%><!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Adicionar produtos</title>
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
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
        $("#campoData").mask("99/99/9999");
        $("#campoData2").mask("99/99/9999");

    });
    $('#sabor').on('shown.bs.modal', function () {
        $('#myInput').focus();
    });
    $('#myModal').on('shown.bs.modal', function () {
        $('#myInput').focus()
    })

        </script>
    </head>
    <body class="skin-green fixed sidebar-mini">
        <div class="wrapper">
            <header class="main-header">
                <a href="" class="logo">
                    <span class="logo-mini">Pro</span>
                    <span class="logo-lg"><img src="" alt="Produtos" width="200" height="45"></span>
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
                <!--Scripts javascript-->
                <%@include file="menu.jsp" %>
                <!--Scripts javascript-->
            </aside>
            <div class="content-wrapper" style="min-height: 562px;">
                <section class="content-header">
                    <h1>Detalhes do produto</h1>
                    <ol class="breadcrumb">
                        <li><a href=""><i class="fa fa-dashboard"></i> Principal</a></li>
                        <li><a href="">Produtos</a></li><li class="active">Detalhes do Produto</li>            </ol>
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
                                    <h3 class="box-title">Informações sobre o produto.</h3>
                                </div>
                                <div class="box-body">
                                    <form action="ServletProduto" method="post">
                                        <input type="hidden" class="form-control" name="idProduto"  value="${ver.idProduto}">
                                        <div class="row">
                                            <div class="form-group col-md-4">
                                                <label for="type">SABOR: </label>

                                                ${ver.saborId.descricao}

                                                </select>
                                            </div>
                                            <div class="form-group col-md-4">
                                                <label for="categoria">CATEGORIA: </label>&nbsp;&nbsp;
                                                ${ver.categoriaId.nome}
                                            </div>
                                            <div class="form-group col-md-4">
                                                <label for="categoria">TIPO: </label>&nbsp;&nbsp;
                                                ${ver.categoriaId.tipo}
                                            </div>
                                        </div>
                                        <!-- Linha acima 2 itens-->
                                        <div class="row">
                                            <div class="form-group col-md-2">
                                                <label for="peso">PESO: </label>
                                                ${ver.peso}
                                            </div>
                                            <div class="form-group col-md-2">
                                                <label for="quantidade">QUANTIDADE: </label>
                                                ${ver.quantidade}
                                            </div>
                                            <div class="form-group col-md-2">
                                                <label for="preco">PREÇO</label>
                                                <c:set var="valor" value="25" />
                                                <fmt:setLocale value="pt-BR" />
                                                <fmt:formatNumber value="${ver.preco}" type="currency"/>
                                            </div>
                                            <div class="form-GROUP col-md-4">
                                                <label for="und">UNIDADE DE MEDIDA: </label>
                                                ${ver.undMedida}
                                                </select>
                                            </div>
                                        </div>
                                        <!-- Linha acima 3 itens-->
                                        <div class="row">
                                            <div class="form-group col-md-5">
                                                <label for="dataFabricacao">DATA DE FABRICAÇÃO: </label>
                                                <fmt:formatDate value="${ver.dataFabricacao}" pattern="dd/MM/yyyy"/>
                                            </div>
                                            <div class="form-group col-md-5">
                                                <label for="dataValidade">DATA DE VALIDADE: </label>
                                                <fmt:formatDate value="${ver.dataVencimento}" pattern="dd/MM/yyyy"/>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="form-group col-md-10"rows="2">
                                                <label for="descricao">DESCRIÇÃO: </label>
                                                ${ver.descricao}
                                            </div>
                                        </div>
                                        <div class="row">
                                            <!-- Linha acima 2 itens-->
                                            <div class="form-group col-md-4">
                                                <label for="quantidadeMin">ALERTA DE QUANTIDADE MÍNIMA: </label>
                                                ${ver.quantidadeMin}
                                            </div>
                                            <div class="form-group col-md-2">
                                                <label>STATUS:</label>
                                                <c:if test="${ver.status == true}">
                                                    ATIVO
                                                </c:if>
                                                <c:if test="${ver.status == false}">
                                                    INATIVO
                                                </c:if>
                                            </div> 

                                        </div>
                                    </form>
                                </div>
                            </div>
                            </section>
                        </div>

                    </div>
                    <!--Rodapé-->
                    <%@include file="footer.jsp" %>
                    <!--Fim Rodapé-->
                    <!--Scripts javascript-->
                    <script src="js/app.min.js" type="text/javascript"></script>
                    <!--Scripts javascript-->
                    </body>
                    </html>