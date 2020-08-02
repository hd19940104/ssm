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

<link rel="stylesheet"
	href="${APP_PATH}/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${APP_PATH }/css/font-awesome.min.css">
<link rel="stylesheet" href="${APP_PATH }/css/main.css">
<link rel="stylesheet" href="${APP_PATH }/ztree/zTreeStyle.css">
<style>
.tree li {
	list-style-type: none;
	cursor: pointer;
}

table tbody tr:nth-child(odd) {
	background: #F4F4F4;
}

table tbody td:nth-child(even) {
	color: #C00;
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
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">
							<i class="glyphicon glyphicon-th"></i> 数据列表
						</h3>
					</div>
					<div class="panel-body">
						<form class="form-inline" role="form" style="float: left;">
							<div class="form-group has-feedback">
								<div class="input-group">
									<div class="input-group-addon">查询条件</div>
									<input class="form-control has-success" type="text"
										placeholder="请输入分类名称" id="queryText">
								</div>
							</div>
							<button type="button" class="btn btn-warning" id="queryButton">
								<i class="glyphicon glyphicon-search"></i> 查询
							</button>
						</form>
						<button type="button" class="btn btn-danger"
							onclick="deleteDatas()" style="float: right; margin-left: 10px;">
							<i class=" glyphicon glyphicon-remove"></i> 删除
						</button>
						<button type="button" class="btn btn-primary"
							style="float: right;"
							onclick="window.location.href='${APP_PATH }/goodsCategory/add'">
							<i class="glyphicon glyphicon-plus"></i> 新增
						</button>
						<br>
						<hr style="clear: both;">

						<div class="table-responsive">
							<table class="table  table-bordered">
								<thead>
									<tr>
										<th width="30">#</th>
										<th width="30"><input type="checkbox" id="allSelect"></th>
										<th width="100">分类名称</th>
										<th width="300">简介</th>
										<th>排序号</th>
										<th>创建时间</th>
										<th>更新时间</th>
										<th width="100">操作</th>
									</tr>
								</thead>
								<tbody id="dataBody">
								</tbody>
								<tfoot>
									<tr>
										<td colspan="8" align="center">
											<ul class="pagination" id="dataFoot">
											</ul>
										</td>
									</tr>

								</tfoot>
							</table>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>

	<script src="${APP_PATH }/jquery/jquery-2.1.1.min.js"></script>
	<script src="${APP_PATH }/bootstrap/js/bootstrap.min.js"></script>
	<script src="${APP_PATH }/script/docs.min.js"></script>
	<script src="${APP_PATH }/layer/layer.js"></script>
	<script src="${APP_PATH }/ztree/jquery.ztree.all-3.5.min.js"></script>
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
		var likeFlag = false;//模糊查询标志
		$(function() {
			$(".list-group-item").click(function() {
				if ($(this).find("ul")) {
					$(this).toggleClass("tree-closed");
					if ($(this).hasClass("tree-closed")) {
						$("ul", this).hide("fast");
					} else {
						$("ul", this).show("fast");
					}
				}
			});
			//页面加载完成查询第一页，分页查询
			pageQuery(1);
			//复选框全选
			$("#allSelect").click(function() {
				var that = this.checked;
				var boxs = $("#dataBody :checkbox");
				$.each(boxs, function(i, box) {
					//循环体
					box.checked = that;

				});

			});
			//添加绑定事件 搜索按钮
			$("#queryButton").click(function() {
				var queryText = $("#queryText").val();
				if (queryText != '' || queryText != null) {
					likeFlag = true;
				}
				pageQuery(1);
			});

		});
		//查询
		function pageQuery(pageno) {
			var jsonData = {
				"pageno" : pageno,
				"pagesize" : 8
			};
			if (likeFlag) {
				jsonData.queryText = $("#queryText").val();
			}

			var index = 0;
			$
					.ajax({
						type : "post",
						url : "${APP_PATH}/goodsCategory/pageQuery",
						data : jsonData,
						beforeSend : function() {
							index = layer.load(2, {
								time : 10 * 1000
							});

						},
						success : function(result) {
							layer.close(index);

							if (result.success) {
								//清除
								clear();
								console.log(result);
								var pageData = result.object.datas;

								var totalno = result.object.totalno; //总页码

								var content = "";
								var content_foot = "";
								for ( var i = 0; i < pageData.length; i++) {
									var data = pageData[i];
									content += '<tr>';
									content += '<td>' + (i + 1) + '</td>';
									content += '<td><input type="checkbox" value="'+data.id+'"></td>';
									content += '<td>' + data.name + '</td>';
									content += '<td>' + data.remark + '</td>';
									content += '<td>' + data.orderid + '</td>';
									content += '<td>' + data.createTime
											+ '</td>';
									content += '<td>' + data.updateTime
											+ '</td>';
									content += '<td>';
									content += '<button type="button" class="btn btn-primary btn-xs" onclick="window.location.href=\'${APP_PATH}/goodsCategory/edit?id='
											+ data.id + '\'">';
									content += '<i class=" glyphicon glyphicon-pencil"></i>';
									content += '</button>';
									content += '<button type="button" onclick="deleteGood('
											+ data.id
											+ ',\''
											+ data.name
											+ '\')"  class="btn btn-danger btn-xs" >';
									content += '<i class=" glyphicon glyphicon-remove"></i>';
									content += '</button>';
									content += '</td>';
									content += '</tr>';

								}
								/* 页码 */
								if (pageno > 1) {
									content_foot += '<li ><a href="#" onclick="pageQuery('
											+ (pageno - 1) + ')">上一页</a></li>';

								}else{
									content_foot += '<li ><a href="#" >上一页</a></li>';
								}
								for ( var i = 1; i <= totalno; i++) {
									if (pageno == i) {
										content_foot += '<li class="active"><a  onclick="pageQuery('
												+ i
												+ ')" href="#">'
												+ i
												+ '</a></li>';
									} else {
										content_foot += '<li><a onclick="pageQuery('
												+ i
												+ ')"  href="#">'
												+ i
												+ '</a></li>';
									}

								}

								if (pageno < totalno) {
									content_foot += '<li ><a href="#" onclick="pageQuery('
											+ (pageno + 1) + ')">下一页</a></li>';

								}else{
									content_foot += '<li ><a href="#" >下一页</a></li>';
								}

								$("#dataBody").append(content);
								$("#dataFoot").append(content_foot);
							} else {

								layer.msg("分页查询失败，请联系管理员！", {
									time : 3000,
									icon : 5,
									shift : 5
								}, function() {

								});
							}
						}

					});
		}

		/* 清楚标签之前的数据 */
		function clear() {
			$("#dataBody").html("");
			$("#dataFoot").html("");
		}
		//删除单个
		function deleteGood(id, name) {
			layer.confirm("删除【" + name + "】信息,是否继续？", {
				icon : 3,
				title : '温馨提示'
			}, function(cindex) {
				$.ajax({
					type : "post",
					url : "${APP_PATH}/goodsCategory/deleteGoodById",
					data : {
						"id" : id
					},
					beforeSend : function() {
						index = layer.load(2, {
							time : 10 * 1000
						});
					},
					success : function(result) {
						layer.close(index);
						if (result.success) {
							layer.msg("删除成功", {
								time : 1000,
								icon : 6,
								shift : 4
							}, function() {
								pageQuery(1);
							});

						} else {
							layer.msg("删除失败", {
								time : 1000,
								icon : 5,
								shift : 6
							}, function() {
								pageQuery(1);
							});

						}

					}

				});

				layer.close(cindex);
			}, function(cindex) {
				layer.close(cindex);
			});
		}
		//删除多个
		function deleteDatas() {
			//判断是否有删除数据
			var boxs = $("#dataBody :checked");
			if (boxs.length < 1) {
				layer.msg("请勾选你要删除的数据!", {
					time : 2000,
					icon : 0,
					shift : 6
				}, function() {
				});
				return;
			}

			layer.confirm("确认删除选择的数据", {
				icon : 3,
				title : '提示'
			}, function(cindex) {
				var jsonData = {};
				$.each(boxs, function(i, box) {
					//jsonData.ids[i] = box.value;
					//jsonData["ids["+i+"]"] = box.value;
					//if ( i != 1 ) {
					jsonData["gcs[" + i + "].id"] = box.value;
					//}
				});
				console.log(jsonData);
				$.ajax({
					type : "post",
					url : "${APP_PATH}/goodsCategory/deleteGoodsById",
					data : jsonData,
					beforeSend : function() {
						index = layer.load(2, {
							time : 10 * 1000
						});
					},
					success : function(result) {
						layer.close(index);
						if (result.success) {
							layer.msg("删除成功", {
								time : 1000,
								icon : 6,
								shift : 4
							}, function() {
								pageQuery(1);
							});

						} else {
							layer.msg("删除失败", {
								time : 1000,
								icon : 5,
								shift : 6
							}, function() {
								pageQuery(1);
							});

						}

					}

				});

				layer.close(cindex);
			}, function(cindex) {
				layer.close(cindex);
			});
		}
	</script>
</body>
</html>
