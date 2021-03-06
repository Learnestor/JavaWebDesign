<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.booking.model.*"%>
<%@ page import="com.bookingdetail.model.*"%>
<%@ page import="com.mem.model.*"%>
<%
MemVO memvo = (MemVO) session.getAttribute("memVO");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>成功</title>

	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Cache-Control" content="no-cache" />
	<meta http-equiv="Pragma" content="no-cache" />
	<meta http-equiv="Refresh" content="3,url=<%=request.getContextPath()%>/front-end/bok/booking_page_user.jsp">

	<script src="https://code.jquery.com/jquery-3.5.0.min.js" integrity="sha256-xNzN2a4ltkB44Mc/Jz3pT4iU1cmeR0FkXs4pru/JxaQ=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
	<script src="jquery-ui-1.12.1/jquery-ui.js"></script>
	
	<link rel="stylesheet" type="text/css" href="jquery-ui-1.12.1/jquery-ui.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

	<link rel="stylesheet" href="">
<%@ include file="/front-end/front-end-head.jsp"%>
	<style type="text/css" media="screen">
		.bok-container{
			background-image:url(<%=request.getContextPath()%>/front-end/bok/images/back_img2.jpg);
			background-size: cover;
			background-position:bottom ;
			position: relative;
			width:100%;
			height:900px;	
			border:0px solid ;		
			overflow:hidden;
		}
		
		#successView{
			position: relative;
			margin:7% auto;
			width: 300px;
			height: 300px;
			text-align: center;
			background-color: #F8F8F8;
			border-radius:5px;
			box-shadow:3px 3px 9px black;
			display: none;
		}
		h3{
  			font: bold 26px/1.5 "微軟正黑體", Verdana, sans-serif;
		}
		

		li:hover {
			background: #eee;
			cursor: pointer;
		}
		
		#logo{
			width: 70px;
			height: 45px;
		}
		
		.nav-link{
			font: bold 18px/1.5 "微軟正黑體";
		}
		#member{
			font: bold 16px/1.5 "微軟正黑體";
			margin-top: 8px;
		}
	</style>

</head>
<body>
<%@ include file="/front-end/front-end-header.jsp"%>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="<%=request.getContextPath()%>/front-end/index.jsp">
			<img id="logo" src="${pageContext.request.contextPath}/images/logo.png" title="首頁">
		</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active">
					<a class="nav-link" href="<%=request.getContextPath()%>/front-end/bok/booking_page_user.jsp">訂位首頁<span class="sr-only">(current)</span></a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="<%=request.getContextPath()%>/front-end/bok/newBookingStep1.jsp">開始訂位</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="<%=request.getContextPath()%>/front-end/bok/listByMemNo.jsp">紀錄查詢</a>
				</li>
			</ul>
		</div>
		<div id="member">
<%-- 			<p>您好! <%=memvo.getmName()%></p> --%>
		</div>
	</nav>

	<div class="container-fluid bok-container">
		<div id="successView">
			<br><br><br>
			<img src="<%=request.getContextPath()%>/front-end/bok/images/ok.png"><br>
			<h3>操作成功~ 三秒後跳轉...</h3>
		</div>
	</div>
	<%@ include file="/front-end/front-end-footer-type2.jsp"%>
	<script type="text/javascript">
		$(document).ready(function (){
			 $("#successView").fadeIn("slow");
		});
	</script>
	
</body>
</html>