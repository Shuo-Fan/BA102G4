<%@ page contentType="text/html; charset=Big5"%>
<%@ page import="com.queans.model.*"%>
<%
QueansVO queansVO = (QueansVO) request.getAttribute("queansVO"); //QueansServlet.java(Controller), �s�Jreq��queansVO����
%>
<html>
<head>
<title>�`�����D���</title>
</head>
<body bgcolor='white'>

<table border='1' cellpadding='5' cellspacing='0' width='600'>
	<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
		<td>
		<h3>�`�����D���</h3>
		<a href="selectQueans_page.jsp">�^����</a>
		</td>
	</tr>
</table>

<table border='1' bordercolor='#CCCCFF' width='600'>
	<tr>
		<th>���D�s��</th>
		<th>��s���</th>
		<th>���D���O</th>
		<th>���D���D</th>
		<th>�ѻ�����</th>
		<th>���D�Ϥ�</th>
	</tr>
	<tr align='center' valign='middle'>
		<td><%=queansVO.getQue_no()%></td>
		<td><%=queansVO.getUpd_date()%></td>
		<td><%=queansVO.getQue_type()%></td>
		<td><%=queansVO.getQue_title()%></td>
		<td><%=queansVO.getAns_ctx()%></td>
		<td><%=queansVO.getQue_photo()%></td>
		
	</tr>
</table>

</body>
</html>
