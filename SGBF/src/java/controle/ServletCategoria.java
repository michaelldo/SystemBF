package controle;

import beans.Categoria;
import daos.CategoriaDAO;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ServletCategoria extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String sbr = request.getParameter("categoria");
        
        try {
            
            int codigo = Integer.parseInt(request.getParameter("idCategoria"));
            
            CategoriaDAO dao = new CategoriaDAO();
            
            if (request.getParameter("acao").equals("alterar")) {
                Categoria categoria = dao.carregar(codigo);
                
                if (categoria.getIdCategoria() > 0) {
                    request.setAttribute("c", categoria);
                    request.getRequestDispatcher("/FormularioCategoria.jsp").forward(request, response);
                } else {
                    out.println("<script>alert('Categoria não encontrada!');location.href='./FormularioCategoria.jsp'</script>");
                }
            }
            
        } catch (Exception e) {
            out.println("<script>alert('Não é Possível Realizar esta ação!');location.href='FormularioCategoria.jsp';</script>");
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        
        PrintWriter out = response.getWriter();
        String formulario = request.getParameter("formulario");
        if(formulario== null){
        formulario = "";
        }
        //pega os atributos de Categoria
        String codigo = request.getParameter("idCategoria");
        if (codigo == null) {
            codigo = "";
        }
        String nome = request.getParameter("nome");
        if(nome==null){
        nome = "";
        }
        
        String tipo = request.getParameter("tipo");
        if(tipo==null){
        tipo = "";
        }
        if(tipo.trim().equals("") || nome.trim().equals("")){
        out.print("<script>alert('O(s) campos(s) não devem estar vazio(s).');history.back();</script>");
        }
        try {
            //Objeto
            Categoria cat = new Categoria();
            cat.setNome(nome);
            cat.setTipo(tipo);

            //DAO
            CategoriaDAO catdao = new CategoriaDAO();
            
            if (!nome.trim().equals("") && !nome.trim().isEmpty() && !tipo.trim().isEmpty() && !tipo.trim().equals("")&& codigo.trim().equals("")) {
                catdao.salvar(cat);
                if (formulario.equals("formModalCategoria")) {
                    out.println("<script>alert('Salvo com sucesso!');location.href='FormularioProdutos.jsp';</script>");
                } else {
                    out.println("<script>alert('Salvo com sucesso!');location.href='FormularioCategoria.jsp';</script>");
                }
            }
            
            if (!codigo.isEmpty()) {
                int id = Integer.parseInt(codigo);
                cat.setIdCategoria(id);
                catdao.alterar(cat);
                out.println("<script>alert('Salvo com Sucesso!.');location.href='FormularioCategoria.jsp';</script>");
            }
        } catch (Exception e) {
            out.println("<script>alert('Ação Invalida');location.href='FormularioCategoria.jsp';</script>");
            System.out.println("Erro ServeletCategoria" + e);
        }
        
    }
    
}
