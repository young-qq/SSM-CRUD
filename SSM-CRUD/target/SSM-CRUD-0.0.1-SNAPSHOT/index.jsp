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
 <script src="${APP_PATH }/static/js/jquery.min.js"></script>
<link href="${APP_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
   
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="${APP_PATH }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
	<!-- 员工修改模态框Modal -->
	<div class="modal fade" id="empUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">修改信息</h4>
	      </div>
	      <div class="modal-body">
			<form class="form-horizontal">
				  <div class="form-group ">
				    <label for="empName_add_input" class="col-sm-2 control-label">Name</label>
				    <div class="col-sm-10">
			<!-- 	      <input type="text" name="empName" class="form-control" id="empName_update_input" placeholder="Name">
				   		<span class="help-block"></span> -->
				   		<p class="form-control-static" id="empName_update_static"></p>
				    </div>
				    
				  </div>
				  <div class="form-group">
				    <label for="email_add_input" class="col-sm-2 control-label">Email</label>
				    <div class="col-sm-10">
				      <input type="email" name="email" class="form-control" id="eamil_update_input" placeholder="Email">
				    		<span class="help-block"></span>
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="gender_add_input" class="col-sm-2 control-label">gender</label>
				    <div class="col-sm-10">
				      <label class="radio-inline">
					  <input type="radio" name="gender" id="gender1_update_input" value="M" > 男
					</label>
					<label class="radio-inline">
					  <input type="radio" name="gender" id="gender2_update_input" value="F"> 女
					</label>
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="dept_add_input" class="col-sm-2 control-label">Department</label>
				    <div class="col-sm-4">
				      <select class="form-control" name="dId" id="dept_update_select">
						
						</select>
					 </div>
				  </div>
				</form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	        <button type="button" class="btn btn-primary" id="emp_update_btn">更新</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	
	<!-- 员工添加模态框Modal -->
	<div class="modal fade" id="empAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">添加员工</h4>
	      </div>
	      <div class="modal-body">
			<form class="form-horizontal">
				  <div class="form-group ">
				    <label for="empName_add_input" class="col-sm-2 control-label">Name</label>
				    <div class="col-sm-10">
				      <input type="text" name="empName" class="form-control" id="empName_add_input" placeholder="Name">
				   		<span class="help-block"></span>
				    </div>
				    
				  </div>
				  <div class="form-group">
				    <label for="email_add_input" class="col-sm-2 control-label">Email</label>
				    <div class="col-sm-10">
				      <input type="email" name="email" class="form-control" id="eamil_add_input" placeholder="Email">
				    		<span class="help-block"></span>
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="gender_add_input" class="col-sm-2 control-label">gender</label>
				    <div class="col-sm-10">
				      <label class="radio-inline">
					  <input type="radio" name="gender" id="gender1_add_input" value="M" checked="checked"> 男
					</label>
					<label class="radio-inline">
					  <input type="radio" name="gender" id="gender2_add_input" value="F"> 女
					</label>
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="dept_add_input" class="col-sm-2 control-label">Department</label>
				    <div class="col-sm-4">
				      <select class="form-control" name="dId" id="dept_add_select">
						
						</select>
					 </div>
				  </div>
				</form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	        <button type="button" class="btn btn-primary" id="emp_save_btn">保存</button>
	      </div>
	    </div>
	  </div>
	</div>
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
				<button class="btn btn-primary" id="emp_add_modal_btn" >新增</button> 
	 			<button class="btn btn-danger" id="emp_delete_all_btn">删除</button>
			</div>
		</div>
		<br>
		<!-- 数据展示 -->
		<div class="row">
			<div class="col-md-12">
				<table class="table table-hover" id="emps_tables">
				<thead>
  					<tr>
  					 <th> 
  					 	<input type="checkbox" id="check_all">
  					 </th>
  					  <th >#</th>
					  <th >empName</th>
					  <th >gender</th>
					  <th >email</th>
					  <th >deptId</th>
					  <th >操作</th> 
					</tr>
				</thead>
				<tbody id="btn_update_input">
				
				</tbody>
				</table>
			</div>
		</div>
		<!-- 分页信息 -->
		<div class="row">
			<div class="col-md-6 " id="page_info_area">
				
			</div>
			<div class="col-md-6 "id="page_nav_area">
			
			</div>
	</div>
	</div>
	
   <%--  <script src="${APP_PATH }/static/js/jquery-ui.min.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="${APP_PATH }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script> --%>
	<script >
	/* 页面加载完成后，直接发送ajax请求展示数据
	 */
	
	 $(function () {
			ajax_to_page(1);

		});
	 function ajax_to_page(pn) {
		 $("#emps_tables tbody").empty();
			$.ajax({
				url:"${APP_PATH}/emps",
				type:"GET",
				data:"pn="+pn,
				// result是服务器返回结果(InfoDTO对象)
				success:function (result) {
					/*解析员工数据  */
					build_emps_table(result);
					/*解析分页数据  */
					build_page_info(result);
					/*解析分页条数据  */
					build_page_nav(result);
				}
			});
		}
	 function build_emps_table(result) {
		 $("#emps_tables tbody").empty();
		var emps=result.extend.pageInfo.list;
		$.each(emps,function(index,item){
			var checkBoxTd=$("<td><input type='checkbox' class='check_item'/></td>");
			var empIdTD=$("<td></td>").append(item.empId);
			var empNameTD=$("<td></td>").append(item.empName);
			var genderTD=$("<td></td>").append(item.gender=="M"?"男":"女");
			var emailTD=$("<td></td>").append(item.email);
			var deptNameTD=$("<td></td>").append(item.department.deptName);
			/* 
			<button class="btn btn-primary btn-xs">编辑
		  	 <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
		  	</button> */
			var eitdBtn=$("<button></button>").addClass("btn btn-primary btn-xs edit_btn").append("编辑")
						.append($("<span></span>").addClass("glyphicon glyphicon-pencil"));
		  	eitdBtn.attr("edit1_id",item.empId);
			var delBtn=$("<button></button>").addClass("btn btn-danger btn-xs delete_btn").append("删除")
			.append($("<span></span>").addClass("glyphicon glyphicon-trash")); 
			delBtn.attr("delete1_id",item.empId);
			var btnTd=($("<td></td>").append(eitdBtn).append(" ").append(delBtn));
			$("<tr></tr>")
			.append(checkBoxTd)
			.append(empIdTD)
			.append(empNameTD)
			.append(genderTD)
			.append(emailTD)
			.append(deptNameTD).append(btnTd).appendTo("#emps_tables tbody");
		});
	}
	 
	 /*解析分页条信息  */
	 function build_page_nav(result) {
		 $("#page_info_area").empty();
		 $("#page_info_area").append("第"+result.extend.pageInfo.pageNum+"页，","共"+result.extend.pageInfo.pages+"页，","共"+result.extend.pageInfo.total+"条记录");
	 }
	 
		 /*解析分页信息  */
	 function build_page_info(result){
		 $("#page_nav_area").empty();
		 var ul=$("<ul></ul>").addClass("pagination");
		 var firstPageLi=$("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
		 var prePageLi=$("<li></li>").append($("<a></a>").append("&laquo;"));
		 if(result.extend.pageInfo.hasPreviousPage ==false){
			 firstPageLi.addClass("disabled");
			 prePageLi.addClass("disabled");
			}
		 firstPageLi.click(function(){
				ajax_to_page(1);
			});
		 prePageLi.click(function(){
				ajax_to_page(result.extend.pageInfo.pageNum-1);
			});
		 var nextPageLi=$("<li></li>").append($("<a></a>").append("&raquo;").attr("href","#"));
		 var lastPageLi=$("<li></li>").append($("<a></a>").append("尾页").attr("href","#"));
		 if(result.extend.pageInfo.hasNextPage ==false){
			 nextPageLi.addClass("disabled");
			 lastPageLi.addClass("disabled");
			}else{
			nextPageLi.click(function(){
				ajax_to_page(result.extend.pageInfo.pageNum+1);
			});
		 lastPageLi.click(function(){
				ajax_to_page(result.extend.pageInfo.pages);
			});
		}
		 currentPage=result.extend.pageInfo.pageNum;
		 ul.append(firstPageLi).append(prePageLi);
		 $.each(result.extend.pageInfo.navigatepageNums,function(index,item){
		var numLi=$("<li></li>").append($("<a></a>").append(item));
		if(result.extend.pageInfo.pageNum==item){
			numLi.addClass("active");
		}
		numLi.click(function(){
			ajax_to_page(item);
		});
		ul.append(numLi);
	});
		ul.append(nextPageLi).append(lastPageLi).appendTo("#page_nav_area");
		/* var navEle=$("<nav></nav>").append(ul);
		navEle.appendTo("#page_nav_area"); */
		}
		 
		 $("#emp_add_modal_btn").click(function () {
			//清楚表单数据
			 $("#empAddModal form")[0].reset();
			
		        //发送ajax请求，查出部门信息，显示在下拉列表中
		        getDepts("#dept_add_select");
			$("#empAddModal").modal({
				backdrop:"static"
			});
		});
		/* 查出所有的部门信息并显示到下拉列表中 */
		function getDepts(ele) {
			$(ele).empty();
			 $.ajax({
					url:"${APP_PATH}/depts",
					type:"GET",
					success:function(result){
						$.each(result.extend.depts,function(){
							var optionEle=$("<option></option>").append(this.deptName).attr("value",this.deptId);
							optionEle.appendTo(ele);
						});
						
					}
			 });
		}
		//校验表单数据
		function validate_add_form(){
			//1拿到校验的数据
		var empName=$("#empName_add_input").val();
		var regName=/[\u4e00-\u9fa5_a-zA-Z0-9_]{2,10}/;
		if(!regName.test(empName)){
			$("#empName_add_input").parent().addClass("has-error");
			$("#empName_add_input").next("span").text("用户名错误");
			return false;
		}
		else{
			$("#empName_add_input").next("span").text("");
			$("#empName_add_input").parent().removeClass("has-error").addClass("has-success");
			
		}
		//校验邮箱信息
		var email=$("#eamil_add_input").val();
		var regEmail=/^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/;
		if(!regEmail.test(email)){
			$("#eamil_add_input").parent().addClass("has-error");
			$("#eamil_add_input").next("span").text("邮箱格式错误");
				return false;
			}else{
				$("#eamil_add_input").next("span").text("");
				$("#eamil_add_input").parent().removeClass("has-error").addClass("has-success");
				
			}
		return true;
			
		}
		
		$("#empName_add_input").change(function() {
			//发送ajax请求校验用户名是否存在
			var empName=this.value;
			 $.ajax({
		        	url:"${APP_PATH}/checkuser",
		        	data:"empName="+empName,
		        	type:"POST",
		        	success:function(result){
		        		if(result.code==100){
		        			 $("#emp_save_btn").attr("ajax_va","success");
		        		}
		        		else{
		        			$("#emp_save_btn").attr("ajax_va","error");
		        			alert("用户名不可用")
		        		}
		        	}
			 });
		});
		 $("#emp_save_btn").click(function () {
				
		        //发送ajax请求，保存信息
		    //对数据进行校验
		    if(!validate_add_form()){
		    	return false;
		    };
		    if($(this).attr("ajax_va")=="error"){
		    	return false;
		    };
		        $.ajax({
		        	url:"${APP_PATH}/emp",
		        	type:"POST",
		        	data: $("#empAddModal form").serialize(),
		        	success:function(result){
		        		if(result.code==100){
		        			$('#empAddModal').modal('hide');
			        		ajax_to_page(100000);
		        		}
		        		else{
		        			alert(result)
		        		}
		        		
		        	}
		        });
		        
		     
		});
		 $(document).on("click",".edit_btn",function(){
			 //1、查出员工信息显示员工信息
			 getEmp($(this).attr("edit1_id"));
			 $("#emp_update_btn").attr("edit1-id",$(this).attr("edit1_id"));
			 //2、查出部门信息，显示部门信息
			 
			 getDepts("#dept_update_select");
			 $("#empUpdateModal").modal({
					backdrop:"static"
				});
		 });
		 
		 function getEmp(id){
			 $.ajax({
				 	url:"${APP_PATH}/emp/"+id,
		        	type:"GET",
				 	success:function(result){
				 		var empData=result.extend.emp
				 		$("#empName_update_static").text(empData.empName);
				 		$("#eamil_update_input").val(empData.email);
				 		if(empData.gender=="M"){
				 			$("#gender1_update_input").val([empData.gender]);
				 		}else{
				 			$("#gender2_update_input").val([empData.gender])
				 		}
				 		$("#empUpdateModal select").val([empData.dId]);
				 	}
			 });
		 }
		 
		 //点击更新员工信息
		$("#emp_update_btn").click(function(){
			//1、验证邮箱是否合法
			var regEmail=/^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/;
			var email=$("#eamil_update_input").val();
			if(!regEmail.test(email)){
				$("#eamil_update_input").parent().addClass("has-error");
				$("#eamil_update_input").next("span").text("邮箱格式错误");
					return false;
				}else{
					$("#eamil_update_input").next("span").text("");
					$("#eamil_update_input").parent().removeClass("has-error").addClass("has-success");
					
				}
			//2、发送ajax请求保存更新的数据
			$.ajax({
				url:"${APP_PATH}/emp/"+$(this).attr("edit1-id"),
	        	type:"PUT",
	        	data: $("#empUpdateModal form").serialize(),
			 	success:function(result){
			 		//关闭模态框
			 		$('#empUpdateModal').modal('hide');
	        		ajax_to_page(currentPage);
				
			 		//回到页面
			 	}
			});
		});
		 $(document).on("click",".delete_btn",function(){
			//删除的员工姓名
			 var empName=$(this).parents("tr").find("td:eq(2)").text();
			if(confirm("确认删除【"+empName+"】吗?")){
			 	$.ajax({
					url:"${APP_PATH}/emp/"+$(this).attr("delete1_id"),
		        	type:"DELETE",
				 	success:function(result){
				 		//关闭模态框
				 		alert("删除成功");
				 		ajax_to_page(currentPage);
				 		//回到页面
				 	}
				});
				
			}
		
		 });
		 //完成全选，全不选的功能
		 $("#check_all").click(function(){
			 
			 $(".check_item").prop("checked",$(this).prop("checked"));
		 });
		 
		 $(document).on("click",".check_item",function(){
			 var flag=($(".check_item:checked").length==$(".check_item").length);
				 $("#check_all").prop("checked",flag);
			 
			 
		 });
		 //批量删除
		 $("#emp_delete_all_btn").click(function(){
			 name_list="";
			 id_list="";
			 $.each($(".check_item:checked"),function(){
				 var empName=$(this).parents("tr").find("td:eq(2)").text();
				 var empId=$(this).parents("tr").find("td:eq(1)").text();
				 /* alert(empName); */
				 id_list+=empId+"-";
				 name_list+=empName+",";
						
					
		 } );
			 name_list=name_list.substring(0,name_list.length-1);
			 id_list=id_list.substring(0,id_list.length-1);
			 /* alert(id_list); */
			 if(confirm("确认删除【"+name_list+"】吗?")){
				 	$.ajax({
						url:"${APP_PATH}/emp/"+id_list,
			        	type:"DELETE",
					 	success:function(result){
					 		//关闭模态框
					 		alert("删除成功");
					 		ajax_to_page(currentPage);
					 		//回到页面
					 	}
					});
			 }
			 
		 });
			
		
	</script>
</body>
</html>