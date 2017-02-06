<%
    String atual = request.getParameter("atual");
    String inicio = "";
    String login = "";
    String carrinho = "";
    String conta = "";
  
    switch(atual){
        case "inicio":
            inicio = "class='active'";
            break;
        case "login":
            login = "class='active'";
            break;  
        case "carrinho":
            carrinho = "class='active'";
            break;
        case "conta":
            conta = "class='active'";
            break; 
        default:
            inicio = "class='active'";
    }
%>    
    <div class="header clearfix">
        <nav>
          <ul class="nav nav-pills pull-right">
            <li role="presentation" <%=inicio%>><a href="/LOJA/">Inicio</a></li>
            <li role="presentation" <%=login%>><a href="login.jsp">Login</a></li>
            <li role="presentation" <%=carrinho%>><a href="#">Carrinho</a></li>
            <li role="presentation" <%=conta%>><a href="PainelDeControleUsuario.jsp">Conta</a></li>
          </ul>
        </nav>
        <h3 class="text-muted">JM Express</h3>
    </div>