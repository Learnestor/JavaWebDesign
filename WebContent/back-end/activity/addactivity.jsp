<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.activity.model.*"%>
<%@ page import="com.employee.model.*"%>
<%@ page import="com.permission.model.*"%>
<%@ page import="com.features.model.*"%>


<%
	ActivityVO actVO = (ActivityVO) request.getAttribute("AVO");
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>活動資料新增 - addact.jsp</title>

<style>
	body{
		background-size: cover;
		background-repeat: no-repeat;
		background-attachment: fixed;
		background-position: center;
	}

	.card{
		opacity:0.9;
		width:1200px;
		margin:50px auto;
		padding:50px;
	}
</style>

</head>
<%@ include file="/back-end/back-end-head.jsp" %>
<body>

<%@ include file="/back-end/back-end-header.jsp" %>
	<div class="container">
		<div class="row text-center" style="margin-top:50px; text-align:center;">
			<div class="card" style="width: 700px;">

				<h3>資料新增</h3>

				<%-- 錯誤列表 --%>
				<c:if test="${not empty errorMsgs}">
					<font style="color: red">請修正以下錯誤:</font>
					<ul>
						<c:forEach var="message" items="${errorMsgs}">
							<li style="color: red">${message}</li>
						</c:forEach>
					</ul>
				</c:if>

				<FORM METHOD="post"
					ACTION="<%=request.getContextPath()%>/back-end/activity/activityServlet.do"
					name="form1" enctype="multipart/form-data" style="text-align:-webkit-center;">

					<table>
						<jsp:useBean id="actSvc" scope="page"
							class="com.activity.model.ActivityService" />
						<tr>
							<td>活動類別編號:<font color=red><b>*</b></font></td>
							<td><select size="1" name="actTyno">
									<c:forEach var="actVO" items="${actSvc.all}">
										<option value="${actVO.actTyno}"
											${(AVO.actTyno==actVO.actTyno)? 'selected':'' }>${actVO.actTyno}
									</c:forEach>
							</select></td>
						</tr>

						<tr>
							<td>活動名稱</td>
							<td><input type="TEXT" name="actName" size="45"
								value="<%=(actVO == null) ? "請輸入活動名稱" : actVO.getActName()%>" /></td>
						</tr>
						<tr>
							<td>活動描述</td>
							<td><input type="TEXT" name="actDes" size="45"
								value="<%=(actVO == null) ? "請描述活動" : actVO.getActDes()%>" /></td>
						</tr>
						<tr>
							<td>活動照片</td>
							<td><input type="file" id="fileElem" multiple
								accept="image/*"
								style="background-image:; width: 200px; height: 25px;"
								name="actPic" accept="image/jpeg, image/png"
								value="<%=(actVO == null) ? "請上傳活動照片" : actVO.getActPic()%>" /></td>
						</tr>
						<tr>
							<td>活動總人數</td>
							<td><input type="TEXT" name="actTalPeo" size="45"
								value="<%=(actVO == null) ? "60" : actVO.getActTalPeo()%>" /></td>
						</tr>
						<tr>				
							<td>舉辦日期</td>
							<td>
							<input id="f_date1" type="text" name="actHoDate" placeholder="請輸入舉辦日期" /></td>
						</tr>
						<tr>
							<td>報名起始日</td>
							<td><input id="f_date2" type="text" name="actStDate" placeholder="請輸入報名起始日" /></td>
						</tr>
						<tr>
							<td>報名截止日</td>
							<td><input id="f_date3" type="text" name="actEdDate" placeholder="請輸入報名截止日 "/></td>
						</tr>
						<tr>
							<td>報名費</td>
							<td><input type="TEXT" name="actFee" size="45"
								value="<%=(actVO == null) ? "500" : actVO.getActFee()%>" /></td>
						</tr>
						<tr>
							<td>活動報名狀態</td>
							<td><input type="TEXT" name="actMode" size="45"
								value="<%=(actVO == null) ? "1" : actVO.getActMode()%>" /></td>
						</tr>
						<tr>
							<td>活動報名人數上限</td>
							<td><input type="TEXT" name="actUpper" size="45"
								value="<%=(actVO == null) ? "60" : actVO.getActUpper()%>" /></td>
						</tr>
						<tr>
							<td>活動報名人數下限</td>
							<td><input type="TEXT" name="actLower" size="45"
								value="<%=(actVO == null) ? "20" : actVO.getActLower()%>" /></td>
						</tr>

					</table>
					<br> <input type="hidden" name="action" value="add"> <input
						type="submit" value="送出新增">
				</FORM>
			</div>
		</div>
	</div>
	<%@ include file="/back-end/back-end-footer.jsp"%>
</body>
<!-- =========================================以下為 datetimepicker 之相關設定========================================== -->

<%
	java.sql.Timestamp actHoDate = null;
	try {
		actHoDate = actVO.getActHoDate();
	} catch (Exception e) {
		actHoDate = new java.sql.Timestamp(System.currentTimeMillis());
	}
	java.sql.Timestamp actStDate = null;
	try {
		actStDate = actVO.getActStDate();
	} catch (Exception e) {
		actStDate = new java.sql.Timestamp(System.currentTimeMillis());
	}
	java.sql.Timestamp actEdDate = null;
	try {
		actEdDate = actVO.getActEdDate();
	} catch (Exception e) {
		actEdDate = new java.sql.Timestamp(System.currentTimeMillis());
	}
