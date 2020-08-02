<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="keys" content="">
<meta name="author" content="">
<link rel="stylesheet" href="${APP_PATH }/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${APP_PATH }/css/font-awesome.min.css">
<link rel="stylesheet" href="${APP_PATH }/css/login.css">
<style>
</style>
</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
	<div class="container">
		<div class="navbar-header">
			<div>
				<a class="navbar-brand" href="#" style="font-size: 32px;">尚意购-创意产品购物平台</a>
			</div>
		</div>
	</div>
	</nav>

	<div class="container">
		<form class="form-signin" role="form" 
			id="loginForm" method="post">
			<h2 class="form-signin-heading">
				<i style="color: green;" class="glyphicon glyphicon-cloud"></i> 用户登录
			</h2>
			<div class="form-group has-success has-feedback">
				<input type="text" class="form-control" id="loginacct" value="${loginMember.loginacct }"
					name="loginacct" placeholder="请输入登录账号" autofocus> <span
					class="glyphicon glyphicon-user form-control-feedback"></span>
			</div>
			<div class="form-group has-success has-feedback">
				<input type="password" class="form-control" id="userpaswd" 
					name="userpaswd" placeholder="请输入登录密码" style="margin-top: 10px;">
				<span class="glyphicon glyphicon-lock form-control-feedback"></span>
			</div>
			<div class="form-group has-success has-feedback">
				<select class="form-control" id="userType">
					<option value="member">会员</option>
					<option value="user">管理</option>
				</select>
			</div>
			<div class="checkbox">
				<label> <input type="checkbox" value="remember-me">
					记住我
				</label> <br> <label> 忘记密码 </label> <label style="float: right">
					<a href="${APP_PATH}/reg">我要注册</a>
				</label>
			</div>
			<a class="btn btn-lg btn-success btn-block" onclick="dologin()">
				登录</a>
		</form>
	</div>
	<script src="${APP_PATH }/jquery/jquery-2.1.1.min.js"></script>
	<script src="${APP_PATH }/bootstrap/js/bootstrap.min.js"></script>
	<script src="${APP_PATH }/layer/layer.js"></script>
	<script>
	$(function(){
		if ($("#loginacct").val()=="") {
			$("#loginacct").focus();//设置焦点
		}else{
			$("#userpaswd").focus();//设置焦点
		}
	
	});

		function dologin() {
			//校验

			var loginacct = $("#loginacct").val().trim();
			var userpaswd = $("#userpaswd").val().trim();

			if (loginacct == null || loginacct == "") {
				layer.msg("用户名不能为空", {time:1300, icon:0, shift:6}, function(){
					$("#loginacct").focus();//设置焦点
				});
				return;
			} else if (userpaswd == null || userpaswd == "") {
				layer.msg("密码不能为空", {time:1300, icon:0, shift:6}, function(){
					$("#userpaswd").focus();//设置焦点
				});
				return;
			}
			var index=0;
			//区分管理员
			var userType =  $("#userType").val();
			var loginUrl="";
			var targetUrl="";
			if (userType=="user") {
				loginUrl="${APP_PATH}/user/doAJAXLogin";
				targetUrl="${APP_PATH}/main";
			}else{
				loginUrl="${APP_PATH}/member/doAJAXLogin";
				targetUrl="${APP_PATH}/member";
			}
			
			$.ajax({
				type :"post",
				url:loginUrl,
				data:{
					"loginacct":loginacct,
					"userpaswd":userpaswd
				},
				beforeSend:function(){
					 index = layer.load(2, {time: 10*1000});
					//
				},
				success:function(result){
					layer.close(index);
					var error_info =result.map.error_info;
					var error_no =result.map.error_no;
					var success = result.success;
					
					if (!result.success) {
						
						layer.msg(error_info, {time:3000, icon:5, shift:6}, function(){
							var loginacct = result.map.loginacct;
							//回显、清空
							if(error_no==-1){
								$("#loginacct").val("");
								$("#userpaswd").val("");
								$("#loginacct").focus();//设置焦点
							}else if(error_no==-2){
								$("#loginacct").val(loginacct);
								$("#userpaswd").val("");
								$("#userpaswd").focus();//设置焦点
							}else if(error_no==-3){
								$("#loginacct").val("");
								$("#userpaswd").val("");
								$("#loginacct").focus();//设置焦点
							}else if(error_no==-4){
								$("#userpaswd").val("");
							}else if(error_no==-5){
								$("#userpaswd").val("");
							}
						});
					}else{
						layer.msg(error_info, {time:1000, icon:6, shift:5}, function(){
							window.location.href=targetUrl;
						});
						
						
					}
				}
			});
			
			
		}
	</script>
</body>
</html>