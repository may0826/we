<%@ page language="java" import="java.util.*"  contentType="text/html;charset=UTF-8"%> 
<%@ page import="com.chengxusheji.po.AreaInfo" %>
<%@ page import="com.chengxusheji.po.NewOldLevel" %>
<%@ page import="com.chengxusheji.po.PriceRegion" %>
<%@ page import="com.chengxusheji.po.ProductClass" %>
<%@ page import="com.chengxusheji.po.UserInfo" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1 , user-scalable=no">
<title>商品信息添加</title>
<link href="<%=basePath %>plugins/bootstrap.css" rel="stylesheet">
<link href="<%=basePath %>plugins/bootstrap-dashen.css" rel="stylesheet">
<link href="<%=basePath %>plugins/font-awesome.css" rel="stylesheet">
<link href="<%=basePath %>plugins/animate.css" rel="stylesheet">
<link href="<%=basePath %>plugins/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
</head>
<body style="margin-top:70px;">
<div class="container">
<jsp:include page="../header.jsp"></jsp:include>
	<div class="col-md-12 wow fadeInLeft">
		<ul class="breadcrumb">
  			<li><a href="<%=basePath %>index.jsp">首页</a></li>
  			<li><a href="<%=basePath %>ProductInfo/frontlist">商品信息管理</a></li>
  			<li class="active">添加商品信息</li>
		</ul>
		<div class="row">
			<div class="col-md-10">
		      	<form class="form-horizontal" name="productInfoAddForm" id="productInfoAddForm" enctype="multipart/form-data" method="post"  class="mar_t15">
				  <div class="form-group">
				  	 <label for="productInfo_productClassObj_productClassId" class="col-md-2 text-right">商品类别:</label>
				  	 <div class="col-md-8">
					    <select id="productInfo_productClassObj_productClassId" name="productInfo.productClassObj.productClassId" class="form-control">
					    </select>
				  	 </div>
				  </div>
				  <div class="form-group">
				  	 <label for="productInfo_productName" class="col-md-2 text-right">商品名称:</label>
				  	 <div class="col-md-8">
					    <input type="text" id="productInfo_productName" name="productInfo.productName" class="form-control" placeholder="请输入商品名称">
					 </div>
				  </div>
				  <div class="form-group">
				  	 <label for="productInfo_priceRegionObj_regionId" class="col-md-2 text-right">价格区域:</label>
				  	 <div class="col-md-8">
					    <select id="productInfo_priceRegionObj_regionId" name="productInfo.priceRegionObj.regionId" class="form-control">
					    </select>
				  	 </div>
				  </div>
				  <div class="form-group">
				  	 <label for="productInfo_price" class="col-md-2 text-right">商品价格:</label>
				  	 <div class="col-md-8">
					    <input type="text" id="productInfo_price" name="productInfo.price" class="form-control" placeholder="请输入商品价格">
					 </div>
				  </div>
				  <div class="form-group">
				  	 <label for="productInfo_newOldLevelObj_levelId" class="col-md-2 text-right">成色:</label>
				  	 <div class="col-md-8">
					    <select id="productInfo_newOldLevelObj_levelId" name="productInfo.newOldLevelObj.levelId" class="form-control">
					    </select>
				  	 </div>
				  </div>
				  <div class="form-group">
				  	 <label for="productInfo_areaObj_areaId" class="col-md-2 text-right">区域:</label>
				  	 <div class="col-md-8">
					    <select id="productInfo_areaObj_areaId" name="productInfo.areaObj.areaId" class="form-control">
					    </select>
				  	 </div>
				  </div>
				  <div class="form-group">
				  	 <label for="productInfo_productPhoto" class="col-md-2 text-right">商品图片:</label>
				  	 <div class="col-md-8">
					    <img  class="img-responsive" id="productInfo_productPhotoImg" border="0px"/><br/>
					    <input type="hidden" id="productInfo_productPhoto" name="productInfo.productPhoto"/>
					    <input id="productPhotoFile" name="productPhotoFile" type="file" size="50" />
				  	 </div>
				  </div>
				  <div class="form-group">
				  	 <label for="productInfo_connectPerson" class="col-md-2 text-right">联系人:</label>
				  	 <div class="col-md-8">
					    <input type="text" id="productInfo_connectPerson" name="productInfo.connectPerson" class="form-control" placeholder="请输入联系人">
					 </div>
				  </div>
				  <div class="form-group">
				  	 <label for="productInfo_connectPhone" class="col-md-2 text-right">联系电话:</label>
				  	 <div class="col-md-8">
					    <input type="text" id="productInfo_connectPhone" name="productInfo.connectPhone" class="form-control" placeholder="请输入联系电话">
					 </div>
				  </div>
				  <div class="form-group">
				  	 <label for="productInfo_productDes" class="col-md-2 text-right">商品描述:</label>
				  	 <div class="col-md-8">
					    <textarea id="productInfo_productDes" name="productInfo.productDes" rows="8" class="form-control" placeholder="请输入商品描述"></textarea>
					 </div>
				  </div>
				  <div class="form-group">
				  	 <label for="productInfo_userObj_user_name" class="col-md-2 text-right">发布人:</label>
				  	 <div class="col-md-8">
					    <select id="productInfo_userObj_user_name" name="productInfo.userObj.user_name" class="form-control">
					    </select>
				  	 </div>
				  </div>
				  <div class="form-group">
				  	 <label for="productInfo_addTimeDiv" class="col-md-2 text-right">发布时间:</label>
				  	 <div class="col-md-8">
		                <div id="productInfo_addTimeDiv" class="input-group date productInfo_addTime col-md-12" data-link-field="productInfo_addTime">
		                    <input class="form-control" id="productInfo_addTime" name="productInfo.addTime" size="16" type="text" value="" placeholder="请选择发布时间" readonly>
		                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
		                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
		                </div>
				  	 </div>
				  </div>
		          <div class="form-group">
		             <span class="col-md-2""></span>
		             <span onclick="ajaxProductInfoAdd();" class="btn btn-primary bottom5 top5">添加</span>
		          </div> 
		          <style>#productInfoAddForm .form-group {margin:5px;}  </style>  
				</form> 
			</div>
			<div class="col-md-2"></div> 
	    </div>
	</div>
