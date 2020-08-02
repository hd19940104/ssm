<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="UTF-8">
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
          <div><a class="navbar-brand" href="#" style="font-size:32px;">尚意购-创意产品购物平台</a></div>
        </div>
      </div>
    </nav>

    <div class="container">

      <form class="form-signin" role="form">
        <h2 class="form-signin-heading"><i class="glyphicon glyphicon-log-in"></i> 会员注册</h2>
		  <div class="form-group has-success has-feedback ">
			 <input type="text" class="form-control" name="loginacct"  id="loginacct" placeholder="请输入登录账号" autofocus >
			<span class="glyphicon glyphicon-user form-control-feedback"></span>
		  </div>
		   <div class="form-group has-success has-feedback">
			<input type="text" class="form-control" name="nickname" id="nickname" placeholder="请输入昵称" style="margin-top:10px;">
			<span class="glyphicon glyphicon glyphicon-user form-control-feedback"></span>
		  </div>
		  <div class="form-group has-success has-feedback">
			<input type="password" class="form-control" name="userpaswd" id="userpaswd" placeholder="请输入登录密码" style="margin-top:10px;">
			<span class="glyphicon glyphicon-eye-close form-control-feedback "></span>
		  </div>
		  <div class="form-group has-success has-feedback">
			<input type="password" class="form-control" name="reuserpaswd" id="reuserpaswd" placeholder="再输入登录密码" style="margin-top:10px;">
			<span class="glyphicon glyphicon-eye-close form-control-feedback"></span>
		  </div>
		  <div class="form-group has-success has-feedback">
			<input type="text" class="form-control" name="email" id="email" placeholder="请输入邮箱地址" style="margin-top:10px;">
			<span class="glyphicon glyphicon glyphicon-envelope form-control-feedback"></span>
		  </div>
		   <div class="form-group has-success has-feedback" style="color: gray;">
			
			例：zhangsan@163.com
		  </div>
		 <!--  <div class="form-group has-success has-feedback">
			<select class="form-control" >
                <option value="member">会员</option>
                <option value="user">管理</option>
            </select>
		  </div> -->
        <div class="checkbox">
          <label>
            
          </label>
          <label style="float:right">
            <a href="${APP_PATH }/login">我有账号</a>
          </label>
        </div>
        <a class="btn btn-lg btn-success btn-block" onclick="reg_add()" > 注册</a>
      </form>
    </div>
    <script src="${APP_PATH }/jquery/jquery-2.1.1.min.js"></script>
    <script src="${APP_PATH }/bootstrap/js/bootstrap.min.js"></script>
    <script src="${APP_PATH }/layer/layer.js"></script>
    <script type="text/javascript">
    	
    function reg_add(){
    		//注册 ajax 
    		//获取填写内容，首先进行非空校验
    	var loginacct = $("#loginacct").val().trim();
		var userpaswd = $("#userpaswd").val().trim();
		var reuserpaswd = $("#reuserpaswd").val().trim();
		var nickname = $("#nickname").val().trim();
		var email = $("#email").val().trim();
		var reg = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/;
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
		}else if (reuserpaswd == null || reuserpaswd == "") {
			layer.msg("请再次输入密码", {time:1300, icon:0, shift:6}, function(){
				$("#reuserpaswd").val("");
				$("#reuserpaswd").focus();//设置焦点
			});
			return;
		}else if (nickname == null || nickname == "") {
			layer.msg("请输入昵称", {time:1300, icon:0, shift:6}, function(){
				$("#nickname").val("");
				$("#nickname").focus();//设置焦点
			});
			return;
		}else if (email == null || email == "") {
			layer.msg("邮箱不能为空", {time:1300, icon:0, shift:6}, function(){
				$("#email").focus();//设置焦点
			});
			return;
		}else if (!reg.test(email)) {
			layer.msg("请输入正确的邮箱格式", {time:1300, icon:0, shift:6}, function(){
				$("#email").val("");
				$("#email").focus();//设置焦点
			});
			return;
		}
		if(reuserpaswd!=userpaswd){
			layer.msg("两次输入密码不对，请重新输入", {time:1300, icon:0, shift:6}, function(){
				$("#reuserpaswd").val("");
				$("#reuserpaswd").focus();//设置焦点
			});
			return;
			
		}
		
		//开始注册
		$.ajax({
			type :"post",
			url:"${APP_PATH}/member/reg",
			data:{
				"loginacct":loginacct,
				"userpaswd":userpaswd,
				"email":email,
				"nickname":nickname
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
						//回显、清空1 正确  -1 账户存在 -2 邮箱存在 -3 异常 -4 昵称存在
						if(error_no==-1){
							//$("#loginacct").val("");
							$("#loginacct").focus();//设置焦点
						}else if(error_no==-2){
							//$("#email").val("");
							$("#email").focus();//设置焦点
						}else if(error_no==-3){
							
						}else if(error_no==-4){
							//$("#nickname").val("");
							$("#nickname").focus();//设置焦点
						}
					});
				}else{
					layer.msg(error_info, {time:1000, icon:6, shift:5}, function(){
						window.location.href="${APP_PATH}/login";
					});
					
					
				}
			}
		});
		
    	};
    
    
    </script>
  </body>
</html>