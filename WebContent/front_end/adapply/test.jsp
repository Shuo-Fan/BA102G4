<%@ page contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.adapply.model.*"%>
<%@ page import="java.util.*"%>



<!DOCTYPE html>
<html>
<head>
<title>AD_Apply</title>


<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>


<script src="<%=request.getContextPath() %>/style/assets/js/jquery-1.10.2.min.js"></script>
<script src="<%=request.getContextPath() %>/style/assets/js/jquery.colorbox.js"></script>

<link rel="stylesheet" href="<%=request.getContextPath()%>/style/assets/css/colorbox.css"/>

<%-- <script src="<%=request.getContextPath() %>/style/dist/sweetalert.min.js"></script> --%>
<%-- <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/style/dist/sweetalert.css"> --%>

<!-- <script type="Text/JavaScript" -->
<!-- 	src="http://ajax.googleapis.com/ajax/libs/jquery/1.6/jquery.min.js"></script> -->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

</head>

<body>
    
�_�l����G<input type="text" id="start" />
��������G<input type="text" id="end" />
<script type="text/javascript">
$(function(){

	  var today = new Date();
	  var tomorrow = new Date(today.getTime() + 24 * 60 * 60 * 1000);

	  $('#end').datepicker();
	  $('#start').datepicker({
	    //minDate: 0, //�q���ѫ����~�i��
	    minDate: tomorrow, //�q���Ѥ���~�i��
	    onSelect: function (dat, inst) {
	      $('#end').datepicker('option', 'minDate', dat);
	    }
	  });
	});


	$.datepicker.setDefaults({ dateFormat: 'yy-mm-dd' }); //�����]�m����榡
</script>

	<div style='display:none'>
		<div id='inline_content'>
			<div class="demo-container">
        		<div class="card-wrapper">
        		</div>

        		<div class="form-container active" id="aabbcc">
               	 	�d��:<input placeholder="Card number" type="tel" name="number"><br>
               		�W�r:<input placeholder="Full name" type="text" name="name"><br>
               		�~��:<input placeholder="MM/YY" type="tel" name="expiry"><br>
                	CVC:<input placeholder="CVC" type="number" name="cvc">
       		 	</div>
   			 </div>
		</div>
	</div>
	
	
	<button>Show lightbox</button>
	
	
<div class="container">
	<div class="row">
		<div  class="col-xs-12 col-sm-6 col-sm-offset-2">
			<form class="form-horizontal" method="post" action="<%=request.getContextPath()%>/adapply/AD_ApplyCtrl" name="from1" enctype="multipart/form-data">
				
				
				
				<div class="form-group">
					<label for="ad_name" class="col-xs-12 col-sm-3 control-label">
						�s�i�W��:
					</label>
					<div class="col-xs-12 col-sm-9">
						<input type="text" name="ad_name" id="ad_name"  
							value="${param.ad_name}" placeholder="�п�J�s�i�W��" class="form-control">
							<font color='red'>${errorMsgs.ad_name}</font>
					</div>
				</div>
		
				<div class="form-group">
					<label class="col-xs-12 col-sm-3 control-label">
						�s�i�ԭz:
					</label>
					<div class="col-xs-12 col-sm-9">
						<textarea rows="5"  name="ad_ctx" class="form-control"
							value="${param.ad_ctx}">
						</textarea>
					</div>		
				</div>

				<br> 
		
				<div class="form-group">
					<label class="col-xs-12 col-sm-3 control-label"></label>
					<div class="col-xs-12 col-sm-9">
<!-- 						<input type="hidden" name="action" value="insert">  -->
						<a class='inline' href="#inline_content"><button class="btn btn-primary">ú�O</button></a>
<!-- 						<input type="submit" value="�s�W" id="payMoney"> -->
					</div>
				</div>
		
		
			</form>
		</div>
	</div>
</div>



	<div class="tab-content page" style="background-color:white;">
		<div class="col-md-12"><a class='inline' href="#inline_content"><button class="btn btn-primary">ú�O</button></a></div>
	</div>
	
	 <script src="<%=request.getContextPath()%>/style/card-master/dist/card.js"></script>
	
	<script>
	new Card({
        form: document.querySelector('#aabbcc'),
        container: '.card-wrapper'
//         ,placeholders: {
//         	number: '**** **** **** ****',
//         	name: 'Arya Stark',
//         	expiry: '**/****',
//         	cvc: '***'
//        }
    });
	
$(document).ready(function(){
	$(".inline").colorbox({inline:true,width:"50%"});
});


</script>
	

</body>
	<script>
	$(document).ready(function(){
 $('button').on('click', function(){
  $.colorbox({
   html : '<h1>Hello lightbox!!!</h1>', //�b�O�c���n��ܪ�html�r�q
   width : 700, //�O�c�����϶����e��
   height : 600, //�O�c�����϶�������
   onClosed : function(){ //��O�c�����ɪ�callback funtion
    alert('Lightbox is closed');
   }
  });
 });
})();
	

	</script>
</html>