</div>
<jsp:include page="../footer.jsp"></jsp:include> 
<script src="<%=basePath %>plugins/jquery.min.js"></script>
<script src="<%=basePath %>plugins/bootstrap.js"></script>
<script src="<%=basePath %>plugins/wow.min.js"></script>
<script src="<%=basePath %>plugins/bootstrapvalidator/js/bootstrapValidator.min.js"></script>
<script type="text/javascript" src="<%=basePath %>plugins/bootstrap-datetimepicker.min.js" charset="UTF-8"></script>
<script type="text/javascript" src="<%=basePath %>plugins/locales/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
<script>
var basePath = "<%=basePath%>";
	//提交添加商品信息信息
	function ajaxProductInfoAdd() { 
		//提交之前先验证表单
		$("#productInfoAddForm").data('bootstrapValidator').validate();
		if(!$("#productInfoAddForm").data('bootstrapValidator').isValid()){
			return;
		}
		jQuery.ajax({
			type : "post",
			url : basePath + "ProductInfo/add",
			dataType : "json" , 
			data: new FormData($("#productInfoAddForm")[0]),
			success : function(obj) {
				if(obj.success){ 
					alert("保存成功！");
					$("#productInfoAddForm").find("input").val("");
					$("#productInfoAddForm").find("textarea").val("");
				} else {
					alert(obj.message);
				}
			},
			processData: false, 
			contentType: false, 
		});
	} 
