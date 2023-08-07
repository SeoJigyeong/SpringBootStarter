<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="domain.Board,dao.BoardDao,service.BoardService,java.net.URLEncoder,java.util.*,java.text.*"%>

<%
	request.setCharacterEncoding("utf-8");
BoardDao boardDao = new BoardDao();
Board board = new Board();

Date now = new Date();
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
String nowtime = sdf.format(now);
%>

<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
	function sumitForm(mode) {
		fm.action = "board_write.jsp?key=INSERT";
		fm.submit();
	}
</script>
<meta charset="EUC-KR">
<title>화면 기능 설계 - 새 글 입력</title>
</head>
<body>
	<table cellspacing=3 width=600 border=1>
	<colgroup>
            <col width="70px">            
            <col width="130px">   
            <col width="400px">               
        </colgroup>
        
        
		<form method="post" name='fm' action="board_write.jsp?key=INSERT">
		<tr>
			<td>번호</td>
			<td colspan='2'>
				<input type='text' name='id' value='신규(insert)' readonly>
			</td>
		</tr>
		<tr>
			<td>제목</td>
			<td colspan='2'>
				<input type='text' name='title' value=''>
			</td>
		</tr>
		<tr>
			<td>일자</td>
			<td colspan='2'>
				<input type='text' name='date' value='<%=nowtime%>' readonly>
			</td>
		</tr>
		<tr>
			<td>내용</td>
			<td height=500 colspan='2'>
				<textarea style='height:500px; width:500px;' name='content'>
				</textarea>
			</td>
		</tr>
		</table>
		<table>
		<tr>
			<td colspan='3'style='text-align:right; border:0px;'>
				<input type="submit" value="취소" onclick="javascript: form.action='board_keywordSelectAll.jsp';">
				<input type="submit" value="쓰기" onclick="submitForm('write')">
			</td>
		</tr>
		</form>
	</table>
</body>
</html>