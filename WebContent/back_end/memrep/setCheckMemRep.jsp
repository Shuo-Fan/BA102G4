<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.membersreport.model.*"%>


<%
	MembersReportService MRSvc = new MembersReportService();
	Set<MembersReportVO> list = MRSvc.getStat(0);
	pageContext.setAttribute("list", list);
%>
<jsp:useBean id="ADapplyMemSvc" scope="page"
	class="com.members.model.MembersService" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-cn-en">
<head>
<title>���f��x�޲z�t��</title>

<%@include file="/back_end/include/basic_ace_script.file"%>
</head>
<body>
	<%@include file="/back_end/include/navbar.file"%>
	<%@include file="/back_end/include/sliderBar_breadCrumb.file"%>
	<div class="page-content">
		<div class="page-header">
			<h1>
				���|�޲z<small> <i class="icon-double-angle-right"></i> �|�����|_���f��
					- setCheckMemRep
				</small>
			</h1>
		</div>
		<!-- /.page-header -->


		<c:if test="${not empty errorMsgs}">
			<font color='red'>�ЭץH�U���~:
				<ul>
					<c:forEach var="message" items="${errorMsgs}">
						<li>${message}</li>
					</c:forEach>
				</ul>
			</font>
		</c:if>

		<div class="row">
			<div class="col-xs-12 col-sm-10 col-sm-offset-1">
				<div class="table-responsive">
					<table id="sample-table-1" class="table table-striped">
						<thead class="aaa">
							<tr>
								<!-- 			<th>���|�s��</th> -->
								<th class="center">���|�ɶ�</th>
								<th class="center">�Q���|��</th>
								<th class="center">��]</th>
								<th class="center">���|��</th>
								<th class="center">�Q���|���e</th>
								<!-- 			<th>�Ӥ�</th> -->
								<th class="center">���A</th>
								<th class="center">�֭�</th>
								<th class="center">��^</th>
							</tr>
						</thead>
						<tbody>
							<%@ include file="page1.file"%>
							<c:forEach var="membersReportVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
								<tr align="center" valign="middle">
<%-- 									<td>${membersReportVO.mr_no}</td> --%>
									<td class="center">${membersReportVO.mr_time}</td>
									<td class="center">${membersReportVO.mr_def}</td>
									<td class="center">${membersReportVO.mr_ctx}</td>
									<td class="center">${membersReportVO.mr_pro}</td>
									<td class="center">${membersReportVO.ref_ctx}</td>
									<!-- 				<td><img -->
									<%-- 					src="<%=request.getContextPath()%>/tools/DBGifReader?mr_no=${membersReportVO.mr_no}" --%>
									<!-- 					style="width: 100px; height: 100px;"></td> -->
									<td class="center">${membersReportVO.mr_stat == 0 ?'���f��':'���f��'}</td>
									<td class="center">
										<form method="post"
											action="<%=request.getContextPath()%>/memrep/MemRepCtrl">
											<input type="submit" value="�֭�"> <input type="hidden"
												name="mr_no" value="${membersReportVO.mr_no}"> <input
												type="hidden" name="mr_def"
												value="${membersReportVO.mr_def}"> <input
												type="hidden" name="action" value="Report">
										</form>
									</td>

									<td class="center"><form method="post"
											action="<%=request.getContextPath()%>/memrep/MemRepCtrl">
											<input type="submit" value="��^"> <input type="hidden"
												name="mr_no" value="${membersReportVO.mr_no}"> <input
												type="hidden" name="action" value="NO_Report">
										</form>
									</td>
								</tr>
							</c:forEach>
						<%@ include file="page2.file"%>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
<%@include file="/back_end/include/ace_setting_footer.file"%>
	
</body>
</html>