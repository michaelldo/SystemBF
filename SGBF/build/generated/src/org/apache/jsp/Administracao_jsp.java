package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.List;
import beans.Pessoa;
import controle.ServletSeguranca;
import java.util.List;
import beans.Pessoa;
import controle.ServletSeguranca;
import java.util.List;
import beans.Pessoa;
import controle.ServletSeguranca;
import java.util.List;
import beans.Pessoa;
import controle.ServletSeguranca;

public final class Administracao_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(4);
    _jspx_dependants.add("/areaNotificacao.jsp");
    _jspx_dependants.add("/menu.jsp");
    _jspx_dependants.add("/linksRapidos.jsp");
    _jspx_dependants.add("/footer.jsp");
  }

  private org.apache.jasper.runtime.TagHandlerPool _jspx_tagPool_c_forEach_var_items;
  private org.apache.jasper.runtime.TagHandlerPool _jspx_tagPool_c_if_test;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _jspx_tagPool_c_forEach_var_items = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _jspx_tagPool_c_if_test = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
  }

  public void _jspDestroy() {
    _jspx_tagPool_c_forEach_var_items.release();
    _jspx_tagPool_c_if_test.release();
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("<!DOCTYPE html>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Administração</title>\n");
      out.write("        <meta content=\"width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no\" name=\"viewport\">\n");
      out.write("        <link href=\"css/bootstrap.min.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("        <link href=\"css/font-awesome.min.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("        <link href=\"css/font-awesome.min.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("        <link href=\"css/AdminLTE.min.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("        <script src=\"js/jQuery-2.1.4.min.js\" type=\"text/javascript\"></script>\n");
      out.write("        <script src=\"js/bootstrap.min.js\" type=\"text/javascript\"></script>\n");
      out.write("        <link href=\"css/_all-skins.min.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("        <link href=\"css/custom.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("       \n");
      out.write("    </head>\n");
      out.write("    <body class=\"skin-green fixed sidebar-mini\">\n");
      out.write("        <div class=\"wrapper\">\n");
      out.write("\n");
      out.write("            <header class=\"main-header\">\n");
      out.write("                <a href=\"\" class=\"logo\">\n");
      out.write("                    <span class=\"logo-mini\">ADM</span>\n");
      out.write("                    <span class=\"logo-lg\"><img src=\"\" alt=\"Administração\" width=\"200\" height=\"45\"></span>\n");
      out.write("                </a>\n");
      out.write("                <nav class=\"navbar navbar-static-top\" role=\"navigation\">\n");
      out.write("                    <a href=\"\" class=\"sidebar-toggle\" data-toggle=\"offcanvas\" role=\"button\"></a>\n");
      out.write("                    \n");
      out.write("                    <div class=\"navbar-custom-menu\">\n");
      out.write("                        <!--Área de notificação-->\n");
      out.write("                        ");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
 Pessoa nome = ServletSeguranca.verificarAcesso(request, response); 
      out.write("\n");
      out.write("\n");
      out.write("<ul class=\"nav navbar-nav\">\n");
      out.write("    <li class=\"dropdown user user-menu\" style=\"padding-right:5px;\">\n");
      out.write("        <a href=\"\" class=\"dropdown-toggle\" data-toggle=\"dropdown\">\n");
      out.write("            <i class=\"fa fa-user\"></i>\n");
      out.write("            <span class=\"hidden-xs\">");
      out.print( nome != null ? nome.getNome() : "" );
      out.write("</span>\n");
      out.write("        </a>\n");
      out.write("    </li>\n");
      out.write("    <li class=\"dropdown user user-menu\" style=\"padding-right:5px;\">\n");
      out.write("        \n");
      out.write("        <a href=\"ServletSeguranca?logout=SIM\"><i class=\"fa fa-power-off\"></i><span class=\"hidden-xs\">Sair</span></a>\n");
      out.write("        \n");
      out.write("    </li>\n");
      out.write("</ul>\n");
      out.write("</div>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("                        <!--Fim da Área de notificação-->\n");
      out.write("                    </div>\n");
      out.write("                    </ul>\n");
      out.write("                </nav>\n");
      out.write("            </header>\n");
      out.write("            <aside class=\"main-sidebar\">\n");
      out.write("                <div class=\"treeview-menu active\">\n");
      out.write("                    <!--Menu Principal-->\n");
      out.write("                    ");
      out.write("\n");
      out.write("\n");
      out.write("\n");
Pessoa acesso = ServletSeguranca.verificarAcesso(request, response);
      out.write('\n');
if (acesso.getPerfilid().getDescricao().equals("Administrador")) {

      out.write("\n");
      out.write("<div class=\"slimScrollDiv\" style=\"position: relative; overflow: hidden; width: auto; height: 563px;\">\n");
      out.write("    <section class=\"sidebar\" style=\"height: 563px; overflow: hidden; width: auto;\">\n");
      out.write("        <ul class=\"sidebar-menu\">\n");
      out.write("            <li class=\"header\">Navegação principal</li>\n");
      out.write("\n");
      out.write("            <li class=\"mm_welcome\"><a href=\"Administracao.jsp\"><i class=\"fa fa-dashboard\"></i> <span>Administração</span></a></li>\n");
      out.write("            <li class=\"mm_pos\"><a href=\"PDV.jsp\"><i class=\"fa fa-th\"></i> <span>PDV</span></a></li>\n");
      out.write("\n");
      out.write("            <li class=\"treeview mm_products \">\n");
      out.write("                <a href=\"\">\n");
      out.write("                    <i class=\"fa fa-barcode\"></i>\n");
      out.write("                    <span>Produtos</span>\n");
      out.write("                    <i class=\"fa fa-angle-left pull-right\"></i>\n");
      out.write("                </a>\n");
      out.write("                <ul class=\"treeview-menu\">\n");
      out.write("                    <li id=\"products_add\"><a href=\"FormularioProdutos.jsp\"><i class=\"fa fa-circle-o\"></i> Adicionar produtos</a></li>\n");
      out.write("                    <li id=\"products_index\"><a href=\"ListaProdutos.jsp\"><i class=\"fa fa-circle-o\"></i> Lista de produtos</a></li>\n");
      out.write("                    <li class=\"divider\"></li>\n");
      out.write("                    <li id=\"products_add\"><a href=\"FormularioCategoria.jsp\"><i class=\"fa fa-circle-o\"></i> Adicionar Categoria</a></li>\n");
      out.write("                    <li class=\"divider\"></li>\n");
      out.write("                    <li id=\"products_add\"><a href=\"FormularioSabor.jsp\"><i class=\"fa fa-circle-o\"></i> Adicionar Sabor</a></li>\n");
      out.write("                </ul>\n");
      out.write("            </li>\n");
      out.write("            <li class=\"treeview mm_auth mm_customers mm_suppliers\">\n");
      out.write("                <a href=\"\">\n");
      out.write("                    <i class=\"fa fa-users\"></i>\n");
      out.write("                    <span>Pessoas</span>\n");
      out.write("                    <i class=\"fa fa-angle-left pull-right\"></i>\n");
      out.write("                </a>\n");
      out.write("                <ul class=\"treeview-menu\">\n");
      out.write("                    <li id=\"customers_add\"><a href=\"FormularioPessoa.jsp\"><i class=\"fa fa-circle-o\"></i> Adicionar Pessoas</a></li>\n");
      out.write("                    <li class=\"divider\"></li>\n");
      out.write("                    <li id=\"customers_index\"><a href=\"ListaPessoa.jsp\"><i class=\"fa fa-circle-o\"></i> Lista de Pessoas</a></li>\n");
      out.write("                    <li class=\"divider\"></li>\n");
      out.write("                </ul>\n");
      out.write("            </li>\n");
      out.write("\n");
      out.write("            <li class=\"treeview mm_reports\">\n");
      out.write("                <a href=\"\">\n");
      out.write("                    <i class=\"fa fa-bar-chart-o\"></i>\n");
      out.write("                    <span>Relatórios</span>\n");
      out.write("                    <i class=\"fa fa-angle-left pull-right\"></i>\n");
      out.write("                </a>\n");
      out.write("                <ul class=\"treeview-menu\">\n");
      out.write("                    <li id=\"reports_daily_sales\"><a href=\"\"><i class=\"fa fa-circle-o\"></i> Vendas Diárias</a></li>\n");
      out.write("                    <li id=\"reports_monthly_sales\"><a href=\"\"><i class=\"fa fa-circle-o\"></i> Vendas mensais</a></li>\n");
      out.write("                    <li id=\"reports_index\"><a href=\"\"><i class=\"fa fa-circle-o\"></i>Relatório de vendas</a></li>\n");
      out.write("                    <li class=\"divider\"></li>\n");
      out.write("                    <li id=\"reports_top_products\"><a href=\"\"><i class=\"fa fa-circle-o\"></i>Produtos c/ maior Saída</a></li>\n");
      out.write("                    <li id=\"reports_products\"><a href=\"\"><i class=\"fa fa-circle-o\"></i> Relatório de Produtos</a></li>\n");
      out.write("                </ul>\n");
      out.write("            </li>\n");
      out.write("        </ul>\n");
      out.write("    </section>\n");
      out.write("    <div class=\"slimScrollBar\" style=\"background: rgba(0, 0, 0, 0.2); width: 3px; position: absolute; top: 0px; opacity: 0.325864; display: block; border-radius: 7px; z-index: 99; right: 1px; height: 528.282px;\"></div><div class=\"slimScrollRail\" style=\"width: 3px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; background: rgb(51, 51, 51); opacity: 0.2; z-index: 90; right: 1px;\">\n");
      out.write("    </div>\n");
      out.write("</div>\n");

} if (acesso.getPerfilid().getDescricao().equals("Vendedor")) {

      out.write("\n");
      out.write("<!--Menu do Vendedor-->\n");
      out.write("\n");
      out.write("<div class=\"slimScrollDiv\" style=\"position: relative; overflow: hidden; width: auto; height: 563px;\">\n");
      out.write("    <section class=\"sidebar\" style=\"height: 563px; overflow: hidden; width: auto;\">\n");
      out.write("        <ul class=\"sidebar-menu\">\n");
      out.write("            <li class=\"header\">Navegação principal</li>\n");
      out.write("\n");
      out.write("            <li class=\"mm_welcome\"><a href=\"Administracao.jsp\"><i class=\"fa fa-dashboard\"></i> <span>Administração</span></a></li>\n");
      out.write("            <li class=\"mm_pos\"><a href=\"PDV.jsp\"><i class=\"fa fa-th\"></i> <span>PDV</span></a></li>\n");
      out.write("        </ul>\n");
      out.write("    </section>\n");
      out.write("    <div class=\"slimScrollBar\" style=\"background: rgba(0, 0, 0, 0.2); width: 3px; position: absolute; top: 0px; opacity: 0.325864; display: block; border-radius: 7px; z-index: 99; right: 1px; height: 528.282px;\"></div><div class=\"slimScrollRail\" style=\"width: 3px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; background: rgb(51, 51, 51); opacity: 0.2; z-index: 90; right: 1px;\">\n");
      out.write("    </div>\n");
      out.write("</div>\n");

}else{

      out.write("\n");
      out.write("<script>alert('Você não possui acesso ao sistema.');location.href='index.jsp';</script>\n");

}

      out.write("\n");
      out.write("                    <!--Fim menu Principal-->\n");
      out.write("                </div>\n");
      out.write("            </aside>\n");
      out.write("\n");
      out.write("            <div class=\"content-wrapper\" style=\"min-height: 562px;\">\n");
      out.write("                <section class=\"content-header\">\n");
      out.write("                    <h1>Administração</h1>\n");
      out.write("                    <ol class=\"breadcrumb\">\n");
      out.write("                        <li><a href=\"\"><i class=\"fa fa-dashboard\"></i> Principal</a></li>\n");
      out.write("                        <li class=\"active\">Administração</li>            </ol>\n");
      out.write("                </section>\n");
      out.write("\n");
      out.write("                <div class=\"col-lg-12 alerts\">\n");
      out.write("                    <div id=\"custom-alerts\" style=\"display:none;\">\n");
      out.write("                        <div class=\"alert alert-dismissable\">\n");
      out.write("                            <div class=\"custom-msg\"></div>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("                <section class=\"content\">\n");
      out.write("                    <div class=\"row\">\n");
      out.write("                        <div class=\"col-xs-12\">\n");
      out.write("                            <div class=\"box box-success\">\n");
      out.write("                                <div class=\"box-header\">\n");
      out.write("                                    <h3 class=\"box-title\">Links Rápidos</h3>\n");
      out.write("                                </div>\n");
      out.write("                                <!--Menu de links rápidos-->\n");
      out.write("                                ");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<div class=\"box-body\">\n");
      out.write("    ");
 Pessoa verifica = ServletSeguranca.verificarAcesso(request, response);
    if (!verifica.getPerfilid().getDescricao().equals("Administrador")) {
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("    <a class=\"btn btn-app\" href=\"PDV.jsp\">\n");
      out.write("        <i class=\"fa fa-th\"></i>PDV</a>\n");
      out.write("        ");
} else {
      out.write("\n");
      out.write("\n");
      out.write("    <a class=\"btn btn-app\" href=\"PDV.jsp\">\n");
      out.write("        <i class=\"fa fa-th\"></i>PDV</a>\n");
      out.write("    <a class=\"btn btn-app\" href=\"ListaProdutos.jsp\">\n");
      out.write("        <i class=\"fa fa-barcode\"></i>Produtos</a>\n");
      out.write("\n");
      out.write("    <a class=\"btn btn-app\" href=\"\">\n");
      out.write("        <i class=\"fa fa-shopping-cart\"></i>Vendas</a>\n");
      out.write("    <a class=\"btn btn-app\" href=\"\">\n");
      out.write("\n");
      out.write("        <i class=\"fa fa-bell-o\"></i>Contas Abertas</a>\n");
      out.write("    <a class=\"btn btn-app\" href=\"\">\n");
      out.write("        <i class=\"fa fa-bar-chart-o\"></i>Relatórios</a>\n");
      out.write("        ");
}
      out.write("\n");
      out.write("</div>");
      out.write("\n");
      out.write("                                <!--fim menu links-->\n");
      out.write("                            </div>\n");
      out.write("\n");
      out.write("                            <div class=\"row\">\n");
      out.write("                                <div class=\"col-md-8\">\n");
      out.write("                                    <div class=\"box box-primary\">\n");
      out.write("                                        <div class=\"box-header\">\n");
      out.write("                                            <h3 class=\"box-title\">Produtos com Baixo Estoque</h3>\n");
      out.write("                                        </div>\n");
      out.write("                                        <div class=\"box-body\">\n");
      out.write("                                            <table id=\"example\" class=\"table table-striped\">\n");
      out.write("                                                <thead>\n");
      out.write("                                                    <tr>\n");
      out.write("                                                        <th>DESCRIÇÃO</th>\n");
      out.write("                                                        <th>SITUAÇÃO</th>\n");
      out.write("                                                        <th>EDITAR</th>\n");
      out.write("                                                    </tr>\n");
      out.write("                                                </thead>\n");
      out.write("                                                <tbody>\n");
      out.write("                                                    ");
      daos.ProdutoDAO dao = null;
      synchronized (_jspx_page_context) {
        dao = (daos.ProdutoDAO) _jspx_page_context.getAttribute("dao", PageContext.PAGE_SCOPE);
        if (dao == null){
          dao = new daos.ProdutoDAO();
          _jspx_page_context.setAttribute("dao", dao, PageContext.PAGE_SCOPE);
        }
      }
      out.write("\n");
      out.write("                                                    ");
      //  c:forEach
      org.apache.taglibs.standard.tag.rt.core.ForEachTag _jspx_th_c_forEach_0 = (org.apache.taglibs.standard.tag.rt.core.ForEachTag) _jspx_tagPool_c_forEach_var_items.get(org.apache.taglibs.standard.tag.rt.core.ForEachTag.class);
      _jspx_th_c_forEach_0.setPageContext(_jspx_page_context);
      _jspx_th_c_forEach_0.setParent(null);
      _jspx_th_c_forEach_0.setVar("produto");
      _jspx_th_c_forEach_0.setItems((java.lang.Object) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${dao.listar}", java.lang.Object.class, (PageContext)_jspx_page_context, null));
      int[] _jspx_push_body_count_c_forEach_0 = new int[] { 0 };
      try {
        int _jspx_eval_c_forEach_0 = _jspx_th_c_forEach_0.doStartTag();
        if (_jspx_eval_c_forEach_0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
          do {
            out.write("\n");
            out.write("                                                        ");
            //  c:if
            org.apache.taglibs.standard.tag.rt.core.IfTag _jspx_th_c_if_0 = (org.apache.taglibs.standard.tag.rt.core.IfTag) _jspx_tagPool_c_if_test.get(org.apache.taglibs.standard.tag.rt.core.IfTag.class);
            _jspx_th_c_if_0.setPageContext(_jspx_page_context);
            _jspx_th_c_if_0.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_c_forEach_0);
            _jspx_th_c_if_0.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${produto.quantidade <= produto.quantidadeMin}", java.lang.Boolean.class, (PageContext)_jspx_page_context, null)).booleanValue());
            int _jspx_eval_c_if_0 = _jspx_th_c_if_0.doStartTag();
            if (_jspx_eval_c_if_0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
              do {
                out.write("\n");
                out.write("                                                            <tr>\n");
                out.write("                                                                <td>\n");
                out.write("                                                                    ");
                out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${produto.categoriaId.nome}", java.lang.String.class, (PageContext)_jspx_page_context, null));
                out.write("\n");
                out.write("                                                                    ");
                out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${produto.saborId.descricao}", java.lang.String.class, (PageContext)_jspx_page_context, null));
                out.write("\n");
                out.write("                                                                    ");
                out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${produto.categoriaId.tipo}", java.lang.String.class, (PageContext)_jspx_page_context, null));
                out.write("\n");
                out.write("\n");
                out.write("                                                                </td>\n");
                out.write("                                                                <td>\n");
                out.write("                                                                    ");
                if (_jspx_meth_c_if_1((javax.servlet.jsp.tagext.JspTag) _jspx_th_c_if_0, _jspx_page_context, _jspx_push_body_count_c_forEach_0))
                  return;
                out.write("\n");
                out.write("                                                                    ");
                if (_jspx_meth_c_if_2((javax.servlet.jsp.tagext.JspTag) _jspx_th_c_if_0, _jspx_page_context, _jspx_push_body_count_c_forEach_0))
                  return;
                out.write("\n");
                out.write("\n");
                out.write("                                                                </td>\n");
                out.write("\n");
                out.write("                                                                ");
if (verifica.getPerfilid().getDescricao().equals("Administrador")) {
                out.write("\n");
                out.write("                                                                <td style=\"width: 10px;text-align: center;\">\n");
                out.write("                                                                    <a class=\"btn btn-success btn-xs\" href=\"ServletProduto?acao=alterar&idProduto=");
                out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${produto.idProduto}", java.lang.String.class, (PageContext)_jspx_page_context, null));
                out.write("\">\n");
                out.write("                                                                        <i class=\"fa fa-edit\"></i>\n");
                out.write("                                                                    </a>\n");
                out.write("                                                                </td>\n");
                out.write("                                                                ");
} else {
                out.write("\n");
                out.write("                                                                <td style=\"width: 10px;text-align: center;\">\n");
                out.write("                                                                    <a class=\"btn btn-success btn-xs\" disabled>\n");
                out.write("                                                                        <i class=\"fa fa-edit\"></i>\n");
                out.write("                                                                    </a>\n");
                out.write("                                                                </td>\n");
                out.write("                                                                ");
}
                out.write("\n");
                out.write("                                                            </tr>\n");
                out.write("                                                        ");
                int evalDoAfterBody = _jspx_th_c_if_0.doAfterBody();
                if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
                  break;
              } while (true);
            }
            if (_jspx_th_c_if_0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
              _jspx_tagPool_c_if_test.reuse(_jspx_th_c_if_0);
              return;
            }
            _jspx_tagPool_c_if_test.reuse(_jspx_th_c_if_0);
            out.write("\n");
            out.write("\n");
            out.write("                                                    ");
            int evalDoAfterBody = _jspx_th_c_forEach_0.doAfterBody();
            if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
              break;
          } while (true);
        }
        if (_jspx_th_c_forEach_0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
          return;
        }
      } catch (Throwable _jspx_exception) {
        while (_jspx_push_body_count_c_forEach_0[0]-- > 0)
          out = _jspx_page_context.popBody();
        _jspx_th_c_forEach_0.doCatch(_jspx_exception);
      } finally {
        _jspx_th_c_forEach_0.doFinally();
        _jspx_tagPool_c_forEach_var_items.reuse(_jspx_th_c_forEach_0);
      }
      out.write("\n");
      out.write("\n");
      out.write("                                                </tbody>\n");
      out.write("                                            </table>\n");
      out.write("\n");
      out.write("                                        </div>\n");
      out.write("                                    </div>\n");
      out.write("                                </div>\n");
      out.write("\n");
      out.write("                                <div class=\"col-md-4\">\n");
      out.write("                                    <div class=\"box box-primary\">\n");
      out.write("                                        <div class=\"box-header\">\n");
      out.write("                                            <h3 class=\"box-title\">Produtos c/ maior saída</h3>\n");
      out.write("                                        </div>\n");
      out.write("                                        <div class=\"box-body\">\n");
      out.write("\n");
      out.write("                                        </div>\n");
      out.write("                                    </div>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </section>\n");
      out.write("            </div>\n");
      out.write("            <!--Rodapé-->\n");
      out.write("            ");
      out.write("<footer class=\"main-footer\">\n");
      out.write("    <div class=\"pull-right hidden-xs\">\n");
      out.write("        Versão <strong>1.0</strong>\n");
      out.write("    </div>\n");
      out.write("    <br>\n");
      out.write("</footer>\n");
      out.write("\n");
      out.write("            <!--Fim Rodapé-->\n");
      out.write("        </div>\n");
      out.write("        <!--Scripts javascript-->\n");
      out.write("        <script src=\"js/app.min.js\" type=\"text/javascript\"></script>\n");
      out.write("        <!--Scripts javascript-->\n");
      out.write("    </body>\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }

  private boolean _jspx_meth_c_if_1(javax.servlet.jsp.tagext.JspTag _jspx_th_c_if_0, PageContext _jspx_page_context, int[] _jspx_push_body_count_c_forEach_0)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:if
    org.apache.taglibs.standard.tag.rt.core.IfTag _jspx_th_c_if_1 = (org.apache.taglibs.standard.tag.rt.core.IfTag) _jspx_tagPool_c_if_test.get(org.apache.taglibs.standard.tag.rt.core.IfTag.class);
    _jspx_th_c_if_1.setPageContext(_jspx_page_context);
    _jspx_th_c_if_1.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_c_if_0);
    _jspx_th_c_if_1.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${produto.quantidade < produto.quantidadeMin}", java.lang.Boolean.class, (PageContext)_jspx_page_context, null)).booleanValue());
    int _jspx_eval_c_if_1 = _jspx_th_c_if_1.doStartTag();
    if (_jspx_eval_c_if_1 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      do {
        out.write("\n");
        out.write("                                                                        <button class=\"btn btn-danger btn-xs\" type=\"button\" title=\"O produto está Abaixo quantidade Mínima!\">\n");
        out.write("                                                                            Baixo <span class=\"badge\">");
        out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${produto.quantidade}", java.lang.String.class, (PageContext)_jspx_page_context, null));
        out.write("</span>\n");
        out.write("                                                                        </button>\n");
        out.write("                                                                    ");
        int evalDoAfterBody = _jspx_th_c_if_1.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
    }
    if (_jspx_th_c_if_1.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _jspx_tagPool_c_if_test.reuse(_jspx_th_c_if_1);
      return true;
    }
    _jspx_tagPool_c_if_test.reuse(_jspx_th_c_if_1);
    return false;
  }

  private boolean _jspx_meth_c_if_2(javax.servlet.jsp.tagext.JspTag _jspx_th_c_if_0, PageContext _jspx_page_context, int[] _jspx_push_body_count_c_forEach_0)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:if
    org.apache.taglibs.standard.tag.rt.core.IfTag _jspx_th_c_if_2 = (org.apache.taglibs.standard.tag.rt.core.IfTag) _jspx_tagPool_c_if_test.get(org.apache.taglibs.standard.tag.rt.core.IfTag.class);
    _jspx_th_c_if_2.setPageContext(_jspx_page_context);
    _jspx_th_c_if_2.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_c_if_0);
    _jspx_th_c_if_2.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${produto.quantidade == produto.quantidadeMin}", java.lang.Boolean.class, (PageContext)_jspx_page_context, null)).booleanValue());
    int _jspx_eval_c_if_2 = _jspx_th_c_if_2.doStartTag();
    if (_jspx_eval_c_if_2 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      do {
        out.write("\n");
        out.write("                                                                        <button class=\"btn btn-warning btn-xs\" type=\"button\" title=\"O produto está chegando na quantidade Mínima!\">\n");
        out.write("                                                                            Alerta <span class=\"badge\">");
        out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${produto.quantidade}", java.lang.String.class, (PageContext)_jspx_page_context, null));
        out.write("</span>\n");
        out.write("                                                                        </button>\n");
        out.write("                                                                    ");
        int evalDoAfterBody = _jspx_th_c_if_2.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
    }
    if (_jspx_th_c_if_2.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _jspx_tagPool_c_if_test.reuse(_jspx_th_c_if_2);
      return true;
    }
    _jspx_tagPool_c_if_test.reuse(_jspx_th_c_if_2);
    return false;
  }
}
