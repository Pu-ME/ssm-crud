<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

<title>员工列表</title>
</head>
<body>
	<form action="" method="POST">
		<input type="hidden" name="_method" value="DELETE" />
	</form>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h1>SSM-CRUD</h1>
			</div>
		</div>
		<div class="row">
			<div class="col-md-3 col-md-offset-9">
				<a href="${pageContext.request.contextPath }/addOrUpdatePage">
					<button class="btn btn-primary">
						<span class="glyphicon glyphicon-pencil"></span> 添加
					</button>
				</a>
				<button class="btn btn-danger " id="emp_delete_all_btn">
					<span class="glyphicon glyphicon-trash"></span>删除
				</button>
			</div>
		</div>
		<div class="row">
			<table class="table table-hover">
				<tr>
					<th>
						<input type="checkbox" id="check_all"/>
					</th>
					<th>id</th>
					<th>empName</th>
					<th>gender</th>
					<th>email</th>
					<th>deptName</th>
					<th>操作</th>
				</tr>
				<c:forEach items="${pageInfo.list }" var="emp">
					<tr>
						<td>
						<input type="checkbox" class="check_item"/>
						</td>
						<td>${emp.empId }</td>
						<td>${emp.empName }</td>
						<td>${emp.gender =="m" ? "男" :"女" }</td>
						<td>${emp.email }</td>
						<td>${emp.department.deptName }</td>
						<td>
						<a href="${pageContext.request.contextPath }/addOrUpdatePage/${emp.empId }">
							<button class="btn btn-info  btn-sm">编辑</button> 
						</a>
						<a class="delete" href="${pageContext.request.contextPath }/emp/${emp.empId }">
								<button class="btn btn-danger  btn-sm">删除</button>
						</a>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div class="row">
			<div class="col-md-6">当前页码：${pageInfo.pageNum }
				,总页码：${pageInfo.pages }, 总记录：${pageInfo.total }</div>
			<div class="col-md-6">
				<nav aria-label="Page navigation">
				<ul class="pagination">
					<li><a href="${pageContext.request.contextPath }/emps?pn=1">首页</a>
					</li>
					<c:if test="${pageInfo.hasPreviousPage }">
						<li><a
							href="${pageContext.request.contextPath }/emps?pn=${pageInfo.pageNum-1 }"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a></li>
					</c:if>
					<c:forEach items="${pageInfo.navigatepageNums }" var="page_Num">
						<c:if test="${page_Num == pageInfo.pageNum }">
							<li class="active"><a
								href="${pageContext.request.contextPath }/emps?pn=${page_Num}">${page_Num }</a>
							</li>
						</c:if>
						<c:if test="${page_Num != pageInfo.pageNum}">
							<li><a
								href="${pageContext.request.contextPath }/emps?pn=${page_Num}">${page_Num }</a>
							</li>
						</c:if>
					</c:forEach>
					<c:if test="${pageInfo.hasNextPage }">
						<li><a
							href="${pageContext.request.contextPath }/emps?pn=${pageInfo.pageNum+1 }"
							aria-label="Next"> <span aria-hidden="true">&raquo;</span>
						</a></li>
					</c:if>
					<li><a
						href="${pageContext.request.contextPath }/emps?pn=${pageInfo.pages}">尾页</a></li>
				</ul>
				</nav>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	  	$(function(){
	        $(".delete").click(function(){
	            var href = $(this).attr("href");
	            $("form").attr("action", href).submit();
	            return false;
	        });
	    })
	    $("#check_all").click(function(){
	    	$(".check_item").prop("checked",$(this).prop("checked"))
	    });
	  	$(document).on("click",".check_item",function(){
			var flag = $(".check_item:checked").length==$(".check_item").length;
			$("#check_all").prop("checked",flag);
		});
	  	$("#emp_delete_all_btn").click(function(){
	  		var empNames = "";
			var del_idstr = "";
			$.each($(".check_item:checked"),function(){
				//this
				empNames += $(this).parents("tr").find("td:eq(2)").text()+",";
				//组装id字符串
				del_idstr += $(this).parents("tr").find("td:eq(1)").text()+"-";
			});
			//去除empNames多余的,
			empNames = empNames.substring(0, empNames.length-1);
			//去除删除的id多余的-
			del_idstr = del_idstr.substring(0, del_idstr.length-1);
			if(confirm("是否确认删除？")){
				//发送ajax请求删除
				$.ajax({
					url:"${pageContext.request.contextPath }/emp/"+del_idstr,
					type:"DELETE",
					success:function(result){
						location.href="${pageContext.request.contextPath }/emps?pn=1";
					}
				});
			}
	  	});
	</script>
</body>
</html>
