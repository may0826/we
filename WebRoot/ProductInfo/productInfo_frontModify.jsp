<%@ page language="java" import="java.util.*"  contentType="text/html;charset=UTF-8"%> 
<%@ page import="com.chengxusheji.po.ProductInfo" %>
<%@ page import="com.chengxusheji.po.AreaInfo" %>
<%@ page import="com.chengxusheji.po.NewOldLevel" %>
<%@ page import="com.chengxusheji.po.PriceRegion" %>
<%@ page import="com.chengxusheji.po.ProductClass" %>
<%@ page import="com.chengxusheji.po.UserInfo" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    //获取所有的areaObj信息
    List<AreaInfo> areaInfoList = (List<AreaInfo>)request.getAttribute("areaInfoList");
    //获取所有的newOldLevelObj信息
    List<NewOldLevel> newOldLevelList = (List<NewOldLevel>)request.getAttribute("newOldLevelList");
    //获取所有的priceRegionObj信息
    List<PriceRegion> priceRegionList = (List<PriceRegion>)request.getAttribute("priceRegionList");
    //获取所有的productClassObj信息
    List<ProductClass> productClassList = (List<ProductClass>)request.getAttribute("productClassList");
    //获取所有的userObj信息
    List<UserInfo> userInfoList = (List<UserInfo>)request.getAttribute("userInfoList");
    ProductInfo productInfo = (ProductInfo)request.getAttribute("productInfo");

%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1 , user-scalable=no">
  <TITLE>修改商品信息信息</TITLE>
  <link href="<%=basePath %>plugins/bootstrap.css" rel="stylesheet">
  <link href="<%=basePath %>plugins/bootstrap-dashen.css" rel="stylesheet">
  <link href="<%=basePath %>plugins/font-awesome.css" rel="stylesheet">
  <link href="<%=basePath %>plugins/animate.css" rel="stylesheet"> 
