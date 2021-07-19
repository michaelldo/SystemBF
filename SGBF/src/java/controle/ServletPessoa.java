package controle;

import beans.Perfil;
import beans.Pessoa;
import beans.ValidaCPF;
import daos.PessoaDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ServletPessoa extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        int idPessoa = Integer.parseInt(request.getParameter("idPessoa"));

        try {

            PessoaDAO dao = new PessoaDAO();

            if (request.getParameter("acao").equals("alterar")) {

                Pessoa pessoa = dao.getCarregar(idPessoa);

                if (pessoa.getIdPessoa() > 0) {
                    request.setAttribute("p", pessoa);
                    request.getRequestDispatcher("/FormularioPessoa.jsp").forward(request, response);
                } else {
                    out.println("<script>alert('Pessoa não encontrada!');location.href='./ListaPessoa.jsp'</script>");
                }
            } else if (request.getParameter("acao").equals("visualizar")) {
                Pessoa pessoa = dao.getCarregar(idPessoa);

                if (pessoa.getIdPessoa() > 0) {
                    request.setAttribute("ver", pessoa);
                    request.getRequestDispatcher("/VerDetalhes.jsp").forward(request, response);
                } else {
                    out.println("<script>alert('Pessoa não encontrada!');location.href='./ListaPessoa.jsp'</script>");
                }
            }
        } catch (Exception e) {

            out.println("<script>alert('Não é Possível Realizar esta ação!');location.href='./ListaPessoa.jsp';</script>");
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String idPessoa = request.getParameter("idPessoa");
        if (idPessoa == null) {
            idPessoa = "";
        }
        String formulario = request.getParameter("formulario");
        if (formulario == null) {
            formulario = "";
        }
        String perfilId = request.getParameter("perfil");
        if(perfilId==null){
        perfilId="";
        }
        String nome = request.getParameter("nome");
        String cpf = request.getParameter("cpf");
        String rg = request.getParameter("rg");
        String telefone = request.getParameter("telefone");
        String celular = request.getParameter("celular");
        boolean status = Boolean.parseBoolean(request.getParameter("status"));
        String email = request.getParameter("email");
        String endereco = request.getParameter("endereco");
        String cnpj = request.getParameter("cnpj");
        String login = request.getParameter("login");
        if(login!= null){
        login= login.trim();
        }
        String senha = request.getParameter("senha");
        if(senha != null){
        senha=senha.trim();
        }
        
        if (!ValidaCPF.isCPF(cpf)) {
            out.print("<script>alert('CPF inválido!');history.back();</script>");
            return;
        }
        try {

            Pessoa p = new Pessoa();
            p.setNome(nome);
            p.setCpf(cpf);
            p.setEndereco(endereco);
            p.setRg(rg);
            p.setTelefone(telefone);
            p.setCelular(celular);
            p.setStatus(status);
            p.setEmail(email);
            p.setCnpj(cnpj);
            if (perfilId.equals("") || perfilId.equals("null")) {
                out.print("<script>alert('Selecione um Perfil');history.back();</script>");
                return;
            } else {
                int id = Integer.parseInt(perfilId);
                Perfil perfil = new Perfil();
                perfil.setIdPerfil(id);
                p.setPerfilid(perfil);

            }
            p.setLogin(login);
            p.setSenha(senha);

            PessoaDAO pessoaDao = new PessoaDAO();

            if (idPessoa.equals("")) {
                pessoaDao.salvar(p);

                if (formulario.equals("FormClienteModal")) {
                    out.print("<script>alert('Dados Cadastrados com sucesso!');location.href='./PDV.jsp';</script>");
                } else {
                    out.print("<script>alert('Dados Cadastrados com sucesso!');location.href='./ListaPessoa.jsp';</script>");
                }

            } else if (!idPessoa.equals("")) {
                int id = Integer.parseInt(idPessoa);
                p.setIdPessoa(id);
                pessoaDao.alterar(p);
                out.print("<script>alert('Dados Alterados com sucesso!');location.href='./ListaPessoa.jsp'</script>");
            }

        } catch (Exception e) {
            out.println("<script>alert('Não é Possível Realizar esta ação!');history.go(-1);</script>");
            System.out.println(e);
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
