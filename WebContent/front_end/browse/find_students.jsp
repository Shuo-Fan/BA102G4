<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<%@ page import="com.members.model.*" %>
<%@ page import="com.coaches.model.*" %>
<%@ page import="com.students.model.*" %>
<%@ page import="com.gyms.model.*" %>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${empty searchResult}">
<%  	StudentsService studentsSV = new StudentsService();
		List<StudentsVO> list = studentsSV.getAll();
		pageContext.setAttribute("list",list);
%>
</c:if>
<c:if test="${not empty searchResult}">
<%		List<StudentsVO> searchResult = (List<StudentsVO>)request.getAttribute("searchResult");
%>
</c:if>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-cn-en">

<head>
    <title>���f - GymHome</title>
    <%@include file="/front_end/include/basicScript.file" %>
	<!-- ����r�Ʊ��� -->
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	
<style>
	div.item-caption{
		margin-top: 0;
		padding-top: 0;
	}
	div.item-caption-inner1{
		 margin-top: 0;
		 padding-top: 0;
	}
	div.img_title{
		text-align: center;
		background-color: #FFFFBB;
	}
	div.item-container{
		border-radius:100px;
	}
</style>

</head>


<body>

    <!-- �����C -->
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<%@include file="/front_end/include/front_navbar.file" %>
    </nav>
    

    <!-- Page Content -->
    <div class="container">
        
        <!-- Page Heading/Breadcrumbs -->
        <div class="breadcrumbs" id="breadcrumbs">    
            <div class="col-lg-12">
                <h1>��ǭ�
                    <small>Coaches</small>
                </h1>
            </div>

            <ul class="breadcrumb">
                <li>
                    <i class="icon-home home-icon"></i>
                        <a href="#">����</a>
                     </li>
                <li class="active">�A�Ȥ���</li>
                <li class="active">��ǭ�</li>
            </ul><!-- .breadcrumb -->
        </div>
        <br>
            	<form action="<%= request.getContextPath() %>/StudentsServlet" method="post" id="search_stu">
                <div class="row">
                	
                	<div class="col-lg-2">
                            <input type="search" placeholder="��J�ǭ��m�W" name="search_Name">
                    </div>
                    
                    <div class="col-lg-2">
                    	<select class="form-control" id="form-field-select-1" name="search_Type">
							<option value="0">�����d������</option>
                        	<option value="1">�٤O�V�m</option>
                        	<option value="2">����</option>
                        	<option value="3">����</option>
                        	<option value="4">����</option>
                    	</select>
                    </div>

                    <div class="col-lg-2">
                        <input type="button" class="btn btn-info" value="�d�ݵ��G" onclick="tick.call(this);">
                        <input type="hidden" name="action" value="search_stu">
                    </div>

                    <div class="col-lg-2">
                        <input type="reset" class="btn btn-default" value="���m����">
                    </div>
                </div>
                </form>
                               
<div class="row bigHead">
<c:if test="${not empty errorMsgs}">
	<div class="row">
		<div class="col-md-4 pic">
                <img src="<%= request.getContextPath() %>/style/images/noResult.png">
        </div>
		<div class="col-md-8 word">
			<b>�ګܩ�p ,�d�L���G<br><p></p>
			I am SORRY ,no results found<br><p></p>
			Ƹ������ƹƨ ,���Gư����Ư����ƿ��</b>
		</div>
	</div>
</c:if>

<c:if test="${empty searchResult && empty errorMsgs}">
		<div class="row">
<c:forEach var="studentsVO" items="${list}">
            <div class="col-md-2 col-sm-4 animated bounceIn">
				<div class="img_title">
						<center>
							�ǭ�
							<h3 style="margin-top:5px;">
							${studentsVO.stu_name }
						</h3>
					</center>
				</div>	
					<div class="item-container">
						<div class="item-caption black">
							<a href="<%= request.getContextPath() %>/MembersServlet?mem_rank=0&stu_no=${studentsVO.stu_no}&action=lookPersonal" target="_blank">
								<div class="item-caption-inner">
									<div class="item-caption-inner1">
										<span class="into">${studentsVO.stu_into }</span>
											<P></P>
										<span>�`�J�F�ѧ�&nbsp<i class="icon-arrow-right icon-on-right"></i></span>
									</div>
								</div>
							</a>
						</div>
							<img  src="<%= request.getContextPath() %>/XiangZhiPic?mem_rank=0&mem_no=${studentsVO.stu_no}" style="margin-top:4px;border-radius:100px;box-shadow:0px 0px 12px #7E7E7E;" />
					</div>
			</div>
</c:forEach>
		</div>
</c:if>

<c:if test="${not empty searchResult && empty errorMsgs}">
		<div class="row">
<c:forEach var="studentsVO" items="${searchResult}">
            <div class="col-md-2 col-sm-4 animated bounceIn">
				<div class="img_title">
					<center>
						�ǭ�
						<h3 style="margin-top:5px;">
						${studentsVO.stu_name }
					</h3>
				</div>	
					<div class="item-container">
						<div class="item-caption black">
							<a href="<%= request.getContextPath() %>/MembersServlet?mem_rank=0&stu_no=${studentsVO.stu_no}&action=lookPersonal" target="_blank">
								<div class="item-caption-inner">
									<div class="item-caption-inner1">
										<span class="into">${studentsVO.stu_into }</span>
											<P></P>
										<span>�`�J�F�ѧ�&nbsp<i class="icon-arrow-right icon-on-right"></i></span>
									</div>
								</div>
							</a>
						</div>
							<img  src="<%= request.getContextPath() %>/XiangZhiPic?mem_rank=0&mem_no=${studentsVO.stu_no}" style="margin-top:4px;border-radius:100px;box-shadow:0px 0px 12px #7E7E7E;" />
					</div>
			</div>
</c:forEach>
		</div>
</c:if>
</div>
	
      
</div>
<!-- /.container3 -->
</div>

<!-- Footer -->
	<%@include file="/front_end/include/footer.file" %>
<!-- �̩��h -->
	<%@include file="/front_end/include/floor.file" %>

</body>
	<%@include file="/front_end/include/basicScript2.file" %>
	<%@include file="/front_end/include/onlyForFS.file" %>
</html>