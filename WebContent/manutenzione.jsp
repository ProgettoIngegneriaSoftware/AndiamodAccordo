<jsp:include page="header.jsp" />
<body>
	<section class="contenuto">
		<form name="login" method="post" action="ServletLogin">
			<table>
				<tr>
					<th colspan="2"><h1>Per visualizzare la pagina è richiesto l'accesso al sito.</h1></th>
				</tr>
				<tr>
					<td>Email</td>
					<td><input type="text" name="email" id="mail" required="required" required title="Inserire email" placeholder="es. email@mail.com"></td>
				</tr>
				<tr>
					<%
						Boolean pwErrata= (Boolean) request.getAttribute("pwErrata");
					%>
					<td>Password</td>
					<td><input type="password" name="pass" required="required" required title="Inserire password"/><br>
					<span id="pass" <% if (pwErrata != null) { %>>Password Errata!<% } %></span>
				</tr>
				<tr>
					<td><input type="submit" value="Accedi" id="accedi"></td>
				</tr>
			</table>
		</form>


	</section>

	<%
		boolean nonAutorizzato = ((request.getSession().getAttribute("email")) != null);
		if (nonAutorizzato) {
	%>
	<script type="text/javascript">
		alert("ERRORE.\nL'account non esiste!.");
	</script>

	<%
	request.getSession().removeAttribute("email");
	request.getSession().removeAttribute("ruolo");
	request.getSession().removeAttribute("utente");
	request.getSession().removeAttribute("cliente");
	request.getSession().removeAttribute("carrello");
	request.getSession().removeAttribute("riuscito");
	request.getSession().removeAttribute("codiceProdotto");
	request.getSession().removeAttribute("nonriuscito");
	request.getSession().removeAttribute("cancellato");
	request.getSession().removeAttribute("noncancellato");
	request.getSession().removeAttribute("acquistoEffettuato");
	request.getSession().removeAttribute("nonEffettuatuo");
	request.getSession().removeAttribute("pwErrata");
	request.getSession().removeAttribute("riuscita");
	request.getSession().removeAttribute("no");
	request.getSession().invalidate();
		};
	%>

	<%
		//boolean nome_corto = ((request.getSession().))
	%>

<%
		boolean loginInvalidaReg = ((request.getSession().getAttribute("loginInvalidaReg")) !=null);
		if(loginInvalidaReg){
	%>
	<script type="text/javascript">
		alert("ERRORE.\nEmail gia' in uso!");
	</script>

	<%
	request.getSession().removeAttribute("loginInvalidaReg");
		}
	%>
</body>
<jsp:include page="footer.jsp" />
