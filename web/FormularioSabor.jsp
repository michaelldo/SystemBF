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
    </head>
    <body class="skin-green fixed sidebar-mini">
        <div class="wrapper">

            <header class="main-header">
                <a href="" class="logo">
                    <span class="logo-mini">Sabor</span>
                    <span class="logo-lg"><img src="" alt="Sabores" width="200" height="45"></span>
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
                    <h1>Sabores</h1>
                    <ol class="breadcrumb">
                        <li><a href=""><i class="fa fa-dashboard"></i> Principal</a></li>
                        <li class="active">Sabores</li>
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


                                    <form action="ServletSabor" method="post">
                                        <div class="form-group mx-sm">
                                            <input type="hidden" class="form-control" value="${c.idSabor}"name="idSabor">
                                            <input type="text" autofocus class="form-control" name="sabor" placeholder="Preencha aqui o nome do Sabor" value="${c.descricao}">
                                        </div>
                                        <button type="submit" class="btn btn-success">SALVAR</button>
                                    </form>
                                    <h3 class="box-title"></h3><hr>
                                    <table id="example" class="display" cellspacing="0" width="100%">
                                        <thead>
                                            <tr>
                                                <th width="15">Código</th>
                                                <th>Sabor</th>
                                                <th>Editar</th>
                                            </tr>
                                        </thead>

                                        <tbody>

                                            <jsp:useBean id="dao" class="daos.SaborDAO"></jsp:useBean>
                                            <c:forEach var="sabor" items="${dao.listar}">

                                                <tr>
                                                    <td>${sabor.idSabor}</td>
                                                    <td>${sabor.descricao}</td>
                                                    <td width="30">
                                                        <a class="btn btn-primary" href="ServletSabor?acao=alterar&idSabor=${sabor.idSabor}">
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

