<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head><title>���x��T�޲z</title></head>
<body bgcolor='#E8FFFF'>

<table border='5' cellpadding='5' cellspacing='0' width='400' style="border-color:#1AFF19;">
  <tr bgcolor='yellow' align='center' valign='middle' height='20'>
    <td><h3>���x��T�޲z</h3></td>
  </tr>
</table>

<p></p>

<h3>[��T�d��]:</h3>
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

<ul>
  <li><a href='listAllPlatinf.jsp'><input type="submit" value="��T�`��" style="width:80px;height:40px;font-size:15px;"></a> </li> <br><br>
  
  
</ul>


<h3>[�s�W��T]</h3>

<ul>
  <li><a href='addPlatinf.jsp'><input type="submit" value="�s�W" style="width:80px;height:40px;font-size:15px;"></a></li>
</ul>

</body>

</html>
