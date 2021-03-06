<%-- 
    Document   : JogosDePs4
    Created on : 30/01/2017, 12:11:16
    Author     : JM7087-Notbook
--%>

<%@page import="cdc.util.FotoDAO"%>
<%@page import="model.Foto"%>
<%@page import="java.util.List"%>
<%@page import="model.Produto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="cdc.util.ProdutoDAO"%>

<%
    
    
    
   

ProdutoDAO produtoDAO = new ProdutoDAO();
List<Produto> lista;
lista = produtoDAO.listaTodos();

FotoDAO fotoDAO = new FotoDAO();
List<Foto> fotoliList;
fotoliList = fotoDAO.listaTodos();
%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="template/head.jsp" %>
        
    </head>
    <body>
        <!-- in�cio do corpo do site -->
        <div class="container">
            <!-- estas linhas abaixo s�o obrigat�rias para chamar o cabe�alho, passando como par�metro a p�gina atual, para que possamos montar o menu superior -->
            <jsp:include page="template/cabecalho.jsp" >
                <jsp:param name="atual" value="inicio" />
            </jsp:include>
            <div class="row">
                <div class="col-md-3">
                    <%@include file="template/menu.jsp" %>
                </div>    
                <div class="col-md-9">

                    <fieldset>
                        
                        <legend><strong>Jogos de PS4</strong></legend>
                        <table align="center" border="1px" width="90%">
                        <tr>  
                            <th>Codigo</th>
                            <th>Nome</th>
                            <th>Imagem</th>
                            <th>Descri��o</th>
                            <th>Valor</th>
                            <th>Quantidade</th>
                            <th>Marca</th>
                            <th>Categoria</th>
                            <th>Exclur</th>
                            
                         </tr>
                         <%                                                                                                            
                            for(Produto p: lista ){
                                int idProduto = p.getPRO_ID(); 
                                fotoliList = fotoDAO.procura(new Foto(0, null, idProduto));
                                String srcFoto;
                                if (fotoliList.size()>0)
                                    srcFoto = "img/imgupload/"+idProduto+"/"+fotoliList.get(0).getFOTO_NOME();
                                else
                                    srcFoto = "img/imgupload/semfoto.jpg";
                                             
                        %>
                        <tr>
                            <th><%= p.getPRO_ID() %></th>
                            <th><%= p.getPRO_NOME() %></th>
                            <th><img width="50" height="50" src="<%= srcFoto %>"/></th>
                            <th><%= p.getPRO_DESCRICAO() %></th>
                            <th><%= p.getPRO_VALOR() %></th>
                            <th><%= p.getPRO_QUANTIDADE() %></th>
                            <th><%= p.getPRO_MARCA() %></th>
                            <th><%= p.getPRO_CATEGORIA() %></th>
                            <td><a href="ControladorCompras?cmd=compra&PRO_ID=<%= p.getPRO_ID() %>">Comprar </a></td>
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
