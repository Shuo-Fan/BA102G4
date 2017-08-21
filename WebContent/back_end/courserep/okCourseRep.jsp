<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*"%>
<%@ page import="com.Course_list.model.*"%>
<%@ page import="com.Course_time.model.*"%>
<%@ page import="com.Course.model.*"%>

<%
	course_listService courseRepSvc = new course_listService();
	List<Course_listVO> list = courseRepSvc.getReportSta(2);
	pageContext.setAttribute("list", list);
%>
<jsp:useBean id="courseRepMemSvc" scope="page" class="com.members.model.MembersService"/>
<jsp:useBean id="courseRepCourseSvc" scope="page" class="com.Course.model.CourseService"/>
<jsp:useBean id="courseRepCourseTimeSvc" scope="page" class="com.Course_time.model.Course_timeService"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-cn-en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>okCourseRep</title>
</head>
<body>
<h3>�ҵ{���|�f��_�H�B�z - okCourseRep.jsp</h3>
	<c:if test="${not empty errorMsgs}">
		<font color='red'>�ЭץH�U���~:
			<ul>
				<c:forEach var="message" items="${errorMsgs}">
					<li>${message}</li>
				</c:forEach>
			</ul>
		</font>
	</c:if>
	<table border='1'>
		<tr> 
			<th>�ҵ{�s��</th>
			<th>�ҵ{�W��</th>
			<th>���|�̱b��</th>
			<th>���|�̼ʺ�</th>
			<th>���|��]</th>
			<th>���A</th>
		</tr>
		<%@ include file="page1.file"%>
		<c:forEach var="courseReportVO" items="${list}"
			begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
			<tr align="center" valign="middle">
				<td>${courseReportVO.ct_no}</td>
				<td>${courseRepCourseSvc.getCourse(courseReportVO.ct_no).crs_name}</td>
				<td>${courseReportVO.stu_acc}</td>
				<td>${courseRepMemSvc.getMemAcc(courseReportVO.stu_acc).mem_nickname}</td>
				<td>${courseReportVO.report_ct}</td>
				<td>${courseReportVO.report_sta==2?'�H�B�z':''}</td>
		</c:forEach>
	</table>
	<%@ include file="page2.file"%>
</body>
</html>