<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<%
 pageContext.setAttribute("APP_PATH",request.getContextPath());
%>
<head>
<meta charset="UTF-8">
<title>员工列表</title>
<link href="${APP_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="${APP_PATH }/static/js/jquery-ui.min.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="${APP_PATH }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
<!-- 搭建显示页面 -->
	<div class="container">
	<!-- 显示标题 -->
		<div class="row">
			<div class="col-md-12">
				<h1>SSM-CRUD</h1>
			</div>
		</div>
		<!-- 按钮 -->
		<div class="row">
			<div class="col-md-4 col-md-offset-8">
				<button class="btn btn-primary">新增</button> 
	 			<button class="btn btn-danger">删除</button>
			</div>
		</div>
		<br>
		<!-- 数据展示 -->
		<div class="row">
			<div class="col-md-12">
				<table class="table table-hover">
  					<tr>
  					  <th >#</th>
					  <th >empName</th>
					  <th >gender</th>
					  <th >email</th>
					  <th >deptId</th>
					  <th >操作</th> 
					</tr>
					<c:forEach items="${pageInfo.list}" var="emp">
						<tr>
	  					  <th >${emp.empId }</th>
						  <th >${emp.empName }</th>
						  <th >${emp.gender=="M"?男:"女" }</th>
						  <th >${emp.email }</th>
						  <th >${emp.department.deptName }</th>
						  <th >
						  	<button class="btn btn-primary btn-xs">
						  	编辑
						  	 <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
						  	</button> 
		 					<button class="btn btn-danger btn-xs">
		 					删除
		 					<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
		 					</button>
						  </th> 
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
		<!-- 分页信息 -->
		<div class="row">
			<div class="col-md-6 ">
				第${pageInfo.getPageNum() }页，共${pageInfo.getPages() }页，共${pageInfo.getTotal() }条记录
			</div>
			<div class="col-md-6 ">
			
				<nav aria-label="Page navigation">
				  <ul class="pagination">
				  <c:if test="${ pageInfo.pageNum!=1}">
				  	 <li><a href="${APP_PATH }/emps?pn=${1}">首页</a></li>
				  </c:if>
				    <c:if test="${pageInfo.hasPreviousPage }">
				    <li>
					      <a href="${APP_PATH }/emps?pn=${pageInfo.pageNum-1 }" aria-label="Previous">
					        <span aria-hidden="true">&laquo;</span>
					      </a>
					  </li>
				    </c:if>
				    <c:forEach items="${pageInfo.navigatepageNums}" var="pagenum">
				   		<c:if test="${pagenum==pageInfo.pageNum }">
				   		 	<li class="active"><a href="${APP_PATH }/emps?pn=${pagenum }">${pagenum }</a></li>
				   		 </c:if>
				   		 <c:if test="${pagenum!=pageInfo.pageNum }">
				   		 	<li ><a href="${APP_PATH }/emps?pn=${pagenum }">${pagenum }</a></li>
				   		 </c:if>
				    </c:forEach>
				    <c:if test="${pageInfo.hasNextPage }">
					     <li>
					     <a href="${APP_PATH }/emps?pn=${pageInfo.pageNum+1 }" aria-label="Next">
					        <span aria-hidden="true">&raquo;</span>
					      </a>
					      </li>
				    </c:if>
				    <c:if test="${ pageInfo.pageNum!=pageInfo.getPages()}">
				    	<li><a href="${APP_PATH }/emps?pn=${pageInfo.getPages() }">尾页</a></li>
				    </c:if>
				  </ul>
				</nav>
			</div>
	</div>
	</div>
</body>
</html>