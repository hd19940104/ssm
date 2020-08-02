<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

	<link rel="stylesheet" href="${APP_PATH }/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="${APP_PATH }/css/font-awesome.min.css">
	<link rel="stylesheet" href="${APP_PATH }/css/main.css">
	<link rel="stylesheet" href="${APP_PATH }/css/doc.min.css">
	<style>
	.tree li {
        list-style-type: none;
		cursor:pointer;
	}
	</style>
  </head>

  <body>

<%@include file="/WEB-INF/jsp/common/userinfo.jsp"%>

    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
				<%@include file="/WEB-INF/jsp/common/userinfo_right.jsp"%>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<ol class="breadcrumb">
				  <li><a href="${APP_PATH }/main">首页</a></li>
				  <li><a href="${APP_PATH }/goodsCategory/index">数据列表</a></li>
				  <li class="active">修改</li>
				</ol>
			<div class="panel panel-default">
              <div class="panel-heading">表单数据<div style="float:right;cursor:pointer;" data-toggle="modal" data-target="#myModal"><i class="glyphicon glyphicon-question-sign"></i></div></div>
			  <div class="panel-body">
				<form role="form" id="dataForm">
				 <div class="form-group">
					
					<input type="hidden" class="form-control" value="${goodsCategory.id }" id="gcid">
				  </div>
				  <div class="form-group">
					<label for="gcname">商品名称</label>
					<input type="text" class="form-control" value="${goodsCategory.name }" id="gcname" placeholder="请输入商品名称">
				  </div>
				  <div class="form-group">
					<label for="remark">商品说明</label>
					<input type="text" class="form-control" value="${goodsCategory.remark }" id="remark" placeholder="请输入商品说明">
				  </div>
				   <div class="form-group">
					<label for="orderid">商品排序号</label>
					<select  class="form-control"  id="orderid" >
						<option value="1" >1</option>
						<option value="2" >2</option>
						<option value="3" >3</option>
						<option value="4" >4</option>
						<option value="5" >5</option>
					</select>
				  </div>
				 <!--  <div class="form-group">
					<label for="exampleInputEmail1">邮箱地址</label>
					<input type="email" class="form-control" id="exampleInputEmail1" placeholder="请输入邮箱地址">
					<p class="help-block label label-warning">请输入合法的邮箱地址, 格式为： xxxx@xxxx.com</p>
				  </div> -->
				  <button type="button" class="btn btn-success" id="updateBtn"><i class="glyphicon glyphicon-pencil"></i> 修改</button>
				  <button type="button" class="btn btn-danger" id=regBtn><i class="glyphicon glyphicon-refresh"></i> 重置</button>
				</form>
			  </div>
			</div>
        </div>
      </div>
    </div>
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
		<div class="modal-content">
		  <div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
			<h4 class="modal-title" id="myModalLabel">帮助</h4>
		  </div>
		  <div class="modal-body">
			<div class="bs-callout bs-callout-info">
				<h4>测试标题1</h4>
				<p>测试内容1，测试内容1，测试内容1，测试内容1，测试内容1，测试内容1</p>
			  </div>
			<div class="bs-callout bs-callout-info">
				<h4>测试标题2</h4>
				<p>测试内容2，测试内容2，测试内容2，测试内容2，测试内容2，测试内容2</p>
			  </div>
		  </div>
		  <!--
		  <div class="modal-footer">
			<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			<button type="button" class="btn btn-primary">Save changes</button>
		  </div>
		  -->
		</div>
	  </div>
	</div>
    <script src="${APP_PATH }/jquery/jquery-2.1.1.min.js"></script>
    <script src="${APP_PATH }/bootstrap/js/bootstrap.min.js"></script>
	<script src="${APP_PATH }/script/docs.min.js"></script>
	<script src="${APP_PATH }/layer/layer.js"></script>
        <script type="text/javascript">
        $(function(){
    		
    		$(".list-group-item").addClass("tree-closed");//先关闭树形结构
    		$("#index-4").removeClass("tree-closed");//打开对于的树形结构
    		$("#index-40").show();//打开对于的树形结构
    		$(".index-color").css("color","");//清除所有的颜色
    		$("#index-46").css("color", "red");//添加对应的颜色
    		
    		
    	});
        $(function(){
    		//判断页面是否登录
    		var user = "${loginUser}";
    		if(user==''){
    			/* layer.msg("请重新登录", {time:1000, icon:6, shift:5}, function(){
				window.location.href="${APP_PATH}/login";
			}); */
			window.location.href="${APP_PATH}/login";
    		}
    		
    	});
            $(function () {
			    $(".list-group-item").click(function(){
				    if ( $(this).find("ul") ) {
						$(this).toggleClass("tree-closed");
						if ( $(this).hasClass("tree-closed") ) {
							$("ul", this).hide("fast");
						} else {
							$("ul", this).show("fast");
						}
					}
				});
			    //回显下拉框
			    $("#orderid").val("${goodsCategory.orderid}");
			    //页面加载完成
			    $("#updateBtn").click(function(){
			    	//校验

					var gcname = $("#gcname").val().trim();
					var remark = $("#remark").val().trim();
					var orderid = $("#orderid").val();
					var id=$("#gcid").val().trim();
					if (gcname == null || gcname == "") {
						layer.msg("商品名称不能为空", {time:1400, icon:0, shift:6}, function(){
							$("#gcname").focus();//设置焦点
						});
						
						
						return;
					} else if (remark == null || remark == "") {
						layer.msg("商品描述不能为空", {time:1400, icon:0, shift:6}, function(){
							$("#remark").focus();//设置焦点
						});
						
						return;
					}else if (orderid == null || orderid == "") {
						layer.msg("商品排序号不能为空", {time:1400, icon:0, shift:6}, function(){
							$("#orderid").focus();//设置焦点
						});
						
						return;
					}
					
					var index=0;
					$.ajax({
						type :"post",
						url:"${APP_PATH }/goodsCategory/updateGood",
						data:{
							"id":id,
							"name":gcname,
							"remark":remark,
							"orderid":orderid
						},
						beforeSend:function(){
							 index = layer.load(2, {time: 10*1000});
							//
						},
						success:function(result){
							layer.close(index);
							if (!result.success) {
								layer.msg("修改失败", {time:2000, icon:5, shift:6}, function(){
									var loginacct = result.map.user.loginacct;
									//回显、清空
									$("#name").val(name);
									$("#remark").val(remark);
									$("#orderid").val(orderid);
								});
							}else{
								layer.msg("修改商品成功", {time:3000, icon:6, shift:5}, function(){});
								window.location.href="${APP_PATH }/goodsCategory/index";
								
							}
						}
					});
					
			    	
			    });
			    
			    //表单重置
			    $("#regBtn").click(function(){
			    	//DOM有reset方法，JQ没有
			    	$("#dataForm")[0].reset();
			    	 $("#orderid").val("${goodsCategory.orderid}");
			    	
			    });
			    
            });
        </script>
  </body>
</html>
