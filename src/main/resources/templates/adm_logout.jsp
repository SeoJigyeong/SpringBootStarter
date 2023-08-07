<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       
<%
	session.invalidate();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<div class="alert alert-success alert-dismissible fade"
			role="alert">
			<strong>성공!</strong> 성공적으로 로그아웃하셨습니다!
			<button type="button" class="close" data-dismiss="alert"
				aria-label="Close" onclick="location.href='d_StatReserv_01.jsp' ">
				<span aria-hidden="true">&times;</span>
			</button>
		</div>
	</div>
</body>
</html>