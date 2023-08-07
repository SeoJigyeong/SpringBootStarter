<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
request.setCharacterEncoding("utf-8");

String jump = request.getParameter("jump");
String id = request.getParameter("id");
String pwd = request.getParameter("pwd");
out.print(id);
out.print(pwd);
out.print(jump);

boolean bPassChk = false;

if(id.replaceAll(" ", ""). equals("admin") && pwd.replaceAll(" ", "").equals("admin")) {
	bPassChk = true;
	out.print(bPassChk);
} else {
	bPassChk = false;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
if(bPassChk) {
	session.setAttribute("login_ok", "yes");
	session.setAttribute("login_id", id);
	out.print(jump);
	response.sendRedirect(jump);
} else {
%>
	<div class="container">
		<h2>Alerts</h2>
		<form action="location.href='adm_login.jsp?jump=<%=jump%>">
		<div class="alert alert-warning alert-dismissible fade show"
			role="alert">
			<strong>실패!</strong> 아이디와 비밀번호를 다시 확인해주세요
			<button type="button" class="close" data-dismiss="alert"
				aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
		</div>
		</form>
	</div>
	<%-- <h2>아이디 또는 패스워드 오류</h2>
	<input type="button" value="login" Onclick="location.href='login.jsp?jump=<%=jump%>"> --%>
<% 	
}
%>
</body>
</html>