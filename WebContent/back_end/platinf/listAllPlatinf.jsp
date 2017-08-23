<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.platinf.model.*"%>
<%-- �����m�߱ĥ� EL ���g�k���� --%>

<%
    PlatinfService platinfSvc = new PlatinfService();
    List<PlatinfVO> list = platinfSvc.getAll();
    pageContext.setAttribute("list",list);
%>

<html>
<head>
<title>listAllPlatinf.jsp</title>
</head>
<body bgcolor='#E8FFFF'>
<b><font color=red></font></b>
<table border='5' cellpadding='5' cellspacing='0' width='800' style="border-color:#FFD700;">
	<tr bgcolor='yellow' align='center' valign='middle' height='20'>
		<td>
		<h3>���x��T�`��</h3>
		<a href="selectPlatinf_page.jsp">�^����</a>
		</td>
	</tr>
</table>

<%-- ���~��C --%>
<c:if test="${not empty errorMsgs}">
	<font color='red'>�Эץ��H�U���~:
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li>${message}</li>
		</c:forEach>
	</ul>
	</font>
</c:if>

<table border="2" bgcolor="#DEFFDE" style="border-color:#0000FF;" width='1500'>
	<tr>
<!-- 		<th>��T�s��</th> -->
		<th>���q�a�}</th>
		<th>�p���q��</th>
		<th>�ȪA�H�c</th>
		<th>���p�v�F��</th>
		<th>��s���</th>
		<th>�Ϥ�</th>
		<th>�ק�</th>
		<th>�R��</th>
	</tr>
	<%@ include file="page1.file" %> 
	<c:forEach var="platinfVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		<tr align='center' valign='middle'>
<%-- 			<td>${platinfVO.pin_no}</td> --%>
			<td align='left'>${platinfVO.com_address}</td>
			<td>${platinfVO.cp_no}</td>
			<td>${platinfVO.cs_email}</td>
			<td align='left' valign='top'>${platinfVO.pr_policy}</td>
			<td>${platinfVO.upd_date}</td>
			<td><img height=80 src='${pageContext.request.contextPath }/g1/PhotoOutputP?pin_no=${platinfVO.pin_no}'/></td>
			
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back_end/platinf/platinf.do">
			     <input type="submit" value="�ק�">
			     <input type="hidden" name="pin_no" value="${platinfVO.pin_no}">
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back_end/platinf/platinf.do">
			    <input type="submit" value="�R��">
			    <input type="hidden" name="pin_no" value="${platinfVO.pin_no}">
			    <input type="hidden" name="action"value="delete"></FORM>
			</td>
		</tr>
	</c:forEach>
</table>
<%@ include file="page2.file" %>

</body>
</html>
