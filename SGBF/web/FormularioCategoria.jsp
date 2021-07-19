<%@page import="java.util.List"%>
<%@page import="beans.Pessoa"%>
<%@page import="controle.ServletSeguranca" %>

<% Pessoa verifica = ServletSeguranca.verificarAcesso(request, response);
    if (!verifica.getPerfilid().getDescricao().equals("Administrador")) {

%>
<script>alert('Você não pode acessar esta página.');history.back();</script>
<%}%>
<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Formulário Sabor</title>
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

        <script>
            function confirmarExclusao(idSabor, descricao) {
                if (confirm('Tem certeza que deseja excluir o sabor: ' + descricao + "?.")) {
                    location.href = 'ServletSabor?acao=excluir&idSabor=' + idSabor;
                }
            }

        </script>
    </head>
    <body class="skin-green fixed sidebar-mini">
        <div class="wrapper">

            <header class="main-header">
                <a href="" class="logo">
                    <span class="logo-mini">Categoria</span>
                    <span class="logo-lg"><img src="" alt="Categoria" width="200" height="45"></span>
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
                    <h1>Categoria</h1>
                    <ol class="breadcrumb">
                        <li><a href=""><i class="fa fa-dashboard"></i> Principal</a></li>
                        <li class="active">Categoria</li>
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
                                    <h3 class="box-title"></h3>
                                </div>
                                <div class="box-body">


                                    <form action="ServletCategoria" method="post">
                                        <div class="form-group mx-sm-8">
                                            <input type="hidden" class="form-control" value="${c.idCategoria}"name="idCategoria">
                                            <input type="text" class="form-control" name="nome" placeholder="Preencha aqui o nome da Categoria" value="${c.nome}">
                                            <input type="text" class="form-control" name="tipo" placeholder="Preencha aqui o tipo da Categoria" value="${c.tipo}">
                                        </div>
                                        <button type="submit" class="btn btn-success">SALVAR</button>
                                    </form>
                                    <h3 class="box-title"></h3><hr>
                                    <table id="example" class="display" cellspacing="0" width="100%">
                                        <thead>
                                            <tr>
                                                <th width="15">Código</th>
                                                <th>Nome</th>
                                                <th>Tipo</th>
                                                <th>Editar</th>

                                            </tr>
                                        </thead>

                                        <tbody>

                                            <jsp:useBean id="dao" class="daos.CategoriaDAO"></jsp:useBean>
                                            <c:forEach var="categoria" items="${dao.listar}">

                                                <tr>
                                                    <td>${categoria.idCategoria}</td>
                                                    <td>${categoria.nome}</td>
                                                    <td>${categoria.tipo}</td>
                                                    <td width="30">
                                                        <a class="btn btn-primary" href="ServletCategoria?acao=alterar&idCategoria=${categoria.idCategoria}">
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
                            "paginate":{
                                "first":"Primeira",
                                "previous":"Anterior",
                                "next":"Pr&oacute;xima",
                                "last":"&Uacute;ltima"
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


