<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de Pedidos</title>
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
                    <h1>Lista de Pedidos</h1>
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
                                    <table  class="table table-bordered">
                                        <thead>
                                            <tr>
                                                <th style="width: 40px;">CODIGO</th>
                                                <th style="width: 80px;">DATA</th>
                                                <th style="width: 80px;">HORA</th>
                                                <th style="width: 50px;">STATUS</th>
                                                <th>DETALHES</th>
                                                <th>PAGAR</th>
                                                <th>CANCELAR</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <jsp:useBean id="dao" class="daos.PedidoDAO"></jsp:useBean>
                                            <c:forEach var="ped" items="${dao.listar}">
                                                <c:if test="${ped.status == 2}">
                                                    <tr>
                                                        <td>${ped.idPedido}</td>
                                                        <td><fmt:formatDate value="${ped.dataHora}" pattern="dd/MM/yyyy"/></td>
                                                        <td><fmt:formatDate value="${ped.dataHora}" pattern="HH:mm:ss"/></td>
                                                        <td>
                                                        <strong class="alert-warning">NÃO PAGO</strong>      
                                                        </td>
                                                        <td style="width: 10px;text-align: center;">
                                                            <a class="btn btn-primary" title="Ver detalhes" href="ServletPedido?acao=detalhes&idPedido=${ped.idPedido}">
                                                                <i class="fa fa-search"></i>
                                                            </a>
                                                        </td>
                                                        <td style="width: 10px;text-align: center;">
                                                            <a href="ServletPedido?acao=pagar&idPedido=${ped.idPedido}" title="Pagar" class="btn btn-success"><i class="fa fa-money"></i></a>
                                                        </td>
                                                        <td style="width: 10px;text-align: center;">
                                                            <a href="ServletPedido?acao=cancelar&idPedido=${ped.idPedido}" title="Cancelar" class="btn btn-danger"><i class="fa fa-ban"></i></a>
                                                        </td>

                                                    </tr>
                                                </c:if>
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

