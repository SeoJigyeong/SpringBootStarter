<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" 
import="domain.Board,dao.BoardDao,service.BoardService,domain.Paging,java.net.URLEncoder,java.util.*,java.text.*"%>
<!-- 필요한 클래스를 임포트한다 -->

<%
	request.setCharacterEncoding("utf-8");
// 한글 깨짐을 방지한다
String from  = request.getParameter("from"); 
// URL 파라미터에서 from의 값을 받아 스트링 변수에 넣는다
String cnt  = request.getParameter("cnt"); 
// uRL 파라미터에서 cnt의 값을 받아 스트링 변수에 넣는다
String nowPage = request.getParameter("page");
// URL 파라미터에서 page의 값을 받아 스트링 변수에 넣는다

if (from != null && cnt != null && nowPage != null) {
	// 페이지네이션 null값을 조절하기 위한 if문이다
	from = from.trim();
	cnt = cnt.trim();
	nowPage = nowPage.trim();
}


BoardDao boardDao = new BoardDao();
// 객체를 선언한다

String key = ""; 

if (request.getParameter("key") != null) {
	// key검색어 값을 파라미터로 받는단
	key = request.getParameter("key"); 
}

Paging paging = new Paging(from, cnt, nowPage, boardDao.keywordDataCnt(key), key);
// 페이지네이션을 위한 생성자를 만든다
 
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
// 날짜 형식을 맞추기 위해 선언한다
%>
    
