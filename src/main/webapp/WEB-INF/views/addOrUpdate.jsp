<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 引入jquery -->
<script
	src="${pageContext.request.contextPath }/static/js/jquery-1.12.4.min.js"
	type="text/javascript"></script>
<!-- 引入bootstrap样式 -->
<link
	href="${pageContext.request.contextPath }/static/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" />
<script
	src="${pageContext.request.contextPath }/static/bootstrap/js/bootstrap.min.js"></script>

<title>添加页面</title>
</head>
<body>
	<div class="container">
		<div class="row page-header">
			<h1>EDIT PAGE</h1>
		</div>
		<div class="row">
			<form:form class="form-horizontal"
				action="${pageContext.request.contextPath }/emp"
				modelAttribute="employee" method="post">
				<c:if test="${employee.empId ==null}">

				</c:if>
				<c:if test="${employee.empId !=null}">
					<form:hidden path="empId" />
					<input type="hidden" name="_method" value="PUT" />

				</c:if>
				<div class="form-group">
					<label for="empName" class="col-sm-2 control-label">empName</label>
					<div class="col-sm-6">
						<form:input class="form-control" path="empName" />
					</div>
				</div>

				<div class="form-group">
					<label for="email" class="col-sm-2 control-label">Email</label>
					<div class="col-sm-6">
						<form:input class="form-control" path="email" />
					</div>
				</div>
				<div class="form-group">
					<label for="gender" class="col-sm-2 control-label">Gender</label>
					<div class="col-sm-6">
						<%
							Map<String, String> genders = new HashMap<String, String>();
								genders.put("m", "男");
								genders.put("f", "女");
								request.setAttribute("genders", genders);
						%>
						<form:radiobuttons path="gender" items="${genders }"
							delimiter="&nbsp;&nbsp;" />
					</div>
				</div>
				<div class="form-group">
					<label for="dept" class="col-sm-2 control-label">Dept</label>
					<div class="col-sm-6">
						<form:select class="form-control" path="dId" items="${depts }"
							itemLabel="deptName" itemValue="deptId"></form:select>
					</div>
				</div>

				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<button type="submit" class="btn btn-default">保存</button>
					</div>
				</div>
			</form:form>
		</div>
	</div>
</body>
</html>