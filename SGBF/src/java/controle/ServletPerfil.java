package controle;

import beans.Perfil;
import daos.PerfilDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
public class ServletPerfil extends HttpServlet {

    

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String sbr = request.getParameter("sabor");

        try {

            int codigo = Integer.parseInt(request.getParameter("idPerfil"));

            PerfilDAO dao = new PerfilDAO();

            if (request.getParameter("acao").equals("alterar")) {
                Perfil perfil = dao.getCarregar(codigo);

                if (perfil.getIdPerfil() > 0) {
                    request.setAttribute("c", perfil);
                    request.getRequestDispatcher("/FormularioPerfil.jsp").forward(request, response);
                } else {
                    out.println("<script>alert('Perfil não encontrado!');location.href='./FormularioPerfil.jsp'</script>");
                }
            }

            if (request.getParameter("acao").equals("excluir")) {

                if (dao.excluir(codigo)) {
                    out.println("<script>alert('Perfil excluído com sucesso!');location.href='FormularioPerfil.jsp';</script>");
                } else {
                    out.println("<script>alert('Não foi possível excluir!');location.href='FormularioPerfil.jsp';</script>");
                }
            }
        } catch (Exception e) {

            out.println("<script>alert('Não é Possível Realizar esta ação!');location.href='FormularioPerfil.jsp';</script>");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        //pega o codigo do sabor
        String codigo = request.getParameter("idPerfil");
        //pesga a descrição do sabor
        String perf = request.getParameter("perfil");

        try {
            //cria um obj sabor    
            Perfil p = new Perfil();
            //seta a descricao do sabor
            p.setDescricao(perf);
            //pega ocodigo e converte para inteiro

            //Cria um obj SABORdao
            PerfilDAO pDAO = new PerfilDAO();
            //verifica se o saborDao  não e igal a vazio 
            if (!perf.equals("") && !perf.isEmpty() && codigo.isEmpty()) {
                pDAO.salvar(p);
                out.print("<script>alert('Salvo com Sucesso!.');location.href='FormularioPerfil.jsp';</script>");
            }

            if (!codigo.isEmpty()) {
                int id = Integer.parseInt(codigo);
                p.setIdPerfil(id);
                pDAO.alterar(p);
                out.print("<script>alert('Salvo com Sucesso!.');location.href='FormularioPerfil.jsp';</script>");
            } else {
                out.print("<script>alert('Preencha o campo Corretamente!.');location.href='FormularioPerfil.jsp';</script>");
            }
        } catch (Exception e) {
            out.print("<script>alert('Deu Merda!.');location.href='FormularioPerfil.jsp';</script>");
            System.out.println("Erro ServletPerfil" + e);
        } 
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
