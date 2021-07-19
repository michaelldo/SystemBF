package controle;

import beans.Pessoa;
import daos.PessoaDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "ServletSeguranca", urlPatterns = {"/ServletSeguranca"})
public class ServletSeguranca extends HttpServlet {

    private static HttpServletResponse response;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        if (request.getParameter("logout") != null) {
            HttpSession sessao = request.getSession();
            sessao.removeAttribute("pessoa");
            sessao.invalidate();
            response.sendRedirect("index.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String login = request.getParameter("login").trim();
        String senha = request.getParameter("senha").trim();
        if(login ==  null || login.equals("") || senha == null || senha.equals("")){
        out.print("<script>alert('O(s) Campo(s) não devem estar Vazio (s)!.');history.back();</script>");
        return;
        }
        PessoaDAO dao = new PessoaDAO();
        Pessoa pessoa;
        try {
            pessoa = dao.buscarLogin(login);
            if (pessoa == null) {
                out.println("<script>alert('Usuario/Senha invalido(s)');location.href='index.jsp';</script>");
            } else {
                    if (pessoa.isStatus()) {
                    if (pessoa.getSenha().equals(senha)) {
                        HttpSession sessao = request.getSession();
                        sessao.setAttribute("pessoa", pessoa);
                        
                        response.sendRedirect("Administracao.jsp");
                    } else {
                        out.print("<Script>alert('Usuario/Senha inválido(s)');location.href='index.jsp';</script>");
                    }
                } else {
                    out.print("<script>alert('Usuário bloqueado. Solicite sua ativação para o Administrador!');location.href='index.jsp';</script>");
                }
            }
        } catch (Exception e) {
            out.print("<script>location.href='index.jsp';</script>");
           System.out.println(e);
        }
    }

    public static Pessoa verificarAcesso(HttpServletRequest request, HttpServletResponse response) throws IOException {

        Pessoa pessoa = null;
        ServletSeguranca.response = response;

        try {
            
            HttpSession sessao = request.getSession();
            
            if (sessao.getAttribute("pessoa") == null) {
                response.sendRedirect("index.jsp");
            } else {
                String uri = request.getRequestURI();
                String queryString = request.getQueryString();
                if ( queryString != null ) {
                    uri += "?" + queryString;
                }
                pessoa = (Pessoa) request.getSession().getAttribute("pessoa");
                if (pessoa == null) {
                    sessao.setAttribute("mensagem", "Você não está autenticado");
                    response.sendRedirect("index.jsp");
                }
            }
        } catch (IOException e) {
            response.sendRedirect("index.jsp");
            System.out.println("Erro-Servlet segurança,VerificarAcesso: "+e);
        }
        return pessoa;
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
