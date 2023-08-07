<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="domain.Board,dao.BoardDao,service.BoardService,java.net.URLEncoder,java.util.*,java.text.*"%>
<!-- 필요한 클래스를 임포트한다 -->

<%
	request.setCharacterEncoding("utf-8");
//한글 깨짐을 방지한다

// 객체를 선언한다
BoardDao boardDao = new BoardDao();
Board board = new Board();

// 날짜 형식을 맞춰준다
Date now = new Date();
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
String nowtime = sdf.format(now);

// selectone에서 넘겨받은 rootid, relevel로 rnt를 구한다. 
int rootid = Integer.parseInt(request.getParameter("rootid"));
int relevel = Integer.parseInt(request.getParameter("relevel"));
%>

<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
	// 함수를 이용해서 action값을 바꿔준다
	function sumitForm(mode) {
		fm.action = "board_write.jsp?key=REINSERT";
		fm.submit();
	}
</script>
<meta charset="EUC-KR">
<title>화면 기능 설계 - 새 글 입력</title>
</head>
<body>
	<!-- form 태그와 table을 이용해서 게시판 테이블 틀을 만들어준다 -->
	<table cellspacing=3 width=600 border=1>
		<colgroup>
            <col width="150px">            
            <col width="150px">   
            <col width="100px">                          
            <col width="200px">                          
        </colgroup>
        <!-- colgroup으로 테이블 셀의 칸을 맞춰준다 -->
		<form method="post" name='fm' action="board_write.jsp?key=INSERT">
	
		<!-- 번호, 제목, 일자, 댓글 내 순서 등의 값을 테이블에 넣는다 -->
		<tr>
			<td>번호</td>
			<td colspan = 3>
				<input type='text' name='id' value='댓글(insert)' readonly>
			</td>
		</tr>
		<tr>
			<td>제목</td>
			<td colspan = 3>
				<input type='text' name='title' value=''>
			</td>
		</tr>
		<tr>
			<td>일자</td>
			<td colspan = 3>
				<input type='text' name='date' value='<%=nowtime%>' readonly>
			</td>
		</tr>
		<tr>
			<td>내용</td>
			<td colspan = 3>
				<textarea style='width: 500px; height: 500px;' name='content'>
					</textarea>
			</td>
		</tr>
		<tr>
		<tr>
			<td>원글</td>
			<td colspan = 3>
				<input type='text' name='rootid' value='<%=rootid%>' readonly>
			</td>
		</tr>
		<tr>
			<td>댓글 수준</td>
			<td>
				<input type='text' name='relevel' value='<%=relevel%>' readonly>
			</td>
			<td>댓글 내 순서</td>
			<td>
				<input type='text' name='recnt' value='<%=boardDao.setCount(rootid, relevel)%>' readonly>
			</td>
		</tr>
		</table>
		<!-- 취소, 쓰기 버튼을 만들어준다  -->
		<table>
		<tr>
			<td colspan='4'style='text-align:right; border:0px;'>
				<input type="submit" value="취소" onclick="javascript: form.action='board_keywordSelectAll.jsp';">
				<input type="submit" value="쓰기" onclick="javascript: form.action='board_write.jsp?key=REINSERT';">
			</td>
		</tr>
		</form>
		</table>
</body>
</html>