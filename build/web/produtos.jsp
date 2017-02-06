<%-- 
    Document   : ControladorProdutos
    Created on : 29/01/2017, 15:01:19
    Author     : JM7087-Notbook
--%>

<%@page import="java.util.List"%>
<%@page import="model.Produto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="cdc.util.ProdutoDAO"%>


<%
    HttpSession sessao = request.getSession();//pegando a sessão ativa
    if (sessao.getAttribute("statusLogin") == null) {
        //dispacha o cabra pra tela de login
        RequestDispatcher rd = request.getRequestDispatcher("/login.jsp?respCadastro=nãoLogado");
        rd.forward(request, response);
    }
%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>        
        <%@include file="template/head.jsp" %>
        <style>
            .btn-menu{
                width: 100%;
                margin-bottom: 2px;
                text-align: center;
            }
        </style>    
    </head>
    <body>
        <!-- início do corpo do site -->
        <div class="container">
            <!-- estas linhas abaixo são obrigatórias para chamar o cabeçalho, passando como parâmetro a página atual, para que possamos montar o menu superior -->
            <jsp:include page="template/cabecalho.jsp" >
                <jsp:param name="atual" value="conta" />
            </jsp:include>        


            <div class="row">
                <div class="col-md-3">
                    <a href="CadastroDeProdutosParaVender.jsp" class="btn btn-success btn-menu" role="button">Cadastro de Produtos</a>
                    <a href="ControladorVendas.jsp?cmd=listarVendas" class="btn btn-success btn-menu" role="button">Minhas Vendas - </a>

                </div>
                <div class="col-md-9">

                    <fieldset>

                        <legend><strong>Lista de Produtos</strong></legend>
                        <table align="center" border="1px" width="90%">
                            <tr>  
                                <th>Codigo</th>
                                <th>Nome</th>
                                <th>Descrição</th>
                                <th>Valor</th>
                                <th>Quantidade</th>
                                <th>Marca</th>
                                <th>Categoria</th>
                                <th>Excluir</th>

                            </tr>
                            <%
                                ProdutoDAO produtoDAO = new ProdutoDAO();
                                List<Produto> lista;
                                lista = produtoDAO.listaTodos();
                                
                                for (Produto p : lista) {

                            %>
                            <tr>
                                <th><%= p.getPRO_ID()%></th>
                                <th><%= p.getPRO_NOME()%></th>
                                <th><%= p.getPRO_DESCRICAO()%></th>
                                <th><%= p.getPRO_VALOR()%></th>
                                <th><%= p.getPRO_QUANTIDADE()%></th>
                                <th><%= p.getPRO_MARCA()%></th>
                                <th><%= p.getPRO_CATEGORIA()%></th>
                                <td><a href="ControladorProdutos?cmd=del&PRO_ID=<%= p.getPRO_ID() %>">Exclur </a></td>
                            </tr>
                            <%
                                }
                            %>
                        </table>

                    </fieldset>



                </div>    
            </div>
            <%@include file="template/rodape.jsp" %>
        </div>
        <!-- fim do corpo do site -->
    </body>
</html>
