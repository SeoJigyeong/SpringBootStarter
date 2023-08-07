<%@page import="domain.SeoResv"%>
<%@page import="dao.SeoResvDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	StringBuffer sb = new StringBuffer();	
	SeoResvDao seoResvDao = new SeoResvDao();
	SeoResv seoResv = new SeoResv();
	
	request.setCharacterEncoding("utf-8");
	int month = Integer.parseInt(request.getParameter("month"));
	int date = Integer.parseInt(request.getParameter("date"));
	String room = request.getParameter("room");
	
	String mkMonth;
	String mkDate;
	String MonthAndDate;
	
	int roomNum;
	if (room.equals("Vip Room")) {
		roomNum = 1;
	} else if (room.equals("Double Room")) {
		roomNum = 2;
	} else {
		roomNum = 3;
	}
	
	if (month < 10) {
		mkMonth = "0" + month;
	} else {
		mkMonth = Integer.toString(month);
	}
	
	if (date < 10) {
		mkDate = "0" + date;
	} else {
		mkDate = Integer.toString(date);
	}
	
	MonthAndDate = sb.append("2020-").append(mkMonth).append("-").append(mkDate).toString();
	out.print(MonthAndDate);
	out.print(roomNum);
	seoResv = seoResvDao.selectOne(MonthAndDate, roomNum);
 
 %>
    
    
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Welcome to Seogniel</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css?family=Nunito+Sans:200,300,400,600,700&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="css/animate.css">
    
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/owl.theme.default.min.css">
    <link rel="stylesheet" href="css/magnific-popup.css">

    <link rel="stylesheet" href="css/aos.css">

    <link rel="stylesheet" href="css/ionicons.min.css">

    <link rel="stylesheet" href="css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="css/jquery.timepicker.css">

    
    <link rel="stylesheet" href="css/flaticon.css">
    <link rel="stylesheet" href="css/icomoon.css">
    <link rel="stylesheet" href="css/style.css">
  </head>
  <body>
<!-- 네비바 시작 -->
<nav class="navbar navbar-expand-lg navbar-light ftco_navbar bg-light ftco-navbar-dark fixed-top border-bottom" id="ftco-navbar">
  <div class="container">
    <a class="navbar-brand" href="index.html"><span>Seogniel</span></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="oi oi-menu"></span> 메뉴
  </button>
    <div class="collapse navbar-collapse" id="ftco-nav">
      <ul class="navbar-nav ml-auto">
      <!-- 드롭다운으로 네비바 구성 -->
    <li class="nav-item submenu dropdown">
      <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
      aria-expanded="false">서그니엘 호텔 소개</a>
      <ul class="dropdown-menu">
        <li class="nav-item"><a class="nav-link" href="main.html">서그니엘 서울 소개</a></li>
        <li class="nav-item"><a class="nav-link" href="a_VipRoom_01.html">Vip 룸</a></li>
        <li class="nav-item"><a class="nav-link" href="a_DoubleRoom_02.html">Double 룸</a></li>
        <li class="nav-item"><a class="nav-link" href="a_SingleRoom_03.html">Single 룸</a></li>
      </ul>
    </li>
    <li class="nav-item submenu dropdown">
    <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
    aria-expanded="false">위치</a>
    <ul class="dropdown-menu">
      <li class="nav-item"><a class="nav-link" href="b_Map_01.html">지도</a></li>
      <li class="nav-item"><a class="nav-link" href="b_Transportation_02.html">대중교통 이용시</a></li>
      <li class="nav-item"><a class="nav-link" href="b_Bycar_03.html">자동차 이용시</a></li>
    </ul>
    </li>
    <li class="nav-item submenu dropdown">
    <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
    aria-expanded="false">주요 명소</a>
    <ul class="dropdown-menu">
      <li class="nav-item"><a class="nav-link" href="c_HanlaMountain_01.html">한라산</a></li>
      <li class="nav-item"><a class="nav-link" href="c_CaliforniaBeach_02.html">해운대</a></li>
      <li class="nav-item"><a class="nav-link" href="c_HotSpring_03.html">스파</a></li>
    </ul>
    </li>
    <li class="nav-item submenu dropdown">
    <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
    aria-expanded="false">예약</a>
    <ul class="dropdown-menu">
      <li class="nav-item"><a class="nav-link" href="d_StatReserv_01.jsp">예약 상황</a></li>
      <li class="nav-item"><a class="nav-link" href="d_ResrvForm_02.jsp">예약하기</a></li>
      <li class="nav-item"><a class="nav-link" href="adm_allview.jsp">관리자 페이지</a></li>
      <li class="nav-item"><a class="nav-link" href="adm_login.jsp">관리자 로그인</a></li>
    </ul>
    </li>
    <li class="nav-item submenu dropdown">
    <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
    aria-expanded="false">커뮤니티</a>
    <ul class="dropdown-menu">
      <li class="nav-item"><a class="nav-link" href="BoardList.jsp">게시판</a></li>
      <li class="nav-item"><a class="nav-link" href="Reviews.jsp">이용 후기</a></li>
    </ul>
    </li>
      </ul>
    </div>
  </div>