$(function(){
	/*小屏幕导航点击关闭菜单*/
    $('.navbar-collapse > a').click(function(){
        $('.navbar-collapse').collapse('hide');
    });
    new WOW().init();
	//验证商品信息添加表单字段
	$('#productInfoAddForm').bootstrapValidator({
		feedbackIcons: {
			valid: 'glyphicon glyphicon-ok',
			invalid: 'glyphicon glyphicon-remove',
			validating: 'glyphicon glyphicon-refresh'
		},
		fields: {
			"productInfo.productName": {
				validators: {
					notEmpty: {
						message: "商品名称不能为空",
					}
				}
			},
			"productInfo.price": {
				validators: {
					notEmpty: {
						message: "商品价格不能为空",
					},
					numeric: {
						message: "商品价格不正确"
					}
				}
			},
			"productInfo.connectPerson": {
				validators: {
					notEmpty: {
						message: "联系人不能为空",
					}
				}
			},
			"productInfo.connectPhone": {
				validators: {
					notEmpty: {
						message: "联系电话不能为空",
					}
				}
			},
			"productInfo.productDes": {
				validators: {
					notEmpty: {
						message: "商品描述不能为空",
					}
				}
			},
			"productInfo.addTime": {
				validators: {
					notEmpty: {
						message: "发布时间不能为空",
					}
				}
			},
		}
	}); 
	//初始化商品类别下拉框值 
	$.ajax({
		url: basePath + "ProductClass/listAll",
		type: "get",
		success: function(productClasss,response,status) { 
			$("#productInfo_productClassObj_productClassId").empty();
			var html="";
    		$(productClasss).each(function(i,productClass){
    			html += "<option value='" + productClass.productClassId + "'>" + productClass.productClassName + "</option>";
    		});
    		$("#productInfo_productClassObj_productClassId").html(html);
    	}
	});
	//初始化价格区域下拉框值 
	$.ajax({
		url: basePath + "PriceRegion/listAll",
		type: "get",
		success: function(priceRegions,response,status) { 
			$("#productInfo_priceRegionObj_regionId").empty();
			var html="";
    		$(priceRegions).each(function(i,priceRegion){
    			html += "<option value='" + priceRegion.regionId + "'>" + priceRegion.regionName + "</option>";
    		});
    		$("#productInfo_priceRegionObj_regionId").html(html);
    	}
	});
	//初始化成色下拉框值 
	$.ajax({
		url: basePath + "NewOldLevel/listAll",
		type: "get",
		success: function(newOldLevels,response,status) { 
			$("#productInfo_newOldLevelObj_levelId").empty();
			var html="";
    		$(newOldLevels).each(function(i,newOldLevel){
    			html += "<option value='" + newOldLevel.levelId + "'>" + newOldLevel.levelName + "</option>";
    		});
    		$("#productInfo_newOldLevelObj_levelId").html(html);
    	}
	});
	//初始化区域下拉框值 
	$.ajax({
		url: basePath + "AreaInfo/listAll",
		type: "get",
		success: function(areaInfos,response,status) { 
			$("#productInfo_areaObj_areaId").empty();
			var html="";
    		$(areaInfos).each(function(i,areaInfo){
    			html += "<option value='" + areaInfo.areaId + "'>" + areaInfo.areaName + "</option>";
    		});
    		$("#productInfo_areaObj_areaId").html(html);
    	}
	});
	//初始化发布人下拉框值 
	$.ajax({
		url: basePath + "UserInfo/listAll",
		type: "get",
		success: function(userInfos,response,status) { 
			$("#productInfo_userObj_user_name").empty();
			var html="";
    		$(userInfos).each(function(i,userInfo){
    			html += "<option value='" + userInfo.user_name + "'>" + userInfo.realname + "</option>";
    		});
    		$("#productInfo_userObj_user_name").html(html);
    	}
	});
	//发布时间组件
	$('#productInfo_addTimeDiv').datetimepicker({
		language:  'zh-CN',  //显示语言
		format: 'yyyy-mm-dd hh:ii:ss',
		weekStart: 1,
		todayBtn:  1,
		autoclose: 1,
		minuteStep: 1,
		todayHighlight: 1,
		startView: 2,
		forceParse: 0
	}).on('hide',function(e) {
		//下面这行代码解决日期组件改变日期后不验证的问题
		$('#productInfoAddForm').data('bootstrapValidator').updateStatus('productInfo.addTime', 'NOT_VALIDATED',null).validateField('productInfo.addTime');
	});
})
</script>
</body>
</html>
