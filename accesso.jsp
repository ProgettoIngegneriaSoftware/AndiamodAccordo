<%
		//servlet da usare: ServletLogin

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Andiamo d'Accordo | Accedi</title>
</head>
<jsp:include page="header.jsp" />
<body>
	<section class="contenuto">
		<form name="login" method="post" action="ServletLogin">
			<table>
				<tr>
					<th colspan="2"><h1>Accedi</h1></th>
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


		<form name="registrazione" method="post" action="ServletRegistrazione">
		<table>
			<tr>
				<th colspan="2"><h1>Registrati</h1></th>
			</tr>
			<tr>
				<td>Email</td>
				<td><input type="text" name="email" id="em" title="Inserire la mail nel formato corretto" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" maxlength="30" required="required" placeholder="email@gmail.com"/></td>
			</tr>
			<tr>

				<td>Password</td>
				<td><input type="password" name="pass" id="pasw" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%]).{8,20}" title="la password deve contenere un numero, un carattere minuscolo, uno maiuscolo e un carattere speciale tra @#$% e deve avere lunghezza min 8 e max 20" required="required" placeholder="password"/></td>
			</tr>
			<tr>
				<td>Nome</td>
				<td><input type="text" name="nome" id="nom" title="Inserire almeno 4 lettere per il nome, massimo 16" pattern="[A-Za-z]+.{3,}" maxlength="16" required="required" placeholder="Nome"/></td>
			</tr>
			<tr>
				<td>Cognome</td>
				<td><input type="text" name="cognome" id="cog" title="Inserire almeno 4 lettere per il cognome, massimo 16" pattern="[A-Za-z]+.{3,}" maxlength="16" required="required" placeholder="Cognome"/></td>
			</tr>
			<tr>
				<td>Telefono</td>
				<td><input type="text" name="telefono" id="tel" title="Il numero di telefono deve essere composto da 9 o 10 numeri" pattern="[0-9]+.{8,}" maxlength="10" required="required" placeholder="ad Es.338456432"/></td>
			</tr>
			<tr>
				<td>Indirizzo</td>
				<td><input type="text" name="indirizzo" id="ind" title="Il formato dell'indirizzo è: via-NumeroCivico-Città-CAP" pattern="(Via|VIA|Viale|Piazza|Strada|via|viale|piazza|strada|contrada|frazione)[\s]+[A-Za-z]+[\s]+[0-9]+[\s]+[A-Za-z]+[\s]+[0-9]+" maxlength="50" required="required" placeholder="Via Roma 4 Battipaglia"/></td>
			</tr>
			<tr>
				<td><input type="submit" id="Registra" value="registra"/></td>
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

</html>
