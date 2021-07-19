<%@page import="beans.ProdutoPedido"%>
<%@page import="beans.Pedido"%>
<!DOCTYPE html>
<%@page import="java.util.List"%>
<%@page import="beans.Pessoa"%>
<%@page import="controle.ServletSeguranca" %>
<% Pessoa verifica = ServletSeguranca.verificarAcesso(request, response);%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link href="css/AdminLTE.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="js/jQuery-2.1.4.min.js" type="text/javascript"></script>
        <script src="js/jquery.maskedinput.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <link href="css/jquery.dataTables.min.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery.dataTables.min.js" type="text/javascript"></script>
        <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/_all-skins.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/custom.css" rel="stylesheet" type="text/css"/>
        <title>Ponto De Venda</title>
        <script>
            jQuery(function ($) {
                $("#telefone").mask("(99) 9999-9999");
                $("#celular").mask("(99)99999-9999");
                $("#cpf").mask("***.***.***-**");

                $("#cnpj").mask("**.***.***/****-**");

            });
        </script>
    </head>
    <body class="skin-green fixed sidebar-mini">
        <div class="wrapper">

            <header class="main-header">
                <a href="" class="logo">
                    <span class="logo-mini">SGBF</span>
                    <span class="logo-lg"><img src="" alt="SGBF" width="200" height="45"></span>
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
                    <h1>Ponto de Venda</h1>
                    <ol class="breadcrumb">
                        <li><a href=""><i class="fa fa-dashboard"></i> Administração</a></li>
                        <li class="active">PDV</li>
                    </ol>
                </section>

                <section class="content">

                    <div class="row">
                        <div class="col-xs-12">
                            <form action="ServletPedido" method="POST">
                                <jsp:useBean id="pessoa" class="daos.PessoaDAO"></jsp:useBean>

                                    <div class="col-md-6">
                                        <div class="box box-primary">
                                            <div class="box-header">
                                                <h3 class="box-title">Dados do Cliente</h3>
                                            </div>
                                            <div class="box-body">
                                                <div class="form-group">
                                                    <label for="cliente">Cliente</label>&nbsp;
                                                <%if (verifica.getPerfilid().getDescricao().equals("Administrador")) {%>
                                                <button type="button" class="btn btn-success btn-xs" data-toggle="modal" data-target="#myModal" title="Adicionar um novo Cliente rapidamente.">
                                                    <i class="fa fa-plus-square"></i>
                                                </button>
                                                <%}%>
                                                <select id="cliente" name="cliente" class="form-control">
                                                    <c:forEach var="cliente" items="${pessoa.listar}">
                                                        <c:if test="${cliente.status== true && cliente.perfilid.idPerfil==2}">
                                                            <option value="${cliente.idPessoa}">${cliente.nome}</option>
                                                        </c:if>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                            <div class="form-group">
                                                <label>Observações do Pedido.</label>
                                                <textarea class="form-control" cols="20" rows="2" name="observacao"></textarea>
                                            </div>
                                            <div class="form-group">
                                                <%
                                                    Pedido pedido = (Pedido) request.getSession().getAttribute("pedido");
                                                    if (pedido != null) {
                                                %>
                                                <table class="table table-responsive table-bordered">
                                                    <thead>
                                                        <tr>
                                                            <th colspan="6">INFORMAÇÕES DO PEDIDO</th>
                                                        </tr>
                                                        <tr>
                                                            <th>DESC</th>
                                                            <th style="text-align: center;">PREÇO</th>
                                                            <th>QTD</th>
                                                            <th>QTD BOLA</th>
                                                            <th>SUBTOTAL</th>
                                                            <th>EXCLUIR</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <%
                                                            double subtotal = 0;
                                                            double total = 0;
                                                            int i = 0;
                                                            for (ProdutoPedido pp : pedido.getProdutos()) {
                                                                if (pp.getQtdBola() > 0) {
                                                                    subtotal = pp.getProduto().getPreco() * pp.getQuantidade() * pp.getQtdBola();
                                                                } else {
                                                                    subtotal = pp.getProduto().getPreco() * pp.getQuantidade();
                                                                }
                                                        %>
                                                        <tr>
                                                                <td><%= pp.getProduto().getCategoriaId().getNome() + " " + pp.getProduto().getSaborId().getDescricao() + " "
                                                                        + pp.getProduto().getCategoriaId().getTipo()%></td>
                                                            <td><c:set var="valor" value="25" />
                                                                <fmt:setLocale value="pt-BR" />
                                                                <fmt:formatNumber value="<%= pp.getProduto().getPreco()%>" type="currency"/>
                                                            </td>
                                                            <td><%= pp.getQuantidade()%></td>
                                                            <td><%= pp.getQtdBola()%></td>
                                                            <td><c:set var="valor" value="25" />
                                                                <fmt:setLocale value="pt-BR" />
                                                                <fmt:formatNumber value="<%= subtotal%>" type="currency"/>
                                                            </td>
                                                            <td style="text-align: center;">
                                                                <a href="AdicionarProduto?acao=excluir&idProduto=<%= i%>" class="btn btn-danger btn-xs"><i class="fa fa-trash"></i></a>
                                                            </td>
                                                        </tr>
                                                        <%
                                                                if (pp.getQtdBola() > 0) {
                                                                    total = total + pp.getProduto().getPreco() * pp.getQuantidade() * pp.getQtdBola();
                                                                } else {
                                                                    total = total + pp.getProduto().getPreco() * pp.getQuantidade();
                                                                }
                                                                i++;
                                                            }
                                                        %>
                                                        <tr>
                                                            <td colspan="4"><strong>TOTAL:</strong> </td>
                                                            <td style="color:red;text-align: center;" colspan="2"><strong>
                                                                    <c:set var="valor" value="25" />
                                                                    <fmt:setLocale value="pt-BR" />
                                                                    <fmt:formatNumber value="<%= total%>" type="currency"/>
                                                                </strong>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                                <button type="submit" class="btn btn-success">CONCLUIR</button>
                                                <%
                                                    }
                                                %>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="box box-primary">
                                        <div class="box-header">
                                            <h3 class="box-title">Selecione Produtos para o pedido.</h3>
                                        </div>
                                        <div class="box-body">
                                            <table id="example" class="table-responsive table-bordered" >
                                                <thead>
                                                    <tr>
                                                        <th>DESCRIÇÃO</th>
                                                        <th style="text-align: center;">PREÇO</th>
                                                        <th>QTD</th>
                                                        <th>ADICIONAR</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <jsp:useBean id="dao" class="daos.ProdutoDAO"></jsp:useBean>
                                                    
                                                    <c:forEach var="produto" items="${dao.listar}">
                                                        <c:if test="${produto.status == true && produto.quantidade >0}">
                                                        <tr>
                                                            <td>${produto.categoriaId.nome} ${produto.saborId.descricao} ${produto.categoriaId.tipo} ${produto.peso} ${produto.undMedida}</td>
                                                            <td><c:set var="valor" value="25" />
                                                                <fmt:setLocale value="pt-BR" />
                                                                <fmt:formatNumber value="${produto.preco}" type="currency"/>
                                                            </td>
                                                            <td>${produto.quantidade}</td>
                                                            <td style="text-align: center;"><a href="AdicionarProduto?acao=adicionar&idProduto=${produto.idProduto}" class="btn btn-success" title="Adicionar ao Pedido">Adicionar</a></td>
                                                        </tr>
                                                        </c:if>
                                                    </c:forEach>
                                                    
                                                </tbody>
                                            </table>




                                        </div>

                                    </div>
                                </div>
                            </form>
                        </div>
                </section>
            </div>
            <script type="text/javascript">
                $( "#new-projects" ).load( "/resources/load.html #projects li" );
                $(document).ready(function () {
                    $('#example').DataTable({
                        "language": {
                            "search": "Pesquisar",
                            "lengthMenu": "Exibir _MENU_ registros",
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
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="myModalLabel">Cadastro de Cliente</h4>
                        </div>
                        <form action="ServletPessoa" method="post">
                            <input type="hidden" name="formulario" value="FormClienteModal">
                            <input type="hidden" name="perfil" value="2">
                            <input type="hidden" name="status" value="true">
                            <div class="modal-body">

                                <div class="col-md-12 form-group-sm">
                                    <label  for="nome">NOME COMPLETO</label>
                                    <input type="text" name="nome" class="form-control" id="nome" placeholder="Preencha aqui o nome completo">
                                </div>
                                <div class="col-md-6 form-group-sm">
                                    <label  for="telefone">TELEFONE</label>
                                    <input type="text" name="telefone" class="form-control" id="telefone" placeholder="EX:. (00) 0000-0000">
                                </div>
                                <div class="col-md-6 form-group-sm">
                                    <label  for="celular">CELULAR</label>
                                    <input type="text" name="celular" class="form-control" id="celular" placeholder="EX:. (00)0 0000-0000">
                                </div>
                                <div class="col-md-6 form-group-sm">
                                    <label  for="cnpj">CNPJ</label>
                                    <input type="text" name="cnpj" class="form-control" id="cnpj" placeholder="EX:. 00.000.000/0000-00">
                                </div> 
                                <div class="col-md-6 form-group-sm">
                                    <label  for="cpf">CPF</label>
                                    <input type="text" name="cpf" class="form-control"  id="cpf" placeholder="EX:. 000.000.000-00">
                                </div>
                                <div class="col-md-6 form-group-sm">
                                    <label  for="rg">RG</label>
                                    <input type="text" name="rg" class="form-control" id="rg" placeholder="EX:. 0.000.000">
                                </div>
                                <div class="col-md-6 form-group-sm">
                                    <label  for="email_address">E-MAIL</label>
                                    <input type="email" name="email" class="form-control" id="email_address" placeholder="EX:. nomedeusuario@email.com">
                                </div>
                                <div class="col-md-12 form-group">
                                    <label  for="endereco">ENDEREÇO RESIDENCIAL</label>
                                    <textarea class="form-control" id="endereco" name="endereco" rows="3"></textarea>
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