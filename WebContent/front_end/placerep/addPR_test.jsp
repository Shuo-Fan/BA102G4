<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.place.model.*" %>
<%-- <%@ page import="com.place_time.model.*" %> --%>
 <% 
//  	PlaceService PSvc = new PlaceService();
//  	List<PlaceVO> list = PSvc.getAll();
//  	pageContext.setAttribute("list", list);
 %> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>addPR_test</title>
</head>
<body>
	<table border='1' cellpadding='5' cellspacing='0' width='400'>
		<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
			<td>
				<h3>���a���|���s��@ - addPR_test.jsp</h3>
				<h3>${user.mem_nickname},�A�n!!</h3>
			</td>
		</tr>
	</table>
	
	<h4>
		���a���|:<font color=red><b>*</b></font>���������
	</h4>
	<c:if test="${not empty errorMsgs}">
		<font color='red'>���~:
			<ul>
				<c:forEach var="message" items="${errorMsgs}">
					<li>${message.value}</li>
				</c:forEach>
			</ul>
		</font>
	</c:if>
	
	<table border='1'>
		<tr>
			<th>���a�s��</th>
			<th>�����бb��</th>
			<th>���a�W��</th>
			<th>�f�֪��A</th>
			<th>���|</th>
		</tr>
		
		<c:forEach var="placeVO" items="${list}" >
			<tr align="center" valign="middle">
				
				<td>${placeVO.p_no}</td>
				<td>${placeVO.g_acc}</td>
				<td>${placeVO.p_name}</td>
				<td>${placeVO.status}</td>
				<td>
					<form method="post"
						action="<%=request.getContextPath()%>/placerep/PlaceRepCtrl"
						enctype='multipart/form-data'>
						<input type="submit" value="���|"> 
						<input type="hidden" name="p_no" value="${placeVO.p_no}">
						<input type="hidden" name="action" value="addPR">
					</form>
				</td>

				
		</c:forEach>
	</table>
	
	
</body>
</html>