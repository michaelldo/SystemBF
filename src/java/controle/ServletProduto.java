package controle;

import beans.Categoria;
import beans.Produto;
import beans.Sabor;
import daos.ProdutoDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ServletProduto extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        int idProduto = Integer.parseInt(request.getParameter("idProduto"));
        String acao = request.getParameter("acao");
        try {

            ProdutoDAO dao = new ProdutoDAO();
            switch (acao) {
                case "alterar": {
                    Produto produto = dao.getCarregar(idProduto);

                    if (produto.getIdProduto() > 0) {
                        request.setAttribute("p", produto);
                        request.getRequestDispatcher("/FormularioProdutos.jsp").forward(request, response);
                    } else {
                        out.println("<script>alert('Produto não encontrado!');location.href='./ListaProdutos.jsp'</script>");
                    }
                }
                break;
                case "detalhes": {
                    Produto produto = dao.getCarregar(idProduto);

                    if (produto.getIdProduto() > 0) {
                        request.setAttribute("ver", produto);
                        request.getRequestDispatcher("/DetalhesProduto.jsp").forward(request, response);
                    } else {
                        out.println("<script>alert('Produto não encontrado!');location.href='./ListaProdutos.jsp'</script>");
                    }
                }
                break;

            }
        } catch (Exception e) {

            out.println("<script>alert('Não é Possível Realizar esta ação!');history.back();</script>");
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String idProduto = request.getParameter("idProduto");
        if (idProduto.equals("")) {
            idProduto = null;
        }
        boolean status = Boolean.parseBoolean(request.getParameter("status"));
        String descricao = request.getParameter("descricao");
        String undMedida = request.getParameter("undMedida");
        //idProduto pode estar vazio status sempre virá setado descricao pode vir vazio
        /*-----------------------------------------------------------------*/
        String dataFabricacao = request.getParameter("dataFabricacao");
        String dataVencimento = request.getParameter("dataVencimento");
        String preco = request.getParameter("preco");
        String quantidade = request.getParameter("quantidade");
        String quantidadeMin = request.getParameter("quantidadeMin");
        String peso = request.getParameter("peso");
        //sabor e categoria já vem setados
        /*--------------------------------------------------------------------*/
        String categoria = request.getParameter("categoria");
        String sabor = request.getParameter("sabor");

        try {
            Produto p = new Produto();

            /*--------------------------------*/
            p.setStatus(status);
            if (!dataFabricacao.equals("") || !dataVencimento.equals("")) {
                Date fab, val;
                SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
                fab = sdf.parse(dataFabricacao);
                val = sdf.parse(dataVencimento);
                p.setDataFabricacao(fab);
                p.setDataVencimento(val);
            } else {
                out.print("<script>alert('Preencha o(s) campo(s) de Data!');history.go(-1)</script>");
                return;
            }
            if (!preco.equals("")) {
                String precos = preco.replaceAll(",", ".");
                double nPreco = Double.parseDouble(precos);
                p.setPreco(nPreco);
            } else {
                out.print("<script>alert('Preencha o campo Preço!');history.go(-1)</script>");
                return;
            }
            if (!quantidade.equals("")) {
                int nQuantidade = Integer.parseInt(quantidade);
                p.setQuantidade(nQuantidade);
            } else {
                out.print("<script>alert('Preencha o campo Quantidade!');history.go(-1)</script>");
                return;
            }

            if (!quantidadeMin.equals("")) {
                int qtd = Integer.parseInt(quantidadeMin);
                p.setQuantidadeMin(qtd);
            } else {
                out.print("<script>alert('Preencha o campo Quantidade Minima!');history.go(-1)</script>");
                return;
            }
            if (!undMedida.equals("")) {
                p.setUndMedida(undMedida);
            } else {
                out.print("<script>alert('Selecione uma Unidade de Medida!');history.go(-1)</script>");
            }
            p.setDescricao(descricao);
            if (!peso.equals("")) {
                double nPeso = Double.parseDouble(peso);
                p.setPeso(nPeso);
            }
            if (!categoria.equals("")) {
                int nCateg = Integer.parseInt(categoria);
                Categoria cat = new Categoria();
                cat.setIdCategoria(nCateg);
                p.setCategoriaId(cat);
            } else {
                out.print("<script>alert('Selecione Uma Categoria!');history.go(-1)</script>");
                return;
            }
            if (!sabor.equals("")) {
                int nSabor = Integer.parseInt(sabor);
                Sabor sab = new Sabor();
                sab.setIdSabor(nSabor);
                p.setSaborId(sab);
            } else {
                out.print("<script>alert('Selecione um sabor!');history.go(-1)</script>");
                return;
            }
            /*--------------------------------*/
            ProdutoDAO pDAO = new ProdutoDAO();

            if (idProduto == null) {
                pDAO.salvar(p);
                out.print("<script>alert('Salvo com Sucesso');location.href='FormularioProdutos.jsp'</script>");
            }

            if (idProduto != null) {
                int id = Integer.parseInt(idProduto);

                p.setIdProduto(id);
                pDAO.alterar(p);

                out.print("<script>alert('Salvo com Sucesso!.');location.href='ListaProdutos.jsp';</script>");

            }

        } catch (Exception e) {
            out.print("<script>alert('Erro ao Salvar Verifique se os dados foram Preenchidos corretamente!.');history.go(-1);</script>");

            System.out.println("Erro novo: " + e);
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
