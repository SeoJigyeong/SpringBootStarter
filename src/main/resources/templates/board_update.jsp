<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="domain.Board,dao.BoardDao,service.BoardService,java.net.URLEncoder,java.util.*,java.text.*"%>
<!-- 필요한 클래스를 임포트한다 -->

<%
	request.setCharacterEncoding("utf-8");
//한글 깨짐을 방지한다

// 객체를 선언한다
BoardDao boardDao = new BoardDao();
Board board = new Board();

request.setCharacterEncoding("utf-8");
int id = Integer.parseInt(request.getParameter("key"));
//특정 id값을 인트 변수로 받는다

// 날짜 형식을 맞춰준다
Date time = new Date();
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
String boardTime = sdf.format(boardDao.selectOne(id).getDate());
// time = sdf.parse(boardTime);
%>
<!DOCTYPE html>
<html>
<head>
<style>
th, td {
	border: 1px solid gray;
	/* 경계선을 solid로 만든다. */
}
</style>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<!-- form 태그와 table을 이용해서 게시판 테이블 틀을 만들어준다 -->
	<form method="post" action="board_write.jsp">
		<table cellspacing='3' width='600px' border='1'>
			<colgroup>
				<col width="70px">
				<col width="130px">
				<col width="400px">
			</colgroup>
			 <!-- colgroup으로 테이블 셀의 칸을 맞춰준다 -->
			 
			 <!-- 번호, 제목, 일자, 댓글 내 순서 등의 값을 테이블에 넣는다 -->
			<tr>
				<td>번호</td>
				<td colspan='2'>
					<input type='text' name='id' size=70 maxlength=70 value='<%=boardDao.selectOne(id).getId()%>' readonly>
				</td>
			</tr>
			<tr>
				<td>제목</td>
				<td colspan='2'>
					<input type='text' name='title' size=70 maxlength=70 value='<%=boardDao.selectOne(id).getTitle()%>'>
				</td>
			</tr>
			<tr>
				<td>일자</td>
				<td colspan='2'>
					<input type='text' name='date' size=70 maxlength=70 value='<%=boardTime%>'>
				</td>
			</tr>
			<tr>
				<td>내용</td>
				<td height=500 colspan='2'>
					<textarea style='height: 500px; width: 500px;' name=content>
					<%=boardDao.selectOne(id).getContent()%></textarea>
				</td>
			</tr>
			<!-- 삭제, 취소, 쓰기 버튼을 만들어준다  -->
			<table>
				<tr>
					<td colspan='2' style='text-align: left; border: 0px;'>
						<input type="submit" value="취소" onclick="javascript: form.action='board_keywordSelectAll.jsp';">
						<input type="submit" value="쓰기" onclick="javascript: form.action='board_write.jsp?key=<%=boardDao.selectOne(id).getId()%>';">
					</td>
					<td style='text-align: right; border: 0px;'>
						<input type="submit" value="삭제" onclick="javascript: form.action='board_delete.jsp?key=<%=boardDao.selectOne(id).getId()%>';">
					</td>
				</tr>
			</table>
			</form>
		</table>
</body>
</html>