</head>
<body style="margin-top:70px;"> 
<div class="container">
<jsp:include page="../header.jsp"></jsp:include>
	<div class="col-md-9 wow fadeInLeft">
	<ul class="breadcrumb">
  		<li><a href="<%=basePath %>index.jsp">首页</a></li>
  		<li class="active">商品信息信息修改</li>
	</ul>
		<div class="row"> 
      	<form class="form-horizontal" name="productInfoEditForm" id="productInfoEditForm" enctype="multipart/form-data" method="post"  class="mar_t15">
		  <div class="form-group">
			 <label for="productInfo_productId_edit" class="col-md-3 text-right">商品编号:</label>
			 <div class="col-md-9"> 
			 	<input type="text" id="productInfo_productId_edit" name="productInfo.productId" class="form-control" placeholder="请输入商品编号" readOnly>
			 </div>
		  </div> 
		  <div class="form-group">
		  	 <label for="productInfo_productClassObj_productClassId_edit" class="col-md-3 text-right">商品类别:</label>
		  	 <div class="col-md-9">
			    <select id="productInfo_productClassObj_productClassId_edit" name="productInfo.productClassObj.productClassId" class="form-control">
			    </select>
		  	 </div>
		  </div>
		  <div class="form-group">
		  	 <label for="productInfo_productName_edit" class="col-md-3 text-right">商品名称:</label>
		  	 <div class="col-md-9">
			    <input type="text" id="productInfo_productName_edit" name="productInfo.productName" class="form-control" placeholder="请输入商品名称">
			 </div>
		  </div>
		  <div class="form-group">
		  	 <label for="productInfo_priceRegionObj_regionId_edit" class="col-md-3 text-right">价格区域:</label>
		  	 <div class="col-md-9">
			    <select id="productInfo_priceRegionObj_regionId_edit" name="productInfo.priceRegionObj.regionId" class="form-control">
			    </select>
		  	 </div>
		  </div>
		  <div class="form-group">
		  	 <label for="productInfo_price_edit" class="col-md-3 text-right">商品价格:</label>
		  	 <div class="col-md-9">
			    <input type="text" id="productInfo_price_edit" name="productInfo.price" class="form-control" placeholder="请输入商品价格">
			 </div>
		  </div>
		  <div class="form-group">
		  	 <label for="productInfo_newOldLevelObj_levelId_edit" class="col-md-3 text-right">成色:</label>
		  	 <div class="col-md-9">
			    <select id="productInfo_newOldLevelObj_levelId_edit" name="productInfo.newOldLevelObj.levelId" class="form-control">
			    </select>
		  	 </div>
		  </div>
		  <div class="form-group">
		  	 <label for="productInfo_areaObj_areaId_edit" class="col-md-3 text-right">区域:</label>
		  	 <div class="col-md-9">
			    <select id="productInfo_areaObj_areaId_edit" name="productInfo.areaObj.areaId" class="form-control">
			    </select>
		  	 </div>
		  </div>
		  <div class="form-group">
		  	 <label for="productInfo_productPhoto_edit" class="col-md-3 text-right">商品图片:</label>
		  	 <div class="col-md-9">
			    <img  class="img-responsive" id="productInfo_productPhotoImg" border="0px"/><br/>
			    <input type="hidden" id="productInfo_productPhoto" name="productInfo.productPhoto"/>
			    <input id="productPhotoFile" name="productPhotoFile" type="file" size="50" />
		  	 </div>
		  </div>
		  <div class="form-group">
		  	 <label for="productInfo_connectPerson_edit" class="col-md-3 text-right">联系人:</label>
		  	 <div class="col-md-9">
			    <input type="text" id="productInfo_connectPerson_edit" name="productInfo.connectPerson" class="form-control" placeholder="请输入联系人">
			 </div>
		  </div>
		  <div class="form-group">
		  	 <label for="productInfo_connectPhone_edit" class="col-md-3 text-right">联系电话:</label>
		  	 <div class="col-md-9">
			    <input type="text" id="productInfo_connectPhone_edit" name="productInfo.connectPhone" class="form-control" placeholder="请输入联系电话">
			 </div>
		  </div>
		  <div class="form-group">
		  	 <label for="productInfo_productDes_edit" class="col-md-3 text-right">商品描述:</label>
		  	 <div class="col-md-9">
			    <textarea id="productInfo_productDes_edit" name="productInfo.productDes" rows="8" class="form-control" placeholder="请输入商品描述"></textarea>
			 </div>
		  </div>
		  <div class="form-group">
		  	 <label for="productInfo_userObj_user_name_edit" class="col-md-3 text-right">发布人:</label>
		  	 <div class="col-md-9">
			    <select id="productInfo_userObj_user_name_edit" name="productInfo.userObj.user_name" class="form-control">
			    </select>
		  	 </div>
		  </div>
		  <div class="form-group">
		  	 <label for="productInfo_addTime_edit" class="col-md-3 text-right">发布时间:</label>
		  	 <div class="col-md-9">
                <div class="input-group date productInfo_addTime_edit col-md-12" data-link-field="productInfo_addTime_edit">
                    <input class="form-control" id="productInfo_addTime_edit" name="productInfo.addTime" size="16" type="text" value="" placeholder="请选择发布时间" readonly>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                </div>
		  	 </div>
		  </div>
			  <div class="form-group">
			  	<span class="col-md-3""></span>
			  	<span onclick="ajaxProductInfoModify();" class="btn btn-primary bottom5 top5">修改</span>
			  </div>
		</form> 
	    <style>#productInfoEditForm .form-group {margin-bottom:5px;}  </style>
      </div>
   </div>
</div>


