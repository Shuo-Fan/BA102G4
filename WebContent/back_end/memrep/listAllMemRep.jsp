<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*"%>
<%@ page import="com.membersreport.model.*"%>

<%
	MembersReportService MRSvc = new MembersReportService();
	List<MembersReportVO> list = MRSvc.getAll();
	pageContext.setAttribute("list", list);
%>

<!DOCTYPE html>
<html>
<head>
<title>listAllMemRep</title>
</head>
<body>
	<h3>�|�����|�f��_�`�� - ListAllMemRep.jsp</h3>
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
			<th>���|�s��</th>
			<th>�Q���|��</th>
			<th>���|��</th>
			<th>���|��]</th>
			<th>�ɶ�</th>
			<th>�Q���|���e</th>
			<th>�Ӥ�</th>
			<th>���A</th>
			<th>�֭�</th>
			<th>��^</th>
		</tr>
		<%@ include file="page1.file"%>
		<c:forEach var="membersReportVO" items="${list}"
			begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
			<tr align="center" valign="middle">
				<td>${membersReportVO.mr_no}</td>
				<td>${membersReportVO.mr_def}</td>
				<td>${membersReportVO.mr_pro}</td>
				<td>${membersReportVO.mr_ctx}</td>
				<td>
				<fmt:formatDate type="both"  dateStyle="long" timeStyle="long"  
				value="${membersReportVO.mr_time}" />
				</td>
				<td>${membersReportVO.ref_ctx}</td>
				<td><img
					src="<%=request.getContextPath()%>/tools/DBGifReader?mr_no=${membersReportVO.mr_no}"
					style="width: 100px; height: 100px;"></td>
				<td>${membersReportVO.mr_stat}</td>
				<td>
					<form method="post"
						action="<%=request.getContextPath()%>/memrep/MemRepCtrl">
						<input type="submit" value="�֭�"> 
						<input type="hidden" name="mr_no" value="${membersReportVO.mr_no}"> 
						<input type="hidden" name="mr_def" value="${membersReportVO.mr_def}">
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

</body>
</html>