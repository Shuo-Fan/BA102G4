<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.queans.model.*"%>
<%
QueansVO queansVO = (QueansVO) request.getAttribute("queansVO");
%>

<html>
<head>
<title>�`�����D�s�W</title></head>

<body bgcolor='#E8FFFF'>

<table border='5' cellpadding='5' cellspacing='0' width='400' style="border-color:#FFD700;">
	<tr bgcolor='yellow' align='center' valign='middle' height='20'>
		<td>
		<h3>�`�����D�s�W</h3>
		<a href="selectQueans_page.jsp">�^����</a>
		</td>
		
	</tr>
</table>

<h3>���:</h3>
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

<FORM METHOD="post" ACTION="queans.do" name="form1" enctype="multipart/form-data">
<table border="2" bgcolor="#FFB01C" style="border-color:#0000FF;">

	<tr>
		<td>���D���D:</td>
		<td><input type="TEXT" name="que_title" size="45" style="background-color:#C9FFC9;"
			value="<%= (queansVO==null)? "" : queansVO.getQue_title()%>" /></td>
	</tr>
	
	<jsp:useBean id="queansSvc" scope="page" class="com.queans.model.QueansService" />
	<tr>
		<td>���D���O:<font color=red><b></b></font></td>
		<td><select size="1" name="que_type" style="background-color:#8CFFFF;">
		  
		  <option value="���U">���U</option>
          <option value="����">����</option>
          <option value="���W">���W</option>
		
		</select></td>
	</tr>
	
	<tr>
		<td>�ѻ�����:</td>
		<td align='center'><textarea name= "ans_ctx" rows="20" cols="40" style="resize:none;border:2px #00C700 dashed;background-color:#C9FFC9;"></textarea></td>
	</tr>
	
	<tr>
		<td>�Ϥ�:</td>
		<td><input type="file" name="que_photo"/></td>
	</tr>

</table>
<br>
<input type="hidden" name="action" value="insert">
<input type="submit" value="�e�X�s�W" style="width:80px;height:40px;font-size:15px;"></FORM>
</body>

</html>
