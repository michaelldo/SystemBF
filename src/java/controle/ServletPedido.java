package controle;

import beans.Pedido;
import beans.Pessoa;
import beans.Produto;
import beans.ProdutoPedido;
import daos.PedidoDAO;
import daos.ProdutoDAO;
import daos.ProdutoPedidoDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ServletPedido extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String acao = request.getParameter("acao");
        int idPedido = Integer.parseInt(request.getParameter("idPedido"));

        try {
            PedidoDAO dao = new PedidoDAO();

            switch (acao) {
                case "detalhes": {
                    Pedido pedido = dao.getRecuperar(idPedido);
                    if (pedido.getIdPedido() > 0) {
                        request.setAttribute("ped", pedido);
                        request.getRequestDispatcher("/VerPedido.jsp").forward(request, response);
                    } else {
                        out.println("<script>alert('Pedido não encontrado!');location.href='./ListaPedidos.jsp'</script>");
                    }
                }
                break;
                case "cancelar": {
                    try {

                        Pedido p = new Pedido();
                        p.setIdPedido(idPedido);
                        p.setStatus(0);
                        PedidoDAO pda = new PedidoDAO();
                        pda.alterar(p);
                        //Altera o status do pedido para cancelado
                        ProdutoDAO pd = new ProdutoDAO();
                        ProdutoPedidoDAO ppd = new ProdutoPedidoDAO();
                        ProdutoPedido prope = ppd.getCarregar(idPedido);
                        prope.getQuantidade();
                        //pega a quantidade de produtos do pedido do id acima
                        prope.getProduto().getIdProduto();
                        //pega o id do produto
                        Produto pr = pd.getCarregar(prope.getProduto().getIdProduto());
                        //pega a qtd atual de produtos e soma com a nova quantidade
                        int valor = pr.getQuantidade() + prope.getQuantidade();
                        pr.setQuantidade(valor);
                        //Inserir o id do produto para alterar a quantidade
                        pr.setIdProduto(prope.getProduto().getIdProduto());
                        pd.alterar(pr);
                        out.print("<script>alert('Pedido cancelado!');location.href='ListaPedidos.jsp';</script>");
                    } catch (Exception ex) {
                        System.out.println("ERRO: " + ex);
                        out.print("<script>alert('Pedido não cancelado!');history.back();</script>");
                    }
                }
                break;
                case "pagar": {
                    try {

                        Pedido p = new Pedido();
                        p.setIdPedido(idPedido);
                        p.setStatus(1);
                        PedidoDAO pda = new PedidoDAO();
                        pda.alterar(p);

                        Pedido pedido = dao.getRecuperar(idPedido);
                        if (pedido.getIdPedido() > 0) {

                            request.setAttribute("pedido", pedido);
                            request.getRequestDispatcher("/NotaFiscal.jsp").forward(request, response);
                        } else {
                            out.println("<script>alert('Pedido não encontrado!');location.href='./ListaPedidos.jsp'</script>");
                        }
                    } catch (Exception ex) {
                        out.print("<script>alert('Pedido não Pago!');history.back();</script>");
                    }
                }
                break;
            }
        } catch (Exception e) {
            out.print("Erro: " + e);
            out.println("<script>alert('Não é Possível Realizar esta ação!');history.back();</script>");
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String observacao = request.getParameter("observacao");

        if (request.getParameter("cliente") == null) {
            out.print("<script>alert('Selecione um produto');history.back();</script>");
            return;
        }

        int cliente = Integer.parseInt(request.getParameter("cliente"));

        try {

            Pedido p = (Pedido) request.getSession().getAttribute("pedido");

            Pessoa pessoa = new Pessoa();
            pessoa.setIdPessoa(cliente);

            p.setCliente(pessoa);

            p.setObservacao(observacao);

            PedidoDAO pDAO = new PedidoDAO();
            pDAO.salvar(p);
            request.getSession().removeAttribute("pedido");
            out.print("<script>alert('Pedido Concluído!.');location.href='ListaPedidos.jsp';</script>");
        } catch (Exception e) {
            out.print("<script>alert('O pedido não pode ser concluído!. ');history.back()</script>");
        }

    }

}
