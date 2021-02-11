<%@page import="java.util.List"%>
<%@page import="beans.Pessoa"%>
<%@page import="controle.ServletSeguranca" %>
<div class="box-body">
    <% Pessoa verifica = ServletSeguranca.verificarAcesso(request, response);
        if (!verifica.getPerfilid().getDescricao().equals("Administrador")) {%>


    <a class="btn btn-app" href="PDV.jsp">
        <i class="fa fa-th"></i>PDV</a>
        <%} else {%>

    <a class="btn btn-app" href="PDV.jsp">
        <i class="fa fa-th"></i>PDV</a>
    <a class="btn btn-app" href="ListaProdutos.jsp">
        <i class="fa fa-barcode"></i>Produtos</a>
<a class="btn btn-app" href="ListaPedidos.jsp">
        <i class="fa fa-bell-o"></i>Pedidos</a>
    
        <%}%>
</div>