<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="GB18030">
  <head>
    <meta charset="GB18030">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
	<link rel="stylesheet" href="${APP_PATH }/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="${APP_PATH }/css/font-awesome.min.css">
	<link rel="stylesheet" href="${APP_PATH }/css/theme.css">
	<style>
#footer {
    padding: 15px 0;
    background: #fff;
    border-top: 1px solid #ddd;
    text-align: center;
}
#topcontrol {
  color: #fff;
  z-index: 99;
  width: 30px;
  height: 30px;
  font-size: 20px;
  background: #222;
  position: relative;
  right: 14px !important;
  bottom: 11px !important;
  border-radius: 3px !important;
}

#topcontrol:after {
  /*top: -2px;*/
  left: 8.5px;
  content: "\f106";
  position: absolute;
  text-align: center;
  font-family: FontAwesome;
}

#topcontrol:hover {
    color: #fff;
    background: #18ba9b;
    -webkit-transition: all 0.3s ease-in-out;
    -moz-transition: all 0.3s ease-in-out;
    -o-transition: all 0.3s ease-in-out;
    transition: all 0.3s ease-in-out;
}

	</style>
  </head>
  <body>
 <div class="navbar-wrapper">
      <div class="container">
			<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
			 <%@include file="/WEB-INF/jsp/common/memberinfo.jsp"%>
			</nav>

      </div>
    </div>
