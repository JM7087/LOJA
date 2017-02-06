<%-- 
    Document   : index
    Created on : 12/10/2016, 14:42:11
    Author     : JM7087-Notbook
--%>

<%
    HttpSession sessao = request.getSession();//pegando a sessão ativa
    if(sessao.getAttribute("statusLogin") == null){
        //dispacha o cabra pra tela de login
    }
%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="template/head.jsp" %>
        
    </head>
    <body>
        <!-- início do corpo do site -->
        <div class="container">
            <!-- estas linhas abaixo são obrigatórias para chamar o cabeçalho, passando como parâmetro a página atual, para que possamos montar o menu superior -->
            <jsp:include page="template/cabecalho.jsp" >
                <jsp:param name="atual" value="inicio" />
            </jsp:include>
            <div class="row">
                <div class="col-md-3">
                    <%@include file="template/menu.jsp" %>
                </div>    
                <div class="col-md-9">
                    <%@include file="template/body.jsp" %>
                </div>    
            </div>    
            
            <%@include file="template/rodape.jsp" %>
        </div>
        <!-- fim do corpo do site -->
    </body>
</html>
