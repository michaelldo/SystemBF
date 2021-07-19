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
                    <h1>ADICIONAR PRODUTO</h1>
                    <ol class="breadcrumb">
                        <li><a href=""><i class="fa fa-dashboard"></i> Principal</a></li>
                        <li><a href="">Produtos</a></li><li class="active">ADICIONAR PRODUTO</li>            </ol>
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
                                    <h3 class="box-title">Por favor, preencha as informações abaixo.</h3>
                                </div>
                                <div class="box-body">
                                    <form action="ServletProduto" method="post">
                                        <input type="hidden" class="form-control" name="idProduto"  value="${p.idProduto}">
                                        <div class="row">
                                            <div class="form-group col-md-5">
                                                <label for="type">SABOR</label>&nbsp;&nbsp;
                                                <button type="button" class="btn btn-success btn-xs" data-toggle="modal" data-target="#sabor" title="Adicionar um novo sabor rapidamente.">
                                                    <i class="fa fa-plus-square"></i>
                                                </button>
                                                <jsp:useBean id="daoSabor" class="daos.SaborDAO"></jsp:useBean>
                                                    <select name="sabor" class="form-control" required>
                                                        <option selected disable>Selecione</option>
                                                    <c:forEach var="sabor" items="${daoSabor.listar}">
                                                        <c:if test="${p.saborId.idSabor == sabor.idSabor}">
                                                            <option  value="${sabor.idSabor}"selected>${sabor.descricao}</option>
                                                        </c:if>
                                                        <c:if test="${p.saborId.idSabor != sabor.idSabor}">
                                                            <option  value="${sabor.idSabor}">${sabor.descricao}</option>
                                                        </c:if>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                            <div class="form-group col-md-5">
                                                <label for="categoria">CATEGORIA</label>&nbsp;&nbsp;

                                                <button type="button" class="btn btn-success btn-xs" data-toggle="modal" data-target="#myModal" title="Adicionar uma nova categoria rapidamente.">
                                                    <i class="fa fa-plus-square"></i>
                                                </button>
                                                <jsp:useBean id="daoCategoria" class="daos.CategoriaDAO"></jsp:useBean>
                                                    <select id="categoria" name="categoria" class="form-control" required>
                                                        <option disable selected>Selecione</option>
                                                    <c:forEach var="categoria" items="${daoCategoria.listar}">
                                                        <c:if test="${p.categoriaId.idCategoria == categoria.idCategoria}">
                                                            <option  value="${categoria.idCategoria}" selected>${categoria.nome} - ${categoria.tipo}</option>     
                                                        </c:if>
                                                        <c:if test="${p.categoriaId.idCategoria != categoria.idCategoria}">
                                                            <option  value="${categoria.idCategoria}">${categoria.nome} - ${categoria.tipo}</option>     
                                                        </c:if>

                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                        <!-- Linha acima 2 itens-->
                                        <div class="row">
                                            <div class="form-group col-md-2">
                                                <label for="peso">PESO</label>
                                                <input type="text" name="peso" value="${p.peso}" class="form-control" id="peso" placeholder="EX:. 1.8">
                                            </div>
                                            <div class="form-group col-md-2">
                                                <label for="quantidade">QUANTIDADE</label>
                                                <input type="NUMBER" step="1" min="0" name="quantidade" value="${p.quantidade}" class="form-control">
                                            </div>
                                            <div class="form-group col-md-2">
                                                <label for="preco">PREÇO</label>
                                                <input type="text" name="preco" value="${p.preco}" class="form-control" id="preco" placeholder="EX:. 2.50">
                                            </div>
                                            <div class="form-GROUP col-md-4">
                                                <label for="undMedida">UNIDADE DE MEDIDA</label>
                                                <select name="undMedida" class="form-control">
                                                    <option disable selected>SELECIONE</option>
                                                    <option value="GRAMAS">GRAMAS</option>
                                                    <option value="GRAMAS">ML</option>
                                                    <option value="GRAMAS">LITROS</option>
                                                </select>
                                            </div>
                                        </div>
                                        <!-- Linha acima 3 itens-->
                                        <div class="row">
                                            <div class="form-group col-md-6">
                                                <label for="dataFabricacao">DATA DE FABRICAÇÃO</label>
                                                <input type="text" name="dataFabricacao" value="<fmt:formatDate value="${p.dataFabricacao}" pattern="dd/MM/yyyy"/>" class="form-control" id="campoData">
                                            </div>
                                            <div class="form-group col-md-6">
                                                <label for="dataValidade">DATA DE VALIDADE</label>
                                                <input type="text" name="dataVencimento" value="<fmt:formatDate value="${p.dataVencimento}" pattern="dd/MM/yyyy"/>" class="form-control" id="campoData2">
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="form-group col-md-12">
                                                <label for="descricao">DESCRIÇÃO</label>
                                                <textarea class="form-control"name="descricao">${p.descricao}</textarea>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <!-- Linha acima 2 itens-->
                                            <div class="form-group col-md-4">
                                                <label for="quantidadeMin">ALERTA DE QUANTIDADE MÍNIMA</label>
                                                <input type="number" name="quantidadeMin" step="1" min="0" class="form-control" value="${p.quantidadeMin}">
                                            </div>
                                            <div class="form-group col-md-2">
                                                <label>STATUS</label><br/>
                                                <c:if test="${p.status == true || p.status == null}">

                                                    <label class="form-check-label">
                                                        <input class="w3-radio" type="radio" name="status" value="true" checked>Ativo
                                                    </label>
                                                    &nbsp;
                                                    <label class="form-check-label"> 
                                                        <input class="w3-radio" type="radio" name="status" value="false" >Inativo
                                                    </label>
                                                </c:if>
                                                <c:if test="${p.status == false}">

                                                    <label class="form-check-label">
                                                        <input class="w3-radio" type="radio" name="status" value="true" > Ativo
                                                    </label>


                                                    <label class="form-check-label">
                                                        <input type="radio" class="w3-radio" name="status" value="false" checked> Inativo
                                                    </label>
                                                  
                                            </c:if>
                                          </div> 
                                        <div class="col-md-4">
                                            <input style="height: 60px;width: 90px;"type="submit" class="btn btn-success" value="SALVAR">
                                        </div> 
                                        </div>
                                        </form>
                                </div>
                            </div>
                            </section>
                        </div>
                        <div class="modal fade" id="sabor" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                        <h4 class="modal-title" id="myModalLabel">Cadastro de Sabor</h4>
                                    </div>
                                    <form action="ServletSabor" method="post">
                                        <input type="hidden" name="formulario" value="formModalSabor"> 
                                        <div class="modal-body">
                                            <div class="form-group-sm">
                                                <input autofocus type="text" class="form-control" name="sabor" placeholder="Nome do Sabor" >
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-danger" data-dismiss="modal">Fechar</button>
                                                <button type="submit" class="btn btn-success">Salvar</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                        <h4 class="modal-title" id="myModalLabel">Cadastro de Categoria</h4>
                                    </div>
                                    <form action="ServletCategoria" method="post">
                                        <input type="hidden" name="formulario" value="formModalCategoria">   
                                        <div class="modal-body">
                                            <div class="form-group-sm">
                                                <label for="nome">Nome</label>
                                                <input type="text" class="form-control" name="nome" placeholder="Nome da Categoria">
                                            </div>
                                            <div class="form-group-sm">
                                                <label for="nome">Tipo</label>
                                                <input type="text" class="form-control" name="tipo" placeholder="Tipo da Categoria">
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-danger" data-dismiss="modal">Fechar</button>
                                            <button type="submit" class="btn btn-success">Salvar</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
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