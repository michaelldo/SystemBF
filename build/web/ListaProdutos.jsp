<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page import="java.util.List"%>
<%@page import="beans.Pessoa"%>
<%@page import="controle.ServletSeguranca" %>
<% Pessoa verifica = ServletSeguranca.verificarAcesso(request, response);
    if (!verifica.getPerfilid().getDescricao().equals("Administrador")) {%>
<script>alert('Você não pode acessar esta página.');history.back();</script>
<%}%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de Produtos</title>
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
                    <span class="logo-lg"><img src="" alt="Lista de Produtos" width="200" height="45"></span>
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
                    <h1>Lista de Produtos</h1>
                    <ol class="breadcrumb">
                        <li><a href=""><i class="fa fa-dashboard"></i> Principal</a></li>
                        <li class="active">Produtos</li>
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
                                <div class="box-header">
                                    <h3 class="box-title">Use a Tabela Abaixo para filtrar os resultados.</h3>
                                </div>
                                <div class="box-body">
                                    <h3 class="box-title"></h3><hr>
                                    <table id="example" class="table-striped">
                                        <thead>
                                            <tr>
                                                <th>CATEGORIA</th>
                                                <th>SABOR</th>
                                                <th>PREÇO</th>
                                                <th>QUANTIDADE DISPONÍVEL</th>
                                                <th>DETALHES</th>
                                                <th>STATUS</th>
                                                <th>EDITAR</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <jsp:useBean id="dao" class="daos.ProdutoDAO"></jsp:useBean>
                                            <c:forEach var="produto" items="${dao.listar}">
                                                <tr>
                                                    <td>${produto.categoriaId.nome}&nbsp;${produto.saborId.descricao}</td>
                                                    <td> ${produto.categoriaId.tipo}</td>
                                                    <td>
                                                        <c:set var="valor" value="25" />
                                                        <fmt:setLocale value="pt-BR" />
                                                        <fmt:formatNumber value="${produto.preco}" type="currency"/>
                                                    </td>
                                                    <td>${produto.quantidade}</td>
                                                    <td style="width: 10px;text-align: center;">
                                                        <a class="btn btn-primary" href="ServletProduto?acao=detalhes&idProduto=${produto.idProduto}">
                                                            <i class="fa fa-search"></i>
                                                        </a>
                                                    </td>
                                                    <td style="width: 10px;text-align: center;">
                                                        <c:if test="${produto.status == true}">
                                                            <button class="btn btn-success" disabled> <i class="fa fa-unlock"></i></button>
                                                            </c:if>
                                                            <c:if test="${produto.status == false}">
                                                            <button class="btn btn-danger" disabled><i class="fa fa-lock"></i></button>
                                                            </c:if>
                                                    </td>
                                                    <td style="width: 10px;text-align: center;">
                                                        <a class="btn btn-primary" href="ServletProduto?acao=alterar&idProduto=${produto.idProduto}">
                                                            <i class="fa fa-edit"></i>
                                                        </a>
                                                    </td>

                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
            <script type="text/javascript">
    $(document).ready(function () {
        $('#example').DataTable({
            "language": {
                "search": "Pesquisar",
                "lengthMenu": "Exibir _MENU_ registros por página",
                "zeroRecords": "Nenhum registro encontrado",
                "info": "Exibindo página _PAGE_ de _PAGES_",
                "infoEmpty": "Nenhum registro encontrado",
                "infoFiltered": "(filtrados de _MAX_ registros)",
                "paginate": {
                    "first": "Primeira",
                    "previous": "Anterior",
                    "next": "Pr&oacute;xima",
                    "last": "&Uacute;ltima"
                }
            }
        });
    });
            </script>
            <script src="js/app.min.js" type="text/javascript"></script>
            <!--Rodapé-->
            <%@include file="footer.jsp" %>
            <!--Fim Rodapé-->
    </body>
</html>

