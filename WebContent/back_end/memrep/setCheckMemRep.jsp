<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.membersreport.model.*"%>


<%
	MembersReportService MRSvc = new MembersReportService();
	Set<MembersReportVO> list = MRSvc.getStat(0);
	pageContext.setAttribute("list",list);
%>
<jsp:useBean id="ADapplyMemSvc" scope="page" class="com.members.model.MembersService"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-cn-en">
<head>
<title>���f��x�޲z�t��</title>

<%@include file="/back_end/include/basic_ace_script.file" %>
</head>
<body>
<%@include file="/back_end/include/navbar.file" %>
<%@include file="/back_end/include/sliderBar_breadCrumb.file" %>
	<div class="page-content">
		<div class="page-header">
			<h1>
				���|�޲z<small> <i class="icon-double-angle-right"></i>
					�|�����|_���f�� - setCheckMemRep
				</small>
			</h1>
		</div>
		<!-- /.page-header -->

	
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
<!-- 			<th>���|�s��</th> -->
			<th>���|�ɶ�</th>
			<th>�Q���|��</th>
			<th>��]</th>
			<th>���|��</th>
			<th>�Q���|���e</th>
<!-- 			<th>�Ӥ�</th> -->
			<th>���A</th>
			<th>�֭�</th>
			<th>��^</th>
		</tr>
		<%@ include file="page1.file"%>
		<c:forEach var="membersReportVO" items="${list}"
			>
			<tr align="center" valign="middle">
<%-- 				<td>${membersReportVO.mr_no}</td> --%>
				<td>${membersReportVO.mr_time}</td>
				<td>${membersReportVO.mr_def}</td>
				<td>${membersReportVO.mr_ctx}</td>
				<td>${membersReportVO.mr_pro}</td>
				<td>${membersReportVO.ref_ctx}</td>
<!-- 				<td><img -->
<%-- 					src="<%=request.getContextPath()%>/tools/DBGifReader?mr_no=${membersReportVO.mr_no}" --%>
<!-- 					style="width: 100px; height: 100px;"></td> -->
				<td>${membersReportVO.mr_stat == 0 ?'���f��':'���f��'}</td>
				<td>
					<form method="post"
						action="<%=request.getContextPath()%>/memrep/MemRepCtrl">
						<input type="submit" value="�֭�"> <input type="hidden"
							name="mr_no" value="${membersReportVO.mr_no}"> <input
							type="hidden" name="mr_def" value="${membersReportVO.mr_def}">
						<input type="hidden" name="action" value="Report">
					</form>
				</td>

				<td><form method="post"
						action="<%=request.getContextPath()%>/memrep/MemRepCtrl">
						<input type="submit" value="��^"> <input type="hidden"
							name="mr_no" value="${membersReportVO.mr_no}"> <input
							type="hidden" name="action" value="NO_Report">
					</form></td>
			</tr>
		</c:forEach>
	</table>
	<%@ include file="page2.file"%>
<%@include file="/back_end/include/ace_setting_footer.file"%>
</body>
</html>