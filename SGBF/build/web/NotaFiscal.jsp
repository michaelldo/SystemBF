<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DETALHES PEDIDO</title>
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
                    <span class="logo-lg"><img src="" alt="Detalhes do Pedido" width="200" height="45"></span>
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
                    <h1>Detalhes do Pedido</h1>
                    <ol class="breadcrumb">
                        <li><a href=""><i class="fa fa-dashboard"></i> Principal</a></li>
                        <li class="active">Pessoas</li>
                        <li class="active">Detalhes do Pedido</li>
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
                                    <table class="table table-bordered">
                                        <thead>
                                            <tr>
                                                <td style="text-align: center;"><img src="imagens/LOGO.PNG" width="100"></td>
                                                <td colspan="5">
                                                    <p>
                                                        <b>SORVETERIA BIG FRUTA LTDA</b><BR/>
                                                        <b>CNPJ: </b>23.812.161/0001-85<br/>
                                                        <b>ENDEREÇO:</b> QUADRA 16 LOTE 04 JARDIM DA BARRAGEM III<br/>
                                                        <b>CIDADE:</b> ÁGUAS LINDAS DE GOIÁS -GO</p>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="6" style="text-align: center;"><H3>CUPOM NÃO FISCAL</H3></td>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td colspan="2"><b>CÓDIDO DO PEDIDO:</b> ${pedido.idPedido}</td>
                                                <td colspan="4"><b>CLIENTE:</b> ${pedido.cliente.nome}</td>
                                            </tr>
                                            <tr>
                                                <td colspan="3"><b>DATA:</b> <fmt:formatDate value="${pedido.dataHora}" pattern="dd/MM/yyyy"/></td>
                                                <td colspan="3"><b>HORA:</b> <fmt:formatDate value="${pedido.dataHora}" pattern="HH:mm:ss"/></td>
                                            </tr>
                                            <tr>
                                                <td colspan="6"><b>OBSERVAÇÃO:</b></td>
                                            </tr>
                                            <tr>
                                                <td colspan="6">${pedido.observacao}</td>
                                            </tr>
                                            <tr>
                                                <th>COD PRODUTO</th>
                                                <th>DESCRIÇÃO</th>
                                                <th>QUANTIDADE</th>
                                                <th>QTD BOLA</th>
                                                <th>PREÇO</th>
                                                <th>SUBTOTAL</th>
                                            </tr>
                                            <c:set var="subtotal" value="0"></c:set>
                                            <c:set var="total" value="0"></c:set>
                                            <c:forEach var="pro" items="${pedido.produtos}">
                                                <tr>
                                                    <td>${pro.produto.idProduto}</td>
                                                    <td>${pro.produto.categoriaId.nome}
                                                        ${pro.produto.categoriaId.tipo}
                                                        ${pro.produto.saborId.descricao}</td>
                                                    <td style="text-align: center;">${pro.quantidade}</td>
                                                    <td style="text-align: center;">${pro.qtdBola}</td>
                                                    <td style="text-align: center;"><c:set var="valor" value="25" />
                                                        <fmt:setLocale value="pt-BR" />
                                                        <fmt:formatNumber value="${pro.produto.preco}" type="currency"/>
                                                    </td>
                                                    <c:if test="${pro.qtdBola >0}">
                                                        <c:set var="total" value="${pro.produto.preco * pro.quantidade * pro.qtdBola+total}"></c:set>
                                                    </c:if>
                                                    <c:if test="${pro.qtdBola == 0}">
                                                        <c:set var="total" value="${pro.produto.preco * pro.quantidade+total}"></c:set>
                                                    </c:if>
                                                    <c:if test="${pro.qtdBola == 0}">
                                                        <c:set var="subtotal" value="${pro.produto.preco * pro.quantidade}"></c:set>
                                                    </c:if>
                                                    <c:if test="${pro.qtdBola > 0}">
                                                        <c:set var="subtotal" value="${pro.produto.preco * pro.quantidade * pro.qtdBola}"></c:set>
                                                    </c:if>
                                                    <td style="text-align: center;"><c:set var="valor" value="25" />
                                                        <fmt:setLocale value="pt-BR" />
                                                        <fmt:formatNumber value="${subtotal}" type="currency"/>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                            <tr>
                                                <th colspan="5">TOTAL</th>
                                                <td style="text-align: center;"><c:set var="valor" value="25" />
                                                    <fmt:setLocale value="pt-BR" />
                                                    <fmt:formatNumber value="${total}" type="currency"/>
                                                </td>
                                            </tr>

                                        </tbody>
                                    </table>

                                </div>
                                </section>
                            </div>

                            <script src="js/app.min.js" type="text/javascript"></script>
                        </div>
                        <!--Scripts javascript-->
                        <%@include  file="footer.jsp"%>
                        <!--Scripts javascript-->
                        </body>
                        </html>