%>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/back-end/activity/datetimepicker/jquery.datetimepicker.css" />
<script
	src="<%=request.getContextPath()%>/back-end/activity/datetimepicker/jquery.js"></script>
<script
	src="<%=request.getContextPath()%>/back-end/activity/datetimepicker/jquery.datetimepicker.full.js"></script>

<style>
.xdsoft_datetimepicker .xdsoft_datepicker {
	width: 300px; /* width:  300px; */
}

.xdsoft_datetimepicker .xdsoft_timepicker .xdsoft_time_box {
	height: 151px; /* height:  151px; */
}
</style>

<script>
        $.datetimepicker.setLocale('zh');
        $('#f_date1').datetimepicker({
	       theme: '',              //theme: 'dark',
	       timepicker:false,       //timepicker:true,
	       step: 1,                //step: 60 (這是timepicker的預設間隔60分鐘)
	       format:'Y-m-d H:i:s',         //format:'Y-m-d H:i:s',
		   value: '<%=actHoDate%>', // value:   new Date(),
           //disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // 去除特定不含
           //startDate:	            '2017/07/10',  // 起始日
           //minDate:               '-1970-01-01', // 去除今日(不含)之前
           //maxDate:               '+1970-01-01'  // 去除今日(不含)之後
        });
        $('#f_date2').datetimepicker({
 	       theme: '',              //theme: 'dark',
 	       timepicker:false,       //timepicker:true,
 	       step: 1,                //step: 60 (這是timepicker的預設間隔60分鐘)
 	       format:'Y-m-d H:i:s',         //format:'Y-m-d H:i:s',
 		   value: '<%=actStDate%>', // value:   new Date(),
            //disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // 去除特定不含
            //startDate:	            '2017/07/10',  // 起始日
            //minDate:               '-1970-01-01', // 去除今日(不含)之前
            //maxDate:               '+1970-01-01'  // 去除今日(不含)之後
         });
        $('#f_date3').datetimepicker({
 	       theme: '',              //theme: 'dark',
 	       timepicker:false,       //timepicker:true,
 	       step: 1,                //step: 60 (這是timepicker的預設間隔60分鐘)
 	       format:'Y-m-d H:i:s',         //format:'Y-m-d H:i:s',
 		   value: '<%=actEdDate%>', // value:   new Date(),
	//disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // 去除特定不含
	//startDate:	            '2017/07/10',  // 起始日
	//minDate:               '-1970-01-01', // 去除今日(不含)之前
	//maxDate:               '+1970-01-01'  // 去除今日(不含)之後
	});

	// ----------------------------------------------------------以下用來排定無法選擇的日期-----------------------------------------------------------

	//      1.以下為某一天之前的日期無法選擇
	//      var somedate1 = new Date('2017-06-15');
	//      $('#f_date1').datetimepicker({
	//          beforeShowDay: function(date) {
	//        	  if (  date.getYear() <  somedate1.getYear() || 
	//		           (date.getYear() == somedate1.getYear() && date.getMonth() <  somedate1.getMonth()) || 
	//		           (date.getYear() == somedate1.getYear() && date.getMonth() == somedate1.getMonth() && date.getDate() < somedate1.getDate())
	//              ) {
	//                   return [false, ""]
	//              }
	//              return [true, ""];
	//      }});

	//      2.以下為某一天之後的日期無法選擇
	//      var somedate2 = new Date('2017-06-15');
	//      $('#f_date1').datetimepicker({
	//          beforeShowDay: function(date) {
	//        	  if (  date.getYear() >  somedate2.getYear() || 
	//		           (date.getYear() == somedate2.getYear() && date.getMonth() >  somedate2.getMonth()) || 
	//		           (date.getYear() == somedate2.getYear() && date.getMonth() == somedate2.getMonth() && date.getDate() > somedate2.getDate())
	//              ) {
	//                   return [false, ""]
	//              }
	//              return [true, ""];
	//      }});

	//      3.以下為兩個日期之外的日期無法選擇 (也可按需要換成其他日期)
	//      var somedate1 = new Date('2017-06-15');
	//      var somedate2 = new Date('2017-06-25');
	//      $('#f_date1').datetimepicker({
	//          beforeShowDay: function(date) {
	//        	  if (  date.getYear() <  somedate1.getYear() || 
	//		           (date.getYear() == somedate1.getYear() && date.getMonth() <  somedate1.getMonth()) || 
	//		           (date.getYear() == somedate1.getYear() && date.getMonth() == somedate1.getMonth() && date.getDate() < somedate1.getDate())
	//		             ||
	//		            date.getYear() >  somedate2.getYear() || 
	//		           (date.getYear() == somedate2.getYear() && date.getMonth() >  somedate2.getMonth()) || 
	//		           (date.getYear() == somedate2.getYear() && date.getMonth() == somedate2.getMonth() && date.getDate() > somedate2.getDate())
	//              ) {
	//                   return [false, ""]
	//              }
	//              return [true, ""];
	//      }});
</script>
</html>