<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.queans.model.*"%>
<%-- �����m�߱ĥ� EL ���g�k���� --%>

<%
    QueansService queansSvc = new QueansService();
    List<QueansVO> list = queansSvc.getAll();
    pageContext.setAttribute("list",list);
%>

<html>
<head>
<title>listAllQueans.jsp</title>
</head>
<body bgcolor='#E8FFFF'>
<b><font color=red></font></b>
<table border='5' cellpadding='5' cellspacing='0' width='800' style="border-color:#FFD700;">
	<tr bgcolor='yellow' align='center' valign='middle' height='20'>
		<td>
		<h3>�`�����D�`��</h3>
		<a href="selectQueans_page.jsp">�^����</a>
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
		
		<th>��s���</th>
		<th>���D���O</th>
		<th>���D���D</th>
		<th>�ѻ�����</th>
		<th>�Ϥ�</th>
		<th>�ק�</th>
		<th>�R��</th>
	</tr>
	<%@ include file="page1.file" %> 
	<c:forEach var="queansVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		<tr align='center' valign='middle'>
			
			<td>${queansVO.upd_date}</td>
			<td>${queansVO.que_type}</td>
			<td align='left'>${queansVO.que_title}</td>
			<td align='left' valign='top'>${queansVO.ans_ctx}</td>
			<td><img height=80 src='${pageContext.request.contextPath }/g1/PhotoOutputQ?que_no=${queansVO.que_no}'/></td>
			
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back_end/queans/queans.do">
			     <input type="submit" value="�ק�">
			     <input type="hidden" name="que_no" value="${queansVO.que_no}">
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back_end/queans/queans.do">
			    <input type="submit" value="�R��">
			    <input type="hidden" name="que_no" value="${queansVO.que_no}">
			    <input type="hidden" name="action"value="delete"></FORM>
			</td>
		</tr>
	</c:forEach>
</table>
<%@ include file="page2.file" %>

</body>
</html>
