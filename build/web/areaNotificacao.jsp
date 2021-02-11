<%@page import="java.util.List"%>
<%@page import="beans.Pessoa"%>
<%@page import="controle.ServletSeguranca" %>

<% Pessoa nome = ServletSeguranca.verificarAcesso(request, response); %>

<ul class="nav navbar-nav">
    <li class="dropdown user user-menu" style="padding-right:5px;">
        <a href="" class="dropdown-toggle" data-toggle="dropdown">
            <i class="fa fa-user"></i>
            <span class="hidden-xs"><%= nome != null ? nome.getNome() : "" %></span>
        </a>
    </li>
    <li class="dropdown user user-menu" style="padding-right:5px;">
        
        <a href="ServletSeguranca?logout=SIM"><i class="fa fa-power-off"></i><span class="hidden-xs">Sair</span></a>
        
    </li>
</ul>
</div>