<div class="container">
	<div class="row clearfix">
		<%@include file="/WEB-INF/jsp/common/memberinfo_right.jsp"%>
            <div class="col-sm-9 col-md-9 column">
              <ul id="myTab" style="" class="nav nav-pills" role="tablist">
                <li role="presentation" class="active"><a href="#home" role="tab" data-toggle="tab" aria-controls="home" aria-expanded="true">我的购物车</a></li>
              </ul>
              <div id="myTabContent" class="tab-content" style="margin-top:10px;">
                  <div role="tabpanel" class="tab-pane fade active in" id="home" aria-labelledby="home-tab">
                  
                        <ul id="myTab1" class="nav nav-tabs">
                          <li role="presentation" class="active"><a href="#support">商品列表</a></li>
                            <li class=" pull-right">
                                 <button type="button" class="btn btn-warning" onclick="window.location.href='#'">继续逛逛</button>
                            </li>
                        </ul>                  
                        <div id="myTab1" class="tab-content" style="margin-top:10px;">
                            <div role="tabpanel" class="tab-pane fade active in" id="support" aria-labelledby="home-tab">
                                <div class="container-fluid">
                                    <div class="row clearfix">
                                        <div class="col-md-12 column" style="margin-top:10px;padding:0;">
                                            <table class="table table-bordered" style="text-align:center;">
                                              <thead>
                                                <tr style="background-color:#ddd;">
                                                  <td>商品名称</td>
                                                  <td width="90">添加时间</td>
                                                  <td width="120">数量</td>
                                                  <td width="120">单价（元）</td>
                                                  <td width="120">总金额（元）</td>
                                                  <td width="120">操作</td>
                                                </tr>
                                              </thead>
                                              <tbody>
                                                <tr>
                                                  <td style="vertical-align:middle;">
                                                            <p>活性富氢净水直饮机</p>
                                                  </td>
                                                  <td style="vertical-align:middle;">2017-05-23 11:31:22</td>
                                                  <td style="vertical-align:middle;"><input type="text" class="form-control" value="1"></td>
                                                  <td style="vertical-align:middle;">1.00</td>
                                                  <td style="vertical-align:middle;">1.00</td>
                                                  <td style="vertical-align:middle;">
                                                    <div class="btn-group-vertical" role="group" aria-label="Vertical button group">
                                                          <button type="button" class="btn btn-warning"><i class="glyphicon glyphicon-pencil"></i> 修改</button>
                                                          <button type="button" class="btn btn-danger"><i class="glyphicon glyphicon-remove"></i> 删除</button>
                                                          <button type="button" class="btn btn-info"><i class="glyphicon glyphicon-search"></i> 详情</button>
                                                    </div>
                                                  </td>
                                                </tr>
                                                <tr>
                                                  <td style="vertical-align:middle;">
                                                            <p>活性富氢净水直饮机</p>
                                                  </td>
                                                  <td style="vertical-align:middle;">2017-05-23 11:31:22</td>
                                                  <td style="vertical-align:middle;"><input type="text" class="form-control" value="1"></td>
                                                  <td style="vertical-align:middle;">1.00</td>
                                                  <td style="vertical-align:middle;">1.00</td>
                                                  <td style="vertical-align:middle;">
                                                    <div class="btn-group-vertical" role="group" aria-label="Vertical button group">
                                                          <button type="button" class="btn btn-warning"><i class="glyphicon glyphicon-pencil"></i> 修改</button>
                                                          <button type="button" class="btn btn-danger"><i class="glyphicon glyphicon-remove"></i> 删除</button>
                                                          <button type="button" class="btn btn-info"><i class="glyphicon glyphicon-search"></i> 详情</button>
                                                    </div>
                                                  </td>
                                                </tr>
                                              </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div role="tabpanel" class="tab-pane fade" id="attension" aria-labelledby="attension-tab">
                                <div class="container-fluid">
                                    <div class="row clearfix">
                                        <div class="col-md-12 column" style="padding:0;">
                                            <table class="table table-bordered" style="text-align:center;">
                                              <thead>
                                                <tr style="background-color:#ddd;">
                                                  <td>商品信息</td>
                                                  <td width="120">支持人数</td>
                                                  <td width="120">关注人数</td>
                                                  <td width="120">操作</td>
                                                </tr>
                                              </thead>
                                              <tbody>
                                                <tr>
                                                  <td style="vertical-align:middle;">
                                                    <div class="thumbnail">
                                                        <div class="caption">
                                                            <p>
                                                                BAVOSN便携折叠移动电源台灯
                                                            </p>
                                                            <p>
                                                                <i class="glyphicon glyphicon-jpy"></i> 已筹集 1000.0元
                                                            </p>
                                                            <p>
                                                                <div style="float:left;"><i class="glyphicon glyphicon-screenshot" title="目标金额" ></i> 已完成 100% </div>
                                                                <div style="float:right;"><i class="glyphicon glyphicon-calendar"></i> 剩余2天 </div>
                                                            </p>
                                                            <br>
                                                                <div class="progress" style="margin-bottom: 4px;">
                                                                  <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%">
                                                                    <span >众筹中</span>
                                                                  </div>
                                                                </div>
                                                        </div>
                                                    </div>
                                                  </td>
                                                  <td style="vertical-align:middle;">1</td>
                                                  <td style="vertical-align:middle;">1</td>
                                                  <td style="vertical-align:middle;">
                                                    <div class="btn-group-vertical" role="group" aria-label="Vertical button group">
                                                          <button type="button" class="btn btn-default">取消关注</button>
                                                    </div>
                                                  </td>
                                                </tr>
                                              </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div role="tabpanel" class="tab-pane fade  " id="add" aria-labelledby="add-tab">
                                <div class="container-fluid">
                                    <div class="row clearfix">
                                        <div class="col-md-12 column">
                                             <span class="label label-warning">全部</span> <span class="label" style="color:#000;">众筹中</span> <span class="label " style="color:#000;">众筹成功</span>  <span class="label " style="color:#000;">众筹失败</span>
                                        </div>
                                        <div class="col-md-12 column" style="padding:0;margin-top:10px;">
                                            <table class="table table-bordered" style="text-align:center;">
                                              <thead>
                                                <tr style="background-color:#ddd;">
                                                  <td>商品信息</td>
                                                  <td width="120">募集金额（元）</td>
                                                  <td width="80">当前状态</td>
                                                  <td width="120">操作</td>
                                                </tr>
                                              </thead>
                                              <tbody>
                                                <tr>
                                                  <td style="vertical-align:middle;">
                                                    <div class="thumbnail">
                                                        <div class="caption">
                                                            <p>
                                                                BAVOSN便携折叠移动电源台灯
                                                            </p>
                                                            <p>
                                                                <div style="float:left;"><i class="glyphicon glyphicon-screenshot" title="目标金额" ></i> 已完成 100% </div>
                                                                <div style="float:right;"><i title="截至日期" class="glyphicon glyphicon-calendar"></i> 剩余8天 </div>
                                                            </p>
                                                            <br>
                                                                <div class="progress" style="margin-bottom: 4px;">
                                                                  <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%">
                                                                    <span >众筹中</span>
                                                                  </div>
                                                                </div>
                                                        </div>
                                                    </div>
                                                  </td>
                                                  <td style="vertical-align:middle;">1.00<br>(运费：0.00 )</td>
                                                  <td style="vertical-align:middle;">草稿</td>
                                                  <td style="vertical-align:middle;">
                                                    <div class="btn-group-vertical" role="group" aria-label="Vertical button group">
                                                          <button type="button" class="btn btn-default">商品预览</button>
                                                          <button type="button" class="btn btn-default">修改商品</button>
                                                          <button type="button" class="btn btn-default">删除商品</button>
                                                          <button type="button" class="btn btn-default">问题管理</button>
                                                    </div>
                                                  </td>
                                                </tr>
                                              </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>                            
                        </div>
                  
                  </div>
                  <div role="tabpanel" class="tab-pane fade" id="profile" aria-labelledby="profile-tab">
                  众筹资产
                  </div>
            </div>
		</div>
	</div>
</div>
      <%@include file="/WEB-INF/jsp/common/memberfootinfo.jsp"%>
    <script src="${APP_PATH }/jquery/jquery-2.1.1.min.js"></script>
    <script src="${APP_PATH }/bootstrap/js/bootstrap.min.js"></script>
	<script src="${APP_PATH }/script/docs.min.js"></script>
    <script src="${APP_PATH }/script/back-to-top.js"></script>
    <script src="${APP_PATH }/layer/layer.js"></script>
	<script>
	$(function(){
		
		$(".list-group-item").removeClass("active");
		$("#cart_active").addClass("active");
	});
	$(function(){
		//判断页面是否登录
		var user = "${loginMember}";
		if(user==''){
			/* layer.msg("请重新登录", {time:1000, icon:6, shift:5}, function(){
				window.location.href="${APP_PATH}/login";
			}); */
			window.location.href="${APP_PATH}/login";
		}
		
	});
$('#myTab a').click(function (e) {
  e.preventDefault()
  $(this).tab('show')
})
$('#myTab1 a').click(function (e) {
  e.preventDefault()
  $(this).tab('show')
})
	</script>
  </body>
</html>