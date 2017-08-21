<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.manager.model.*"%>
<%@ page import="com.members.model.*"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-cn-en">

<head>
<title>���f��x�޲z�t��</title>
<%@include file="/back_end/include/basic_ace_script.file" %>
</head>
<body>
<%@include file="/back_end/include/navbar.file" %>
<%@include file="/back_end/include/sliderBar_breadCrumb.file" %>


	<!-- ���e�q�o�}�l�A�n��̦n�u��o�� -->
	<div class="page-content">
		<div class="page-header">
			<h1>
				���u�b���޲z <small> <i class="icon-double-angle-right"></i> ���u -
					listOneMgr
				</small>
			</h1>
		</div>

<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/mgr/MgrCtrl"
			name="form1" enctype='multipart/form-data'>
			<div class="row">
				<div class="col-md-12 col-md-offset-1 ">

					<div class="col-md-2">
						<div class="input-group">
							<label class="input-group-addon">���u�s��</label> <input type="text"
								name="mgr_no" class="form-control" placeholder="�п�J�s��">
						</div>
					</div>
					<div class="col-md-2">
						<div class="input-group">
							<label class="input-group-addon">���u�m�W</label> <input type="text"
								name="mgr_name" class="form-control" placeholder="�п�J�m�W">
						</div>
					</div>
					<div class="col-md-2">
						<div class="input-group">
							<label class="input-group-addon">¾��</label> <select
								name="mgr_job">
								<option value="">�п��
									<option value="0">�޲z��
											
								<option value="1">�t�κ޲z��
										
							</select>
									</div>
								</div>
								<div class="col-md-2">
									<div class="input-group">
										<label class="input-group-addon">���A</label>
										 <select name="mgr_status">
											<option value="">�п��
											
								<option value="0">�b���_�Τ�
											
								<option value="1">�b���H���v
										
							</select>
									</div>
								</div>
								
								<div class="col-md-2">
									<input type="submit" class="btn btn-info  btn-group-lg"
							value="�d��">
									<input type="hidden" name="action"
							value="listMgr_ByCompositeQuery">
								</div>
								
							</div>
						</div>
					</FORM>


		<div class="row">
			<div class="col-xs-12 col-sm-10 col-sm-offset-1">
				<div class="table-responsive">
					<table id="sample-table-1" class="table table-striped">
						<thead class="aaa">
							<tr>
								<th class="center">�޲z���s��</th>
								<th class="center">�Ӥ�</th>
								<th class="center">�b��</th>
								<th class="center">¾��</th>
								<th class="center">�m�W</th>
								<th class="center">�H�c</th>
								<th class="center">���A</th>
								<th class="center">�ק�</th>
							</tr>
						</thead>

						<tbody>
								<tr>

									<td class="center">${managerVO.mgr_no}</td>

									<td class="center"><img
										src="<%=request.getContextPath()%>/tools/DBGifReader?mgr_no=${managerVO.mgr_no}"
										style="width: 100px; height: 100px;"></td>
									<td class="center">${managerVO.mgr_id}</td>
									<td class="center">${(managerVO.mgr_job==0)?'�޲z��':'�t�κ޲z��'}</td>
									<td class="center">${managerVO.mgr_name}</td>
									<td class="center">${managerVO.mgr_email}</td>
									<td class="center">${(managerVO.mgr_status==0)?'�b¾��':'��¾'}</td>


									<td class="center">
										<FORM METHOD="post"	ACTION="<%=request.getContextPath()%>/mgr/MgrCtrl" enctype='multipart/form-data'>
											<input type="submit" value="�ק�" class="btn btn-inverse">
											<input type="hidden" name="mem_no" value="${managerVO.mem_no}"> 
											<input type="hidden" name="mgr_no" value="${managerVO.mgr_no}"> 
											<input type="hidden" name="action" value="getOne_For_Update">
										</FORM>
									</td>

								</tr>

						</tbody>
					</table>
				</div>
				<!-- /.table-responsive -->
			</div>
			<!-- /col-sm-12 -->
		</div>
		<!-- /row -->

<%@include file="/back_end/include/ace_setting_footer.file"%>
</body>
</html>