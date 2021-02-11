<%@page import="java.util.List"%>
<%@page import="beans.Pessoa"%>
<%@page import="controle.ServletSeguranca"%>
<%Pessoa acesso = ServletSeguranca.verificarAcesso(request, response);%>
<%if (acesso.getPerfilid().getDescricao().equals("Administrador")) {
%>
<div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: 563px;">
    <section class="sidebar" style="height: 563px; overflow: hidden; width: auto;">
        <ul class="sidebar-menu">
            <li class="header">Navegação principal</li>

            <li class="mm_welcome"><a href="Administracao.jsp"><i class="fa fa-dashboard"></i> <span>Administração</span></a></li>
            <li class="mm_pos"><a href="PDV.jsp"><i class="fa fa-th"></i> <span>PDV</span></a></li>

            <li class="treeview mm_products ">
                <a href="">
                    <i class="fa fa-barcode"></i>
                    <span>Produtos</span>
                    <i class="fa fa-angle-left pull-right"></i>
                </a>
                <ul class="treeview-menu">
                    <li id="products_add"><a href="FormularioProdutos.jsp"><i class="fa fa-circle-o"></i> Adicionar produtos</a></li>
                    <li id="products_index"><a href="ListaProdutos.jsp"><i class="fa fa-circle-o"></i> Lista de produtos</a></li>
                    <li class="divider"></li>
                    <li id="products_add"><a href="FormularioCategoria.jsp"><i class="fa fa-circle-o"></i> Adicionar Categoria</a></li>
                    <li class="divider"></li>
                    <li id="products_add"><a href="FormularioSabor.jsp"><i class="fa fa-circle-o"></i> Adicionar Sabor</a></li>
                </ul>
            </li>
            <li class="treeview mm_auth mm_customers mm_suppliers">
                <a href="">
                    <i class="fa fa-users"></i>
                    <span>Pessoas</span>
                    <i class="fa fa-angle-left pull-right"></i>
                </a>
                <ul class="treeview-menu">
                    <li id="customers_add"><a href="FormularioPessoa.jsp"><i class="fa fa-circle-o"></i> Adicionar Pessoas</a></li>
                    <li class="divider"></li>
                    <li id="customers_index"><a href="ListaPessoa.jsp"><i class="fa fa-circle-o"></i> Lista de Pessoas</a></li>
                    <li class="divider"></li>
                </ul>
            </li>
            <li class="treeview mm_auth mm_customers mm_suppliers">
                <a href="">
                    <i class="fa fa-bell-o"></i>
                    <span>Pedidos</span>
                    <i class="fa fa-angle-left pull-right"></i>
                </a>
                <ul class="treeview-menu">
                    <li id="customers_index"><a href="ListaPedidos.jsp"><i class="fa fa-circle-o"></i>Lista de Pedidos</a></li>
                    <li class="divider"></li>
                </ul>
            </li>

            <li class="treeview mm_reports">
                <a href="">
                    <i class="fa fa-bar-chart-o"></i>
                    <span>Relatórios</span>
                    <i class="fa fa-angle-left pull-right"></i>
                </a>
                <ul class="treeview-menu">
                    <li id="reports_daily_sales"><a href="RelatorioProdutos.jsp"><i class="fa fa-circle-o"></i> Relatório de Produtos</a></li>
                    <li id="reports_index"><a href="RelatorioVendas.jsp"><i class="fa fa-circle-o"></i>Relatório de vendas</a></li>
                    <li class="divider"></li>
                </ul>
            </li>
        </ul>
    </section>
    <div class="slimScrollBar" style="background: rgba(0, 0, 0, 0.2); width: 3px; position: absolute; top: 0px; opacity: 0.325864; display: block; border-radius: 7px; z-index: 99; right: 1px; height: 528.282px;"></div><div class="slimScrollRail" style="width: 3px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; background: rgb(51, 51, 51); opacity: 0.2; z-index: 90; right: 1px;">
    </div>
</div>
<%
}if (acesso.getPerfilid().getDescricao().equals("Vendedor")) {
%>
<!--Menu do Vendedor-->

<div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: 563px;">
    <section class="sidebar" style="height: 563px; overflow: hidden; width: auto;">
        <ul class="sidebar-menu">
            <li class="header">Navegação principal</li>

            <li class="mm_welcome"><a href="Administracao.jsp"><i class="fa fa-dashboard"></i> <span>Administração</span></a></li>
            <li class="mm_pos"><a href="PDV.jsp"><i class="fa fa-th"></i> <span>PDV</span></a></li>
            <li id="customers_index"><a href="ListaPedidos.jsp"><i class="fa fa-circle-o"></i>Lista de Pedidos</a></li>
        </ul>
    </section>
    <div class="slimScrollBar" style="background: rgba(0, 0, 0, 0.2); width: 3px; position: absolute; top: 0px; opacity: 0.325864; display: block; border-radius: 7px; z-index: 99; right: 1px; height: 528.282px;"></div><div class="slimScrollRail" style="width: 3px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; background: rgb(51, 51, 51); opacity: 0.2; z-index: 90; right: 1px;">
    </div>
</div>
<%
}
%>