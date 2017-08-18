<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<%@ page import="com.members.model.*" %>
<%@ page import="com.coaches.model.*" %>
<%@ page import="com.students.model.*" %>
<%@ page import="com.gyms.model.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-cn-en">

<head>
	<title>�o�O���D</title>
		<%@include file="include/basicScript.file" %>
</head>


<body>

    <!-- �����C -->
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
            	<img class="logo" src="<%= request.getContextPath() %>/style/images/logo.gif">
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li class="navbar_icon">
                        <a href="index.jsp">����</a>
                    </li>
                    <input type="hidden" id="rankColor" value="${user.mem_rank }">

                     <li class="dropdown navbar_icon">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">�A�Ȥ��� <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="about.jsp">����ڭ�</a>
                            </li>
                            <li>
                                <a href="#">���i����</a>
                            </li>
                            <li>
                                <a href="knowledges.jsp">��������</a>
                            </li>
                            <li>
                                <a href="find_coaches.jsp">��нm</a>
                            </li>
                            <li>
                                <a href="find_pleaces.jsp">����a</a>
                            </li>
                            <li>
                                <a href="find_courses.jsp">��ҵ{</a>
                            </li>
                        </ul>
                    </li>
                            
                    <li class="navbar_icon">
                        <a href="#">�Q�ױM��</a>
                    </li>
                    <li class="navbar_icon">
                        <a href="#">�����M��</a>
                    </li>
                   
                    <li class="dropdown navbar_icon">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">�ȪA�M�� <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li class="navbar_icon">
                                <a href="faq.jsp">�`�����D</a>
                            </li>
                            <li class="navbar_icon">
                                <a href="contact.jsp">�p���ڭ�</a>
                            </li>
                        </ul>
                    </li>
     
<!-- �������X�ȮɡA��� -->                    
<c:if test="${empty user.mem_rank }">
					<!-- �ӤH�Ŷ� -->
                    <li class="dropdown navbar_icon">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">�|���M�� <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="login.jsp">�Х��n�J�|��!</a>
                            </li>
                        </ul>
                    </li>
                </ul>
				
				<!-- -�n�J���U -->
                <ul class="nav navbar-nav navbar-right">
                    <li class="navbar_icon"><a href="login.jsp"><span class="glyphicon glyphicon-user"></span> ���U</a></li>
                    <li class="navbar_icon"><a href="login.jsp"><span class="glyphicon glyphicon-log-in"></span> �n�J</a></li>
                </ul>
</c:if>

<!-- �����������̮ɡA��� -->                    
<c:if test="${user.mem_rank == '0'}">
					<!-- �ӤH�Ŷ� -->
					<li class="dropdown navbar_icon">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">�ӤH�Ŷ� <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="personal.jsp">�򥻸��</a>
                            </li>
                            <li>
                                <a href="#">��ï</a>
                            </li>
                            <li>
                                <a href="#">��ƾ�</a>
                            </li>
                            <li>
                                <a href="#">�ڪ�����</a>
                            </li>
                            <li>
                                <a href="#">�T��</a>
                            </li>
                        </ul>
                    </li>
                    
                    <!-- �ҵ{�޲z -->
                    <li class="dropdown navbar_icon">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">�ҵ{�޲z <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="#">��ҰO���d��</a>
                            </li>
                            <li>
                                <a href="#">�а��ӽ�</a>
                            </li>
                            <li>
                                <a href="#">�ҵ{�^�X</a>
                            </li>
                            <li>
                                <a href="#">�ҵ{���|</a>
                            </li>
                            <li>
                                <a href="#">�����нm</a>
                            </li>
                        </ul>
                    </li>
                </ul>
				
				<!-- �n�X -->
                <ul class="nav navbar-nav navbar-right">
                    <li class="navbar_icon">
                    	<a href="#">
                    		<span class="glyphicon glyphicon-user"></span>
                    	 	${user.mem_nickname}&nbsp�ǭ��A�A�n
                    	</a>
                    </li>
                    <li class="navbar_icon">
                    		<form method="post" action="<%= request.getContextPath() %>/StudentsServlet">
                    			<span class="glyphicon glyphicon-log-out"></span>
                    			<input type="hidden" name="action" value="logout">
                    			<input type="submit" value="�n�X">
                    		</form>
                    </li>
                </ul>
</c:if>

<!-- �������нm�ɡA��� -->                    
<c:if test="${user.mem_rank == '1'}" var="identity"> 
                    <!-- �ӤH�Ŷ� -->
					<li class="dropdown navbar_icon">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">�ӤH�Ŷ� <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="personal.jsp">�򥻸��</a>
                            </li>
                            <li>
                                <a href="#">��ï</a>
                            </li>
                            <li>
                                <a href="#">��ƾ�</a>
                            </li>
                            <li>
                                <a href="#">�ڪ�����</a>
                            </li>
                            <li>
                                <a href="#">�d���O</a>
                            </li>
                            <li>
                                <a href="#">�T��</a>
                            </li>
                        </ul>
                    </li>
                    
                    <!-- �ҵ{�޲z -->
                    <li class="dropdown navbar_icon">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">�ҵ{�޲z <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="#">�ҵ{�W/�U�[</a>
                            </li>
                            <li>
                                <a href="#">�ҵ{�����d��</a>
                            </li>
                            <li>
                                <a href="#">�ҵ{����d��</a>
                            </li>
                            <li>
                                <a href="#">�ҵ{Q&A</a>
                            </li>
                            <li>
                                <a href="#">�}�ҳq��</a>
                            </li>
                            <li>
                                <a href="#">���|�ǭ�</a>
                            </li>
                        </ul>
                    </li>
                    
                    <!-- �����޲z -->
                    <li class="dropdown navbar_icon">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">�����޲z <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="#">�����W/�U�[</a>
                            </li>
                            <li>
                                <a href="#">�����޲z</a>
                            </li>
                            <li>
                                <a href="#">��������d��</a>
                            </li>
                        </ul>
                    </li>
                    
                    <!-- �s�i�ӽ� -->
                    <li>
                        <a href="#">�s�i�ӽ�</a>
                    </li>
                    
                    <!-- ���a���� -->
                    <li class="dropdown navbar_icon">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">���a���� <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="#">�I�q��</a>
                            </li>
                            <li>
                                <a href="#">�I����</a>
                            </li>
                            <li>
                                <a href="#">���|���a</a>
                            </li>
                        </ul>
                    </li>
                </ul>

                <!-- �n�X -->
                <ul class="nav navbar-nav navbar-right">
                    <li class="navbar_icon">
                    	<a href="#">
                    		<span class="glyphicon glyphicon-user"></span>
                    	 	${user.mem_nickname}&nbsp�нm�A�A�n
                    	</a>
                    </li>
                    <li class="navbar_icon">
                    		<form method="post" action="<%= request.getContextPath() %>/CoachesServlet">
                    			<span class="glyphicon glyphicon-log-out"></span>
                    			<input type="hidden" name="action" value="logout">
                    			<input type="submit" value="�n�X">
                    		</form>
                    </li>
                </ul>
</c:if>

<!-- �����������з~�̮ɡA��� -->                    
<c:if test="${user.mem_rank == '2'}" var="identity"> 
					<!-- �ӤH�Ŷ� -->
					<li class="dropdown navbar_icon">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">�ӤH�Ŷ� <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="personal.jsp">�򥻸��</a>
                            </li>
                            <li>
                                <a href="#">��ï</a>
                            </li>
                            <li>
                                <a href="#">��ƾ�</a>
                            </li>
                            <li>
                                <a href="#">�d���O</a>
                            </li>
                            <li>
                                <a href="#">�T��</a>
                            </li>
                        </ul>
                    </li>
                    
                    <!-- �s�i�ӽ� -->
                    <li>
                        <a href="#">�s�i�ӽ�</a>
                    </li>
                    
                    <!-- ���ɺ޲z -->
                    <li class="dropdown navbar_icon">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">���ɺ޲z <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="#">�ӽЪ̺޲z</a>
                            </li>
                            <li>
                                <a href="#">���a�W/�U�[</a>
                            </li>
                            <li>
                                <a href="#">���ɬ����d��</a>
                            </li>
                            <li>
                                <a href="#">���ɳ���d��</a>
                            </li>
                            <li>
                                <a href="#">���|�нm</a>
                            </li>
                        </ul>
                    </li>
                </ul>
				
				<!-- �n�X -->
                <ul class="nav navbar-nav navbar-right">
                    <li class="navbar_icon">
                    	<a href="#">
                    		<span class="glyphicon glyphicon-user"></span>
                    	 	${user.mem_nickname}&nbsp�����з~�̡A�A�n
                    	</a>
                    </li>
                    <li class="navbar_icon">
                    		<form method="post" action="<%= request.getContextPath() %>/GymsServlet">
                    			<span class="glyphicon glyphicon-log-out"></span>
                    			<input type="hidden" name="action" value="logout">
                    			<input type="submit" value="�n�X">
                    		</form>
                    </li>
                </ul>
</c:if>

            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>

    <!-- Page Content -->
    <div class="container">
        
        <!-- Page Heading/Breadcrumbs -->
        <div class="breadcrumbs" id="breadcrumbs">
            <script type="text/javascript">
                try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
            </script>
            
            <div class="col-lg-12">
                <h1>��ҵ{
                    <small>Courses</small>
                </h1>
            </div>

            <ul class="breadcrumb">
                <li>
                    <i class="icon-home home-icon"></i>
                        <a href="#">����</a>
                     </li>
                <li class="active">�A�Ȥ���</li>
                <li class="active">��ҵ{</li>
            </ul><!-- .breadcrumb -->
        </div>
        <br>
        

            <div class="col-lg-12">
                <div class="row">

                    <div class="col-lg-2">
                            <select class="form-control" id="form-field-select-1">
                                <option value="">1.��ܦa��</option>
                                <option value="">�x�_</option>
                                <option value="">�x��</option>
                                <option value="">����</option>                   
                            </select>
                    </div>

                    <div class="col-lg-2">
                            <select class="form-control" id="">
                                <option value="">2.��ܤ���</option>
                                <option value="">�U�ذ�</option>
                                <option value="">���s��</option>
                                <option value="">�H�q��</option>                
                            </select>
                    </div>

                    <div class="col-lg-2">
                            <select class="form-control" id="">
                                <option value="">3.��ܺ���</option>
                                <option value="">���V</option>
                                <option value="">����</option>
                                <option value="">����</option>                
                            </select>
                    </div>

                    <div class="col-lg-2">
                            <select class="form-control" id="">
                                <option value="">4.��ܮɬq</option>
                                <option value="">�W��</option>
                                <option value="">�U��</option>
                                <option value="">�ߤW</option>                
                            </select>
                    </div>

                    <div class="col-lg-2">
                        <button class="btn btn-info">�d�ݵ��G</button>
                    </div>

                    <div class="col-lg-2">
                        <button class="btn btn-default">���m����</button>
                    </div>

                </div>
            </div>

            
            <br><br><br>
            <!--table�}�l-->
            <div class="col-lg-12">
                <div class="row">
                    <div class="col-xs-12 col-sm-12">
                        <div class="table-responsive">
                            <table id="sample-table-1" class="table table-striped">
                                <thead class="aaa">
                                    <tr>
                                        <th class="center">�Ϥ�</th>
                                        <th>���]</th>
                                        <th>�ҵ{�W��&�ɬq</th>
                                        <th>����</th>
                                        <th>�w�w���s</th>
                                     </tr>
                                </thead>

                                <tbody>

                                    <tr>
                                        <td class="center"><span class="label label-xs label-warning arrowed-in">���i</span></td>
                                        <td><a href="#">�����u�tXX��</a></td>
                                        <td>�}�߼֬��A17����</td>
                                        <td>$4,500</td>
                                        <td><button class="btn btn-inverse">�w�w</button></td>
                                    </tr>

                                    <tr>
                                        <td class="center"><span class="label label-xs label-success arrowed-in">���i</span></td>
                                        <td><a href="#">�����u�tXX��</a></td>
                                        <td>������/�L�D</td>
                                        <td>$900</td>
                                        <td><button class="btn btn-inverse">�w�w</button></td>
                                    </tr>

                                 </tbody>
                                
                            </table>
                        </div><!-- /.table-responsive -->
                    </div><!-- /col-sm-12 -->
                </div><!-- /row -->
            </div>
            <!--table����-->
        

        <hr>

        <!-- Footer -->
        <footer>
            <div class="row">
                <div class="col-lg-12">
                    <p>Copyright &copy; Your Website 2014</p>
                </div>
            </div>
        </footer>

    </div>
    <!-- /.container -->

</body>

<!--���s���͹�ܮ�-->
<script type="text/javascript">
    jQuery(function($) {
        $('[data-rel=tooltip]').tooltip();
    });
</script>

<!--navbar�H�J-->
<script type="text/javascript">
	$(document).ready(function() {
		$("li.navbar_icon").fadeIn(1000);
	});
</script>

<!--�U�Ԧ����ư� -->
<script type="text/javascript">
$(document).ready(function() {
	$("li.navbar_icon").on('click', function () {
		$.each($("li.navbar_icon"),function(){
			$(this).children("ul.dropdown-menu")
			.slideUp('fast');
		});
		$(this).children("ul.dropdown-menu")
		.slideToggle('fast');
	});
});

</script>

<!-- �нm�Ʀ�]�S�� ������ 
<scriput type="text/javascript">
$(document).ready(function() {
	$(window).scroll(function() {
		$('div.item-container').slideDown('slow');
	});
});
</scriput>
-->

<script>
function init(){
	<!-- �����������̮ɡAnavbar�C�� -->
	if(document.getElementById("rankColor").value == 0){  	
		$("nav.navbar").css("background-color", "#87B87F");
	}
	<!-- �������нm�ɡAnavbar�C�� -->
	if(document.getElementById("rankColor").value == 1){
		$("nav.navbar").css("background-color", "#FFB752");
	}
	<!-- �����������з~�̮ɡAnavbar�C�� -->
	if(document.getElementById("rankColor").value == 2){
		$("nav.navbar").css("background-color", "#6FB3E0");
	}
	if(document.getElementById("rankColor").value == ''){
		$("nav.navbar").css("background-color", "#303030");
	}
}
	window.onload = init();
</script>

</html>