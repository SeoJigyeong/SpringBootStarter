<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="dao.SeoResvDao, domain.SeoResv ,java.util.*, java.text.*"%>

<%

/* 예약 데이터 저장 */
request.setCharacterEncoding("utf-8");
String process = request.getParameter("process");

/* room 조심하기 */
if(process != null && process.equals("UPDATE")) {
	String monthAndDate = request.getParameter("monthAndDate");
	int resvRoom = Integer.parseInt(request.getParameter("roomNum"));
	
	Date now = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	String nowtime = sdf.format(now);
	
	String name = request.getParameter("name");
	String resvDate = request.getParameter("date");
	String room = request.getParameter("room");
	int roomNum;
		if (room.equals("Vip Room")) {
			roomNum = 1;
		} else if (room.equals("Double Room")) {
			roomNum = 2;
		} else {
			roomNum = 3;
		}
	String addr = request.getParameter("addr");
	String phone = request.getParameter("phone");
	String accountName = request.getParameter("accountName");
	String comment = request.getParameter("comment");
	String writeDate = nowtime;
	int processing = 1;
	
	SeoResvDao srd = new SeoResvDao();
	SeoResv sr = new SeoResv(name, resvDate, roomNum, addr, phone, accountName, comment, writeDate, processing);
	srd.update(sr, monthAndDate, resvRoom); 

} else if(process != null && process.equals("DELETE")) {
	String monthAndDate = request.getParameter("monthAndDate");
	
	int resvRoom = Integer.parseInt(request.getParameter("roomNum"));
	SeoResvDao srd = new SeoResvDao();
	srd.delete(monthAndDate, resvRoom);
	
} else {
	Date now = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	String nowtime = sdf.format(now);
	
	String name = request.getParameter("name");
	String resvDate = request.getParameter("date");
	String room = request.getParameter("room");
	int roomNum;
	if (room.equals("Vip Room")) {
		roomNum = 1;
	} else if (room.equals("Double Room")) {
		roomNum = 2;
	} else {
		roomNum = 3;
	}
	String addr = request.getParameter("addr");
	String phone = request.getParameter("phone");
	String accountName = request.getParameter("accountName");
	String comment = request.getParameter("comment");
	String writeDate = nowtime;
	int processing = 1;
	
	SeoResvDao srd = new SeoResvDao();
	SeoResv sr = new SeoResv(name, resvDate, roomNum, addr, phone, accountName, comment, writeDate, processing);
	srd.input(sr);
}

%>


<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/custom.css">
<title>writeResrv</title>
</head>
<body>
	<div class="container">
	<% if(process != null && process.equals("UPDATE")) { %>
		<div class="alert alert-success alert-dismissible fade show"
			role="alert">
			<strong>Success!</strong> Successfully update your information!
			<button type="button" class="close" data-dismiss="alert"
				aria-label="Close" onclick="location.href='adm_allview.jsp' ">
				<span aria-hidden="true">&times;</span>
			</button>
		</div>
	<% } else if( process != null && process.equals("DELETE")) { %>
		<div class="alert alert-success alert-dismissible fade show"
			role="alert">
			<strong>Success!</strong> Successfully delete your information!
			<button type="button" class="close" data-dismiss="alert"
				aria-label="Close" onclick="location.href='adm_allview.jsp' ">
				<span aria-hidden="true">&times;</span>
			</button>
		</div>
	<% } else { %>
		<div class="alert alert-success alert-dismissible fade show"
			role="alert">
			<strong>Success!</strong> Enjoy nice time with Seogniel Hotel!
			<button type="button" class="close" data-dismiss="alert"
				aria-label="Close" onclick="location.href='d_StatReserv_01.jsp' ">
				<span aria-hidden="true">&times;</span>
			</button>
		</div>
	<% } %>
	</div>
</body>
</html>