<%
	String jump = request.getParameter("jump");
	out.print(jump);
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
    <!-- 네비바 끝 -->
    <!-- 화면 메인 사진 -->
	<!-- 	<div class="hero-wrap" style="background-image: url('images/seogniel_beach1.jpg');">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text d-flex align-itemd-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center d-flex align-items-end justify-content-center">
          	<div class="text">
	            <p class="breadcrumbs mb-2"><span class="mr-2"><a href="index.html">Home</a></span> <span>Attractions</span></p>
	            <h1 class="mb-4 bread">California Beach</h1>
            </div>
          </div>
        </div>
      </div>
    </div> -->
    <!-- 화면 메인 사진 -->
    
    <section class="ftco-section contact-section bg-light">
      <div id="class">
	<h2 align=center>리스트 조회</h2>
	<form Method=post name='fm'>
	<!-- form 태그와 table을 이용해서 게시판 테이블 틀을 만들어준다 -->
		<table border='1' width='900px' style='margin-left:auto; margin-right:auto; table-layout:fixed;'>
			<colgroup>
            <col width="100px">            
            <col width="500px">   
            <col width="100px">            
            <col width="200px">   
                     
         </colgroup>
			<!-- colgroup으로 테이블 셀의 칸을 맞춰준다 -->
			<tr>
				<td>
					<p align=center>번호
				</td>
				<td>
					<p align=center>제목
				</td>
				<td>
					<p align=center>조회수
				</td>
				<td>
					<p align=center>등록일
				</td>
			</tr>
			<%
				for (int i = 0; i < boardDao.selectAll().size(); i++) {
					// 전체 데이터를 훑는 if문을 돌려준다
					
					// *페이지네이션
					if (paging.getLineCnt() > paging.getFromPT() + paging.getCntPT()) { 
		                // 라인카운트가 시작점과 테이블당 데이터갯수를 합한 것보다 크면
		                break; // while문을 끝낸다
		            }
					
				for (int j = 0; j < boardDao.keywordSelect(key , boardDao.selectAll().get(i).getId()).size(); j++) {
					paging.setLineCnt(paging.getLineCnt() + 1);
					// 원글의 댓글을 출력하는 이중for문이다
					
					if (paging.getLineCnt() < paging.getFromPT()) { // 만약에 라인카운트가 시작점보다 적으면
		                continue; // 출력하지 않는다
		            } else if (paging.getLineCnt() > paging.getFromPT() + paging.getCntPT()) { 
		                // 라인카운트가 시작점과 테이블당 데이터갯수를 합한 것보다 크면
		                break; // while문을 끝낸다
		            } else { 
		            
		            	// 만약 데이터가 원글이면 아래를 수행한다
		            if (boardDao.keywordSelect(key, boardDao.selectAll().get(i).getRootid()).get(j).getRelevel() == 0) {
		     %>
		     <!-- id, title등을 가져와서 데이블에 넣어준다 -->
			<tr>
				<td>
					<%=boardDao.keywordSelect(key, boardDao.selectAll().get(i).getRootid()).get(j).getId()%>
				</td>
				<td class="class2">
					<a href="board_selectone.jsp?key=<%=boardDao.keywordSelect(key, boardDao.selectAll().get(i).getRootid()).get(j).getId()%>">
						<%=boardDao.keywordSelect(key, boardDao.selectAll().get(i).getRootid()).get(j).getTitle()%></a>
					<!-- a태그가 문자를 감싸야 링크가 적용된다 -->
				</td>
				<td>
					<%=boardDao.keywordSelect(key, boardDao.selectAll().get(i).getRootid()).get(j).getViewcnt()%>
				</td>
				<td>
					<%=sdf.format(boardDao.keywordSelect(key, boardDao.selectAll().get(i).getRootid()).get(j).getDate())%>
				</td>
			</tr>
			<%	
					} else {
			%>
			<!-- 댓글일 때는 -->
			<!-- id, title등을 가져와서 데이블에 넣어주는데 relevel만큼 slash를 더해준다 -->
			<tr>
				<td>
					<%=boardDao.keywordSelect(key, boardDao.selectAll().get(i).getRootid()).get(j).getId()%>
				</td>
				<td class="class2">
					<a href="board_selectone.jsp?key=<%=boardDao.keywordSelect(key, boardDao.selectAll().get(i).getRootid()).get(j).getId()%>">
						<%
							String slash = "";
						for (int k = 0; k < boardDao.keywordSelect(key, boardDao.selectAll().get(i).getRootid()).get(j).getRelevel(); k++) {
							slash = slash + "-";
						}
						%>
						<%=slash%>>[Re]<%=boardDao.keywordSelect(key, boardDao.selectAll().get(i).getRootid()).get(j).getTitle()%>[New]
					</a>
					<!-- a태그가 문자를 감싸야 링크가 적용된다 -->
				</td>
				<td>
					<%=boardDao.keywordSelect(key, boardDao.selectAll().get(i).getRootid()).get(j).getViewcnt()%>
				</td>
				<td>
					<%=sdf.format(boardDao.keywordSelect(key, boardDao.selectAll().get(i).getRootid()).get(j).getDate())%>
				</td>
			</tr>

			<%
						}
					}
				}
			}

			%>
		<tr>
			<td colspan = '4' width=900 style = "text-align: right;">
				<input type="button" value="신규" onclick="location.href='board_insert.jsp'">
			</td>
		</tr>
	</form>
	</table>
			</table border='1' width='900px' style='margin-left:auto; margin-right:auto; table-layout:fixed;'>
	<p> 
	<%-- 처음으로 돌아가는 << 버튼은 첫번째 페이지를 제외하고 나오기 위해
		startPage가 1보다 클 경우에만 버튼이 나오도록 설정했다--%>
	<% if(paging.getStartButton() > 1) { %>
        <a href="board_keywordSelectAll.jsp?key=<%=key%>&page=1&from=1&cnt=9"><<</a>
	<%}%>
					
    <%-- 이전 장의 첫 페이지를 보여주기 위한 < 버튼, 이전페이지가 0보다 작으면 없음 --%>
    <% if(paging.getPrevPage() > 0) { %>
        <a href="board_keywordSelectAll.jsp?key=<%=key%>&page=<%=paging.getPrevPage()%>&from=<%=paging.getPrevPage() * 10 - 10 + 1%>&cnt=9"><</a>
    <%}%>
	
    <%for(int i = paging.getStartButton(); i < paging.getEndButton() + 1 ; i++) { %>
	
    <a href="board_keywordSelectAll.jsp?key=<%=key%>&page=<%=i%>&from=<%=(i - 1) * 10 + 1%>&cnt=9"><%=i%></a>
	
	<%-- 처음으로 돌아가는 << 버튼은 첫번째 페이지를 제외하고 나오기 위해
		startPage가 1보다 클 경우에만 버튼이 나오도록 설정했다--%>
		
	<%-- 한페이지에 만들 10개의 버튼을 for문을 통해서 돌린다 
		페이지당의 첫번째 버튼 숫자를 계산한 startPage부터 페이지의 마지막 버튼 숫자를
		계산한 endPage까지 for문을 돌린다--%>
		
	<%-- page번호는 페이지의 버튼 숫자와 동일하기 때문에 i를 바로 넣어준다
	시작번호를 의미하는 from의 경우는 시작번호에서 1을 빼고 곱하기 10을 한 뒤에 1을 더해준다.
	보통 시작번호는 1, 11, 21... 이런 순서이기때문이다. cnt는 9로 고정시켜 총 10개가 나오도록한다
	시작번호와 버튼의 번호는 같으므로 i를 번호로 바로 넣어주면 된다--%>
		
	<%}%>
	
	
    <%-- > & >> 버튼 출력 --%>
    <% if(paging.getTotalPage() > paging.getEndButton()) { %>
    <%-- 다음 장의 첫 페이지를 보여주기 위한 > 버튼, 다음페이지가 총 페이지보다 크거나 같으면 없음 --%>
    <a href="board_keywordSelectAll.jsp?key=<%=key%>&page=<%=paging.getNextPage() %>&from=<%=paging.getNextPage() * 10 - 10 + 1%>&cnt=9">></a>
    
    <%-- 맨 마지막 페이지를 보여주기 위한 >> 버튼 --%>
  	
  	<a href="board_keywordSelectAll.jsp?key=<%=key%>&page=<%=paging.getTotalPage()%>&from=<%=(paging.getTotalCount() - 1) / 10 * 10 + 1%>
    &cnt=9">>></a>
  	
    <% } 
  	%>
  	
  	<!-- 조회 버튼을 만들기 위한 테이블을 따로 생성한다 -->
  	</table>
  	<div id="class">
  	</table border='1' width='900px' style='margin-left:auto; margin-right:auto; table-layout:fixed;'>
	<form method='post' Action='./board_keywordSelectAll.jsp?page=1&from=1&cnt=9' name="fr2">
	<td width=100 >제목 및 내용 검색</td>
		<td width=200>
			<input type="text" name='key' value=''>
					<!-- onkeypress="checkId(event)" -->
		</td>
		<td width=100>
			<input type="submit" value="조회">
		</td>
	</table>
	</form>
	</div>
</p>
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