</nav>
    <!-- 화면 메인 사진 -->
		<div class="hero-wrap" style="background-image: url('images/seogniel_adm.jpg');">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text d-flex align-itemd-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center d-flex align-items-end justify-content-center">
          	<div class="text">
	            <p class="breadcrumbs mb-2"><span class="mr-2"><a href="index.html">홈</a></span> <span>예약</span></p>
	            <h1 class="mb-4 bread">예약 상황</h1>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- 화면 메인 사진 -->
    
    <section class="ftco-section contact-section bg-light">
      <div class="container resv-container">
		<div class="row">
		<div class="col-md-6 resv-form-1" style="background-image: url('images/seogniel_adm3_2.jpg');"></div>
			<div class="col-md-6 resv-form-1">
				<h3>룸 예약</h3>
				<form method="post" action="d_writeResrv_03.jsp?process=UPDATE" accept-charset="utf-8">
					<div class="form-group">
						<input type="text" class="form-control" id="name" name="name" placeholder="성명"
							value="<%=seoResv.getName()%>" />
					</div>
					<div class="form-group">
						<input class="form-control" id="date" name="date" type="date" value="<%=seoResv.getResv_date()%>"required>
					</div>
					<div class="form-group">
						<label for="exampleFormControlSelect1">Room</label> 
						<select class="form-control" id="room" name="room">
							<option>Vip Room</option>
							<option>Double Room</option>
							<option>Single Room</option>
						</select>
					</div>
					<div class="form-group">
						<input type="text" class="form-control" id="addr" name="addr"
							placeholder="주소" value="<%=seoResv.getAddr()%>" />
					</div>
					<div class="form-group">
						<input type="text" class="form-control" id="phone" name="phone"
							placeholder="연락처" value="<%=seoResv.getPhone()%>" />
					</div>
					<div class="form-group">
						<input type="text" class="form-control" id="accountName" name="accountName"
 							placeholder="예금자명" value="<%=seoResv.getIn_name()%>" />
					</div>
					<div class="form-group">
						<label for="comment">comment</label>
						<textarea class="form-control" id="comment" name="comment"
							rows="3"><%=seoResv.getComment()%></textarea>
					</div>
					<div class="form-group">
                            <input type="submit" class="btn btn-primary" value="Update" onclick="javascript: form.action='d_writeResrv_03.jsp?process=UPDATE';" />
                            <input type="submit" class="btn btn-primary" value="Delete" onclick="javascript: form.action='d_writeResrv_03.jsp?process=DELETE';" />
                    </div>
                    <input type="hidden" name="monthAndDate" value="<%=MonthAndDate%>">                   
                    <input type="hidden" name="roomNum" value="<%=roomNum%>">                   
				</form>
			</div>
		</div>
 	</div> 
    </section>

<footer class="ftco-footer ftco-section img" style="background-image: url(images/bg_4.jpg);">
    	<div class="overlay"></div>
      <div class="container">
        <div class="row mb-5">
          <div class="col-md">
            <div class="ftco-footer-widget mb-4">
              <h2 class="ftco-heading-2">Seogniel</h2>
              <p>서그니엘은 한국을 대표하는 최초의 호화 랜드마크 호텔로 국내 최대 호텔 그룹인 롯데호텔앤리조트의 프리미엄 서비스를 즐기실 수 있습니다.</p>
              <ul class="ftco-footer-social list-unstyled float-md-left float-lft mt-5">
                <li class="ftco-animate"><a href="#"><span class="icon-twitter"></span></a></li>
                <li class="ftco-animate"><a href="#"><span class="icon-facebook"></span></a></li>
                <li class="ftco-animate"><a href="#"><span class="icon-instagram"></span></a></li>
              </ul>
            </div>
          </div>
          <div class="col-md">
            <div class="ftco-footer-widget mb-4 ml-md-5">
              <h2 class="ftco-heading-2">호텔 소개</h2>
              <ul class="list-unstyled">
                <li><a href="#" class="py-2 d-block">브랜드 소개</a></li>
                <li><a href="#" class="py-2 d-block">주변 관광지 소개</a></li>
                <li><a href="#" class="py-2 d-block">룸 소개</a></li>
              </ul>
            </div>
          </div>
          <div class="col-md">
             <div class="ftco-footer-widget mb-4">
              <h2 class="ftco-heading-2">고객의 소리</h2>
              <ul class="list-unstyled">
                <li><a href="#" class="py-2 d-block">이용 후기</a></li>
                <li><a href="#" class="py-2 d-block">연락처</a></li>
                <li><a href="#" class="py-2 d-block">오시는 길</a></li>
              </ul>
            </div>
          </div>
          <div class="col-md">
            <div class="ftco-footer-widget mb-4">
            	<h2 class="ftco-heading-2">문의 사항</h2>
            	<div class="block-23 mb-3">
	              <ul>
	                <li><span class="icon icon-map-marker"></span><span class="text">서울특별시 송파구 잠실6동 올림픽로 300</span></li>
	                <li><a href="#"><span class="icon icon-phone"></span><span class="text">02-3213-1000</span></a></li>
	                <li><a href="#"><span class="icon icon-envelope"></span><span class="text">info@seoginel.com</span></a></li>
	              </ul>
	            </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-12 text-center">
          </div>
        </div>
      </div>
    </footer>
    
  

  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


  <script src="js/jquery.min.js"></script>
  <script src="js/jquery-migrate-3.0.1.min.js"></script>
  <script src="js/popper.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/jquery.easing.1.3.js"></script>
  <script src="js/jquery.waypoints.min.js"></script>
  <script src="js/jquery.stellar.min.js"></script>
  <script src="js/owl.carousel.min.js"></script>
  <script src="js/jquery.magnific-popup.min.js"></script>
  <script src="js/aos.js"></script>
  <script src="js/jquery.animateNumber.min.js"></script>
  <script src="js/bootstrap-datepicker.js"></script>
  <script src="js/scrollax.min.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="js/google-map.js"></script>
  <script src="js/main.js"></script>
    
  </body>
</html>