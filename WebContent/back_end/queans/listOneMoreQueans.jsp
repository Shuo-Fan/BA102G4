<%@ page contentType="text/html; charset=Big5"%>
<%@ page import="com.queans.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title>�`�����D���</title>
</head>
<body bgcolor='#E8FFFF'>

<table border='5' cellpadding='5' cellspacing='0' width='800' style="border-color:#FFD700;">
	<tr bgcolor='yellow' align='center' valign='middle' height='20'>
		<td>
		<h3>�`�����D���</h3>
		<a href="selectQueans_page.jsp">�^����</a>
		</td>
	</tr>
</table>
<br>
<table border='2' bgcolor="#DEFFDE" style="border-color:#0000FF;" width='1500'>
	<tr>
		
		<th>��s���</th>
		<th>���D���O</th>
		<th>���D���D</th>
		<th>�ѻ�����</th>
		<th>���D�Ϥ�</th>
		<th>�ק�</th>
		<th>�R��</th>
	</tr>
	<c:forEach var="queans" items='${queansVO }' >
	<tr align='center' valign='middle'>
		
		<td>${queans.upd_date}</td>
		<td>${queans.que_type}</td>
		<td align='left'>${queans.que_title}</td>
		<td align='left' valign='top'>${queans.ans_ctx}</td>
		<td><img height=80 src='${pageContext.request.contextPath }/g1/PhotoOutputQ?que_no=${queans.que_no}'/></td>
		
		<td>
		    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back_end/queans/queans.do">
			   <input type="submit" value="�ק�">
			   <input type="hidden" name="que_no" value="${queans.que_no}">
			   <input type="hidden" name="action" value="getOne_For_Update"></FORM>
		</td>
		<td>
			<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back_end/queans/queans.do">
			   <input type="submit" value="�R��">
			   <input type="hidden" name="que_no" value="${queans.que_no}">
			   <input type="hidden" name="action"value="delete"></FORM>
		</td>
	</tr>
	</c:forEach>
</table>

</body>
</html>
