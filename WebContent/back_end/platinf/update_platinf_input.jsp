<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.platinf.model.*"%>
<%
	PlatinfVO platinfVO = (PlatinfVO) request.getAttribute("platinfVO"); //PlatinfServlet.java (Controller), �s�Jreq��platinfVO���� (�]�A�������X��platinfVO, �]�]�A��J��ƿ��~�ɪ�platinfVO����)
%>
<html>
<head>
<title>���x��T�ק�</title></head>



<body bgcolor='#E8FFFF'>

<table border='5' cellpadding='5' cellspacing='0' width='400' style="border-color:#FFD700;">
	<tr bgcolor='yellow' align='center' valign='middle' height='20'>
		<td>
		<h3>���x��T�ק�</h3>
		<a href="selectPlatinf_page.jsp">�^����</a></td>
	</tr>
</table>

<h3>��ƭק�:</h3>
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

<FORM METHOD="post" ACTION="platinf.do" name="form1" enctype='multipart/form-data'>
<table border="2" bgcolor="#FFB01C" style="border-color:#0000FF;">
	
	
	<tr>
		<td>���q�a�}:</td>
		<td><input type="TEXT" name="com_address" size="45" style="background-color:#CCCCFF;" value="<%=platinfVO.getCom_address()%>" /></td>
	</tr>
	
	
	<tr>
		<td>�p���q��:</td>
		<td><input type="TEXT" name="cp_no" size="45" style="background-color:#8CFFFF;" value="<%=platinfVO.getCp_no()%>" /></td>
	</tr>
	
	<tr>
		<td>�ȪA�H�c:</td>
		<td><input type="TEXT" name="cs_email" size="45" style="background-color:#FFD4D4; "value="<%=platinfVO.getCs_email()%>" /></td>
	</tr>
	
	<tr>
		<td>���p�v�F��:</td>
		<td align='center'><textarea name= "pr_policy" rows="20" cols="40" style="resize:none;border:2px #00C700 dashed;background-color:#C9FFC9;"><%=platinfVO.getPr_policy()%>
		
		</textarea></td>
	</tr>
	
	
	<tr rospan='2'>
		<td>�Ϥ�:</td>
		<td><img id='pic' height=100 src='${pageContext.request.contextPath }/g1/PhotoOutputP?pin_no=${platinfVO.pin_no}'/><br><input type="file" id='file' name="pin_photo"/></td>
	</tr>
	
	
	

</table>
<br>
<input type="hidden" name="action" value="update">
<input type="hidden" name="pin_no" value="<%=platinfVO.getPin_no()%>">
<input type="submit" value="�T�{�ק�" style="width:80px;height:40px;font-size:15px;"></FORM>

</body>
<script src="https://code.jquery.com/jquery.js"></script>	
<script type="text/javascript">
$(function(){
	Preview.file_change();
})
Preview = new function() {
	var fileInput = $('#file');
	this.file_change = function() {
		$('#file').on('change', function() {
			show(this);
		});
	}
	var show = function(input) {
		if (input.files && input.files[0]) {
			each_img(input.files);
		}
	}			
	var each_img = function(files) {
		$.each(files,function(index, file) {
				if (file.type.match('image')) {
					var reader = new FileReader();				
					reader.onload = function() {
						$('#pic').prop('src',reader.result);
					}
					if (file) {
						reader.readAsDataURL(file);
					}
				}
			});
	}

}
</script>
</html>
