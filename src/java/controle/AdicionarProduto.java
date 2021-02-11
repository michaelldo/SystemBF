package controle;

import beans.Pedido;
import beans.Produto;
import beans.ProdutoPedido;
import daos.ProdutoDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AdicionarProduto extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String strIdProduto = request.getParameter("idProduto");
        String acao = request.getParameter("acao");
        try {
            switch (acao) {
                case "adicionar":
                    if (strIdProduto != null && !strIdProduto.trim().isEmpty()) {
                        ProdutoDAO pdao = new ProdutoDAO();
                        Produto prod = pdao.getCarregar(Integer.parseInt(strIdProduto));
                    
                        request.setAttribute("produto", prod);
                        request.getRequestDispatcher("/AdicionarProduto.jsp").forward(request, response);
                    }
                case "excluir":
                    if (strIdProduto != null && !strIdProduto.trim().isEmpty()) {
                        Pedido p = (Pedido) request.getSession().getAttribute("pedido");
                        ProdutoPedido pp = p.getProdutos().get(Integer.parseInt(strIdProduto));
                        p.getProdutos().remove(pp);
                        response.sendRedirect("PDV.jsp");
                    }
                    break;
            }
        } catch (Exception e) {

        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        int idProduto = Integer.parseInt(request.getParameter("idProduto"));
        String quantidade = request.getParameter("quantidade");
        String qtdBola = request.getParameter("qtdBola");
        String preco = request.getParameter("preco");
        try {
            if (quantidade != null && !quantidade.trim().isEmpty()) {

                ProdutoDAO pdao = new ProdutoDAO();
                Produto produto = pdao.getCarregar(idProduto);
                

                ProdutoPedido pp = new ProdutoPedido();
                System.out.println("Produto quantidade em estoque: "+produto.getQuantidade());
                int quant = produto.getQuantidade();
                if(quant < Integer.parseInt(quantidade)){
                out.print("<script>alert('A quantidade selacionada não está disponível!.');history.back();</script>");
                return;
                }else{
                pp.setProduto(produto);
                pp.setQuantidade(Integer.parseInt(quantidade));
                }
                
                int nova = produto.getQuantidade() - Integer.parseInt(quantidade);
                produto.setQuantidade(nova);
                pdao.alterar(produto);
                
                
                if (qtdBola != null && !qtdBola.trim().isEmpty()) {
                    pp.setQtdBola(Integer.parseInt(qtdBola));
                }
                Pedido pedido = (Pedido) request.getSession().getAttribute("pedido");
                if (pedido == null) {
                    pedido = new Pedido();
                    
                }
                List<ProdutoPedido> lista = pedido.getProdutos();
                if (lista == null) {
                    lista = new ArrayList<ProdutoPedido>();
                    lista.add(pp);
                    pedido.setProdutos(lista);
                } else {
                    int index = lista.indexOf(pp);
                    if (index >= 0) {
                        int qtd = pp.getQuantidade() + lista.get(index).getQuantidade();
                        pp.setQuantidade(qtd);
                        lista.set(index, pp);
                    } else {
                        lista.add(pp);
                    }
                }

                request.getSession().setAttribute("pedido", pedido);
                response.sendRedirect("PDV.jsp");

            }
        } catch (Exception e) {

        }

    }

}
