<%@ page contentType="text/html; charset=Big5"%>
<%@ page import="com.platinf.model.*"%>
<%
PlatinfVO platinfVO = (PlatinfVO) request.getAttribute("platinfVO"); //PlatinfServlet.java(Controller), �s�Jreq��platinfVO����
%>
<html>
<head>
<title>���x��T��� - listOnePlatinf.jsp</title>
</head>
<body bgcolor='white'>

<table border='1' cellpadding='5' cellspacing='0' width='600'>
	<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
		<td>
		<h3>���x��T��� - ListOnePlatinf.jsp</h3>
		<a href="selectPlatinf_page.jsp">�^����</a>
		</td>
	</tr>
</table>

<table border='1' bordercolor='#CCCCFF' width='600'>
	<tr>
		<th>��T�s��</th>
		<th>���q�a�}</th>
		<th>�p���q��</th>
		<th>�ȪA�H�c</th>
		<th>���p�v�F��</th>
		<th>��s���</th>
		<th>�Ϥ�</th>
	</tr>
	<tr align='center' valign='middle'>
		<td><%=platinfVO.getPin_no()%></td>
		<td><%=platinfVO.getCom_address()%></td>
		<td><%=platinfVO.getCp_no()%></td>
		<td><%=platinfVO.getCs_email()%></td>
		<td><%=platinfVO.getPr_policy()%></td>
		<td><%=platinfVO.getUpd_date()%></td>
		<td><%=platinfVO.getPin_photo()%></td>
		
	</tr>
</table>

</body>
</html>