<jsp:include page="../footer.jsp"></jsp:include>
<script src="<%=basePath %>plugins/jquery.min.js"></script>
<script src="<%=basePath %>plugins/bootstrap.js"></script>
<script src="<%=basePath %>plugins/wow.min.js"></script>
<script src="<%=basePath %>plugins/bootstrap-datetimepicker.min.js"></script>
<script src="<%=basePath %>plugins/locales/bootstrap-datetimepicker.zh-CN.js"></script>
<script type="text/javascript" src="<%=basePath %>js/jsdate.js"></script>
<script>
var basePath = "<%=basePath%>";
/*弹出修改商品信息界面并初始化数据*/
function productInfoEdit(productId) {
	$.ajax({
		url :  basePath + "ProductInfo/" + productId + "/update",
		type : "get",
		dataType: "json",
		success : function (productInfo, response, status) {
			if (productInfo) {
				$("#productInfo_productId_edit").val(productInfo.productId);
				$.ajax({
					url: basePath + "ProductClass/listAll",
					type: "get",
					success: function(productClasss,response,status) { 
						$("#productInfo_productClassObj_productClassId_edit").empty();
						var html="";
		        		$(productClasss).each(function(i,productClass){
		        			html += "<option value='" + productClass.productClassId + "'>" + productClass.productClassName + "</option>";
		        		});
		        		$("#productInfo_productClassObj_productClassId_edit").html(html);
		        		$("#productInfo_productClassObj_productClassId_edit").val(productInfo.productClassObjPri);
					}
				});
				$("#productInfo_productName_edit").val(productInfo.productName);
				$.ajax({
					url: basePath + "PriceRegion/listAll",
					type: "get",
					success: function(priceRegions,response,status) { 
						$("#productInfo_priceRegionObj_regionId_edit").empty();
						var html="";
		        		$(priceRegions).each(function(i,priceRegion){
		        			html += "<option value='" + priceRegion.regionId + "'>" + priceRegion.regionName + "</option>";
		        		});
		        		$("#productInfo_priceRegionObj_regionId_edit").html(html);
		        		$("#productInfo_priceRegionObj_regionId_edit").val(productInfo.priceRegionObjPri);
					}
				});
				$("#productInfo_price_edit").val(productInfo.price);
				$.ajax({
					url: basePath + "NewOldLevel/listAll",
					type: "get",
					success: function(newOldLevels,response,status) { 
						$("#productInfo_newOldLevelObj_levelId_edit").empty();
						var html="";
		        		$(newOldLevels).each(function(i,newOldLevel){
		        			html += "<option value='" + newOldLevel.levelId + "'>" + newOldLevel.levelName + "</option>";
		        		});
		        		$("#productInfo_newOldLevelObj_levelId_edit").html(html);
		        		$("#productInfo_newOldLevelObj_levelId_edit").val(productInfo.newOldLevelObjPri);
					}
				});
				$.ajax({
					url: basePath + "AreaInfo/listAll",
					type: "get",
					success: function(areaInfos,response,status) { 
						$("#productInfo_areaObj_areaId_edit").empty();
						var html="";
		        		$(areaInfos).each(function(i,areaInfo){
		        			html += "<option value='" + areaInfo.areaId + "'>" + areaInfo.areaName + "</option>";
		        		});
		        		$("#productInfo_areaObj_areaId_edit").html(html);
		        		$("#productInfo_areaObj_areaId_edit").val(productInfo.areaObjPri);
					}
				});
				$("#productInfo_productPhoto").val(productInfo.productPhoto);
				$("#productInfo_productPhotoImg").attr("src", basePath +　productInfo.productPhoto);
				$("#productInfo_connectPerson_edit").val(productInfo.connectPerson);
				$("#productInfo_connectPhone_edit").val(productInfo.connectPhone);
				$("#productInfo_productDes_edit").val(productInfo.productDes);
				$.ajax({
					url: basePath + "UserInfo/listAll",
					type: "get",
					success: function(userInfos,response,status) { 
						$("#productInfo_userObj_user_name_edit").empty();
						var html="";
		        		$(userInfos).each(function(i,userInfo){
		        			html += "<option value='" + userInfo.user_name + "'>" + userInfo.realname + "</option>";
		        		});
		        		$("#productInfo_userObj_user_name_edit").html(html);
		        		$("#productInfo_userObj_user_name_edit").val(productInfo.userObjPri);
					}
				});
				$("#productInfo_addTime_edit").val(productInfo.addTime);
			} else {
				alert("获取信息失败！");
			}
		}
	});
}

/*ajax方式提交商品信息信息表单给服务器端修改*/
function ajaxProductInfoModify() {
	$.ajax({
		url :  basePath + "ProductInfo/" + $("#productInfo_productId_edit").val() + "/update",
		type : "post",
		dataType: "json",
		data: new FormData($("#productInfoEditForm")[0]),
		success : function (obj, response, status) {
            if(obj.success){
                alert("信息修改成功！");
                location.reload(true);
                $("#productInfoQueryForm").submit();
            }else{
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
    /*发布时间组件*/
    $('.productInfo_addTime_edit').datetimepicker({
    	language:  'zh-CN',  //语言
    	format: 'yyyy-mm-dd hh:ii:ss',
    	weekStart: 1,
    	todayBtn:  1,
    	autoclose: 1,
    	minuteStep: 1,
    	todayHighlight: 1,
    	startView: 2,
    	forceParse: 0
    });
    productInfoEdit("<%=request.getParameter("productId")%>");
 })
 </script> 
</body>
</html>

