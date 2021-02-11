package controle;

import beans.Sabor;
import daos.SaborDAO;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ServletSabor extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String sbr = request.getParameter("sabor");

        try {

            int codigo = Integer.parseInt(request.getParameter("idSabor"));

            SaborDAO dao = new SaborDAO();

            if (request.getParameter("acao").equals("alterar")) {
                Sabor sabor = dao.getCarregar(codigo);

                if (sabor.getIdSabor() > 0) {
                    request.setAttribute("c", sabor);
                    request.getRequestDispatcher("/FormularioSabor.jsp").forward(request, response);
                } else {
                    out.println("<script>alert('Sabor não encontrado!');location.href='./FormularioSabor.jsp'</script>");
                }
            }

        } catch (Exception e) {

            out.println("<script>alert('Não é Possível Realizar esta ação!');location.href='FormularioSabor.jsp';</script>");
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        //pega o codigo do sabor
        String codigo = request.getParameter("idSabor");
        String formulario = request.getParameter("formulario");
        if(formulario==null){
        formulario="";
        }
        //pesga a descrição do sabor
        String sbr = request.getParameter("sabor");
        if(sbr==null){
        sbr= "";
        }
        if (sbr.equals("")) {
            out.print("<script>alert('O Campo não pode estar Vazio!');history.back();</script>");
            return;
        }

        try {
            //cria um obj sabor    
            Sabor s = new Sabor();
            //seta a descricao do sabor
            s.setDescricao(sbr);
            //pega ocodigo e converte para inteiro

            //Cria um obj SABORdao
            SaborDAO sDAO = new SaborDAO();
            //verifica se o saborDao  não e igal a vazio 
            if (!sbr.equals("") || !sbr.isEmpty() || codigo.isEmpty()) {
                sDAO.salvar(s);
                if(formulario.equals("formModalSabor")){
                out.print("<script>alert('Salvo com Sucesso!.');location.href='FormularioProdutos.jsp';</script>");
                }else{
                out.print("<script>alert('Salvo com Sucesso!.');location.href='FormularioSabor.jsp';</script>");
                }
                
            }

            if (!codigo.isEmpty()) {
                int id = Integer.parseInt(codigo);
                s.setIdSabor(id);
                sDAO.alterar(s);
                out.print("<script>alert('Salvo com Sucesso!.');location.href='FormularioSabor.jsp';</script>");
                
            }
        } catch (Exception e) {
            out.print("<script>alert('Ação Inválida!.');location.href='FormularioSabor.jsp';</script>");
            System.out.println("Erro ServletSabor" + e);
        }
    }

}
