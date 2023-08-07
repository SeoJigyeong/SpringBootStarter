<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="domain.Board,dao.BoardDao,service.BoardService,java.net.URLEncoder,java.util.*,java.text.*"%>
<!-- 필요한 클래스를 임포트한다 -->

<%
	request.setCharacterEncoding("utf-8");
//한글 깨짐을 방지한다

// 객체를 선언한다
BoardDao boardDao = new BoardDao();
Board board = new Board();
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

// 검색어를 파라미터로 받는다
request.setCharacterEncoding("utf-8");
String key = request.getParameter("key");

// 이전 페이지에서 온 id값을 따로 담을 변수를 선언한다
int updateId = 0;
int inputId = 0;
int reinsertId = 0;

if (key.equals("INSERT")) {
	// 만약에 쓰기 기능으로 불러왔을 떄는 
	
	String title = request.getParameter("title");
	out.println(request.getParameter("date"));
	String content = request.getParameter("content");
	Date date = sdf.parse(request.getParameter("date"));
	
	// input메서드를 넣어준다
	inputId = boardDao.input(new Board(title, date, content));

} else if (key.equals("REINSERT")) {
	// 만약에 댓글 기능으로 불러왔을 때는 
	
	String title = request.getParameter("title");
	Date date = sdf.parse(request.getParameter("date"));
	
	String content = request.getParameter("content");
	int rootid = Integer.parseInt(request.getParameter("rootid"));
	int relevel = Integer.parseInt(request.getParameter("relevel"));
	int recnt = Integer.parseInt(request.getParameter("recnt"));
	
	// reinsert 메서드를 넣어준다
	reinsertId = boardDao.reinsert(new Board(title, date, content, rootid, relevel, recnt));
	
} else {
	// 만약에 수정 기능으로 불러왔을 때는
	
	String title = request.getParameter("title");
	Date date = sdf.parse(request.getParameter("date"));
	String content = request.getParameter("content");

	updateId = Integer.parseInt(request.getParameter("key"));
	boardDao.update(new Board(updateId, title, date, content));
	// update메서드를 사용한다
}
%>

<!DOCTYPE html>
<html>
<head>

<script type="text/javascript">
	function sumitForm(mode) {
		fm.action = "board_update.jsp";
		fm.submit();
	}
</script>


<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<!-- 상황에 맞게 글과 함께 글보기 버튼을 생성한다 -->
	<%
		if (key.equals("INSERT")) {
	%>
	<h1>새글 입력 완료</h1>
	<form method="post" name='fm' action="board_selectone.jsp?key=<%=inputId%>">
		<table>
			<tr>
				<td width=100>
					<input type="submit" value="글보기" onclick="board_selectone.jsp?key=<%=inputId%>">
				</td>
			</tr>
		</table>
	</form>
	<%
		} else if (key.equals("REINSERT")) {
	%>
	<h1>댓글 입력 완료</h1>
	<form method="post" name='fm' action="board_selectone.jsp?key=<%=reinsertId%>">
		<table>
			<tr>
				<td width=100>
					<input type="submit" value="글보기" onclick="board_selectone.jsp?key=<%=reinsertId%>">
				</td>
			</tr>
		</table>
	</form>

	<%
		} else {
	%>
	<h1>수정 완료</h1>
	<form method="post" name='fm' action="board_selectone.jsp?key=<%=updateId%>">
		<table>
			<tr>
				<td width=100>
					<input type="submit" value="글보기" onclick="board_selectone.jsp?key=<%=updateId%>">
				</td>
			</tr>
		</table>
	</form>
	
	<%
		} 
	%>
</body>
</html> 