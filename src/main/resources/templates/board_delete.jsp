<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="domain.Board,dao.BoardDao,service.BoardService,java.net.URLEncoder,java.util.*,java.text.*"%>

<%
	request.setCharacterEncoding("utf-8");
BoardDao boardDao = new BoardDao();
Board board = new Board();

request.setCharacterEncoding("utf-8");
int deleteId = Integer.parseInt(request.getParameter("key"));
boardDao.delete(deleteId);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>화면/ 기능설계</title>
</head>
<body>
	<h1><%=deleteId%>번 게시물이 삭제가 완료 되었습니다</h1>
	<br>
	<form method="post" action="board_keywordSelectAll.jsp">
		<table cellspacing=1 width=400 border=0>
			<tr>
				<td width=300></td>
				<td width=100>
					<input type="submit" value="목록으로 돌아가기">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>