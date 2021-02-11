<%@page import="java.util.List"%>
<%@page import="beans.Pessoa"%>
<%@page import="controle.ServletSeguranca" %>
<% Pessoa verifica = ServletSeguranca.verificarAcesso(request, response);
    if (!verifica.getPerfilid().getDescricao().equals("Administrador")) {%>
<script>alert('Você não pode acessar esta página.');history.back();</script>
<%}%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de Pessoas</title>
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
                    <span class="logo-mini">LISTA</span>
                    <span class="logo-lg"><img src="" alt="Lista de Pessoas" width="200" height="45"></span>
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
                    <h1>Lista de Pessoas</h1>
                    <ol class="breadcrumb">
                        <li><a href="Dashboard.html"><i class="fa fa-dashboard"></i> Principal</a></li>
                        <li class="active">Pessoas</li>
                        <li class="active">Lista de Pessoas</li>
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
                                    <h3 class="box-title">Utilize a tabela abaixo para navegar ou filtrar os resultados.</h3>
                                </div>
                                <div class="box-body">
                                    <table id="example" class="table-striped">
                                        <thead>
                                            <tr>

                                                <th>Nome</th>
                                                <th>Perfil</th>
                                                <th>Telefone</th>
                                                <th>Celular</th>
                                                <th>Status</th>
                                                <th>Detalhes</th>
                                                <th>Editar</th>
                                            </tr>
                                        </thead>

                                        <tbody>

                                            <jsp:useBean id="dao" class="daos.PessoaDAO"></jsp:useBean>
                                            <c:forEach var="pessoa" items="${dao.listar}">

                                                <tr>

                                                    <td>${pessoa.nome}</td>
                                                    <td>${pessoa.perfilid.descricao}</td>

                                                    <td>${pessoa.telefone}</td>
                                                    <td>${pessoa.celular}</td>
                                                    <td style="width:10px;text-align: center;">
                                                        <c:if test="${pessoa.status == true}">
                                                            <button class="btn btn-success disabled"><i class="fa fa-unlock"></i></button>
                                                            </c:if>
                                                            <c:if test="${pessoa.status == false}">
                                                            <button class="btn btn-danger disabled"><i class="fa fa-lock"></i></button>
                                                            </c:if>
                                                    </td>
                                                    <td style="width:5px;text-align: center;">
                                                        <a class="btn btn-primary" href="ServletPessoa?acao=visualizar&idPessoa=${pessoa.idPessoa}">
                                                            <i class="fa fa-search"></i>
                                                        </a>  
                                                    </td>
                                                    
                                                    <td style="width:5px;text-align: center;">
                                                        <a class="btn btn-primary" href="ServletPessoa?acao=alterar&idPessoa=${pessoa.idPessoa}">
                                                            <i class="fa fa-edit"></i>
                                                        </a>
                                                    </td>
                                                   
                                                </tr>
                                            </c:forEach>

                                        </tbody>
                                    </table>
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
                        </div>
                        <!--Scripts javascript-->
                        <%@include  file="footer.jsp"%>
                        <!--Scripts javascript-->
                        </body>
                        </html>