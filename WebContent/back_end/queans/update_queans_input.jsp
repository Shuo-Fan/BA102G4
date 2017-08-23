<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.queans.model.*"%>
<%
QueansVO queansVO = (QueansVO) request.getAttribute("queansVO"); //QueansServlet.java (Controller), �s�Jreq��queansVO���� (�]�A�������X��queansVO, �]�]�A��J��ƿ��~�ɪ�queansVO����)
%>
<html>
<head>
<title>�`�����D�ק�</title></head>



<body bgcolor='#E8FFFF'>

<table border='5' cellpadding='5' cellspacing='0' width='400' style="border-color:#FFD700;">
	<tr bgcolor='yellow' align='center' valign='middle' height='20'>
		<td>
		<h3>�`�����D�ק�</h3>
		<a href="selectQueans_page.jsp">�^����</a></td>
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

<FORM METHOD="post" ACTION="queans.do" name="form1" enctype='multipart/form-data'>
<table border="2" bgcolor="#FFB01C" style="border-color:#0000FF;">
	
	
	<tr>
		<td>���D���D:</td>
		<td><input type="TEXT" name="que_title" size="45" style="background-color:#C9FFC9;" value="<%=queansVO.getQue_title()%>" /></td>
	</tr>
	
	<jsp:useBean id="queansSvc" scope="page" class="com.queans.model.QueansService" />
	<tr>
		<td>���D���O:<font color=red><b></b></font></td>
		<td><select size="1" name="que_type" style="background-color:#8CFFFF;">
			
		  <option value="���U"<%if("���U".equals(queansVO.getQue_type())){
		  out.print("selected");}%>>���U</option> 
		  <option value="����"<%if("����".equals(queansVO.getQue_type())){
		  out.print("selected");}%>>����</option> 
		  <option value="���W"<%if("���W".equals(queansVO.getQue_type())){
		  out.print("selected");}%>>���W</option> 
		  
		
            
		</select>
		</td>
	</tr>
	
	<tr>
		<td>�ѻ�����:</td>
		<td align='center'><textarea name= "ans_ctx" rows="20" cols="40" style="resize:none;border:2px #00C700 dashed;background-color:#C9FFC9;"><%=queansVO.getAns_ctx()%>
	    </textarea></td>
	</tr>
	
	<tr rospan='2'>
		<td>�Ϥ�:</td>
		<td><img id='pic' height=100 src='${pageContext.request.contextPath }/g1/PhotoOutputQ?que_no=${queansVO.que_no}'/><br><input type="file" id='file' name="que_photo"/></td>
	</tr>
	
	

</table>
<br>
<input type="hidden" name="action" value="update">
<input type="hidden" name="que_no" value="<%=queansVO.getQue_no()%>">
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
