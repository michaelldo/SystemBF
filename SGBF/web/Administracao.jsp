<!DOCTYPE html>
<%@page import="java.util.List"%>
<%@page import="beans.Pessoa"%>
<%@page import="controle.ServletSeguranca" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Administração</title>
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/AdminLTE.min.css" rel="stylesheet" type="text/css"/>
        <script src="js/jQuery-2.1.4.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <link href="css/_all-skins.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/custom.css" rel="stylesheet" type="text/css"/>
       
    </head>
    <body class="skin-green fixed sidebar-mini">
        <div class="wrapper">

            <header class="main-header">
                <a href="" class="logo">
                    <span class="logo-mini">ADM</span>
                    <span class="logo-lg"><img src="" alt="Administração" width="200" height="45"></span>
                </a>
                <nav class="navbar navbar-static-top" role="navigation">
                    <a href="" class="sidebar-toggle" data-toggle="offcanvas" role="button"></a>
                    
                    <div class="navbar-custom-menu">
                        <!--Área de notificação-->
                        <%@include file="areaNotificacao.jsp" %>
                        <!--Fim da Área de notificação-->
                    </div>
                    </ul>
                </nav>
            </header>
            <aside class="main-sidebar">
                <div class="treeview-menu active">
                    <!--Menu Principal-->
                    <%@include file="menu.jsp" %>
                    <!--Fim menu Principal-->
                </div>
            </aside>

            <div class="content-wrapper" style="min-height: 562px;">
                <section class="content-header">
                    <h1>Administração</h1>
                    <ol class="breadcrumb">
                        <li><a href=""><i class="fa fa-dashboard"></i> Principal</a></li>
                        <li class="active">Administração</li>            </ol>
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
                            <div class="box box-success">
                                <div class="box-header">
                                    <h3 class="box-title">Links Rápidos</h3>
                                </div>
                                <!--Menu de links rápidos-->
                                <%@include file="linksRapidos.jsp" %>
                                <!--fim menu links-->
                            </div>

                            <div class="row">
                                <div class="col-md-12">
                                    <div class="box box-primary">
                                        <div class="box-body">
                                            <table id="example" class="table table-striped">
                                                <thead>
                                                    <tr>
                                                        <th>DESCRIÇÃO</th>
                                                        <th>SITUAÇÃO</th>
                                                        <th>EDITAR</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <jsp:useBean id="dao" class="daos.ProdutoDAO"></jsp:useBean>
                                                    <c:forEach var="produto" items="${dao.listar}">
                                                        <c:if test="${produto.quantidade <= produto.quantidadeMin}">
                                                            <tr>
                                                                <td>
                                                                    ${produto.categoriaId.nome}
                                                                    ${produto.saborId.descricao}
                                                                    ${produto.categoriaId.tipo}

                                                                </td>
                                                                <td>
                                                                    <c:if test="${produto.quantidade < produto.quantidadeMin}">
                                                                        <button class="btn btn-danger btn-xs" type="button" title="O produto está Abaixo quantidade Mínima!">
                                                                            Baixo <span class="badge">${produto.quantidade}</span>
                                                                        </button>
                                                                    </c:if>
                                                                    <c:if test="${produto.quantidade == produto.quantidadeMin}">
                                                                        <button class="btn btn-warning btn-xs" type="button" title="O produto está chegando na quantidade Mínima!">
                                                                            Alerta <span class="badge">${produto.quantidade}</span>
                                                                        </button>
                                                                    </c:if>

                                                                </td>

                                                                <%if (verifica.getPerfilid().getDescricao().equals("Administrador")) {%>
                                                                <td style="width: 10px;text-align: center;">
                                                                    <a class="btn btn-success btn-xs" href="ServletProduto?acao=alterar&idProduto=${produto.idProduto}">
                                                                        <i class="fa fa-edit"></i>
                                                                    </a>
                                                                </td>
                                                                <%} else {%>
                                                                <td style="width: 10px;text-align: center;">
                                                                    <a class="btn btn-success btn-xs" disabled>
                                                                        <i class="fa fa-edit"></i>
                                                                    </a>
                                                                </td>
                                                                <%}%>
                                                            </tr>
                                                        </c:if>

                                                    </c:forEach>

                                                </tbody>
                                            </table>

                                        </div>
                                    </div>
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