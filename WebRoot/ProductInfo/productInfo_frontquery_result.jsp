<%@ page language="java" import="java.util.*"  contentType="text/html;charset=UTF-8"%> 
<%@ page import="com.chengxusheji.po.ProductInfo" %>
<%@ page import="com.chengxusheji.po.AreaInfo" %>
<%@ page import="com.chengxusheji.po.NewOldLevel" %>
<%@ page import="com.chengxusheji.po.PriceRegion" %>
<%@ page import="com.chengxusheji.po.ProductClass" %>
<%@ page import="com.chengxusheji.po.UserInfo" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    List<ProductInfo> productInfoList = (List<ProductInfo>)request.getAttribute("productInfoList");
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
    int currentPage =  (Integer)request.getAttribute("currentPage"); //当前页
    int totalPage =   (Integer)request.getAttribute("totalPage");  //一共多少页
    int recordNumber =   (Integer)request.getAttribute("recordNumber");  //一共多少记录
    ProductClass productClassObj = (ProductClass)request.getAttribute("productClassObj");
    String productName = (String)request.getAttribute("productName"); //商品名称查询关键字
    PriceRegion priceRegionObj = (PriceRegion)request.getAttribute("priceRegionObj");
    NewOldLevel newOldLevelObj = (NewOldLevel)request.getAttribute("newOldLevelObj");
    AreaInfo areaObj = (AreaInfo)request.getAttribute("areaObj");
    UserInfo userObj = (UserInfo)request.getAttribute("userObj");
    String addTime = (String)request.getAttribute("addTime"); //发布时间查询关键字
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1 , user-scalable=no">
<title>商品信息查询</title>
<link href="<%=basePath %>plugins/bootstrap.css" rel="stylesheet">
<link href="<%=basePath %>plugins/bootstrap-dashen.css" rel="stylesheet">
<link href="<%=basePath %>plugins/font-awesome.css" rel="stylesheet">
<link href="<%=basePath %>plugins/animate.css" rel="stylesheet">
<link href="<%=basePath %>plugins/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
</head>
<body style="margin-top:70px;">
<div class="container">
<jsp:include page="../header.jsp"></jsp:include>
	<div class="col-md-9 wow fadeInLeft">
		<ul class="breadcrumb">
  			<li><a href="<%=basePath %>index.jsp">首页</a></li>
  			<li><a href="<%=basePath %>ProductInfo/frontlist">商品信息信息列表</a></li>
  			<li class="active">查询结果显示</li>
  			<a class="pull-right" href="<%=basePath %>ProductInfo/productInfo_frontAdd.jsp" style="display:none;">添加商品信息</a>
		</ul>
		<div class="row">
			<%
				/*计算起始序号*/
				int startIndex = (currentPage -1) * 5;
				/*遍历记录*/
				for(int i=0;i<productInfoList.size();i++) {
            		int currentIndex = startIndex + i + 1; //当前记录的序号
            		ProductInfo productInfo = productInfoList.get(i); //获取到商品信息对象
            		String clearLeft = "";
            		if(i%4 == 0) clearLeft = "style=\"clear:left;\"";
			%>
			<div class="col-md-3 bottom15" <%=clearLeft %>>
			  <a  href="<%=basePath  %>ProductInfo/<%=productInfo.getProductId() %>/frontshow"><img class="img-responsive" src="<%=basePath%><%=productInfo.getProductPhoto()%>" /></a>
			     <div class="showFields">
			     	<div class="field">
	            		商品编号:<%=productInfo.getProductId() %>
			     	</div>
			     	<div class="field">
	            		商品类别:<%=productInfo.getProductClassObj().getProductClassName() %>
			     	</div>
			     	<div class="field">
	            		商品名称:<%=productInfo.getProductName() %>
			     	</div>
			     	<div class="field">
	            		商品价格:<%=productInfo.getPrice() %>
			     	</div>
			     	<div class="field">
	            		成色:<%=productInfo.getNewOldLevelObj().getLevelName() %>
			     	</div>
			     	<div class="field">
	            		区域:<%=productInfo.getAreaObj().getAreaName() %>
			     	</div>
			     	<div class="field">
	            		联系人:<%=productInfo.getConnectPerson() %>
			     	</div>
			     	<div class="field">
	            		联系电话:<%=productInfo.getConnectPhone() %>
			     	</div>
			     	<div class="field">
	            		发布人:<%=productInfo.getUserObj().getRealname() %>
			     	</div>
			     	<div class="field">
	            		发布时间:<%=productInfo.getAddTime() %>
			     	</div>
			        <a class="btn btn-primary top5" href="<%=basePath %>ProductInfo/<%=productInfo.getProductId() %>/frontshow">详情</a>
			        <a class="btn btn-primary top5" onclick="productInfoEdit('<%=productInfo.getProductId() %>');" style="display:none;">修改</a>
			        <a class="btn btn-primary top5" onclick="productInfoDelete('<%=productInfo.getProductId() %>');" style="display:none;">删除</a>
			     </div>
			</div>
			<%  } %>

			<div class="row">
				<div class="col-md-12">
					<nav class="pull-left">
						<ul class="pagination">
							<li><a href="#" onclick="GoToPage(<%=currentPage-1 %>,<%=totalPage %>);" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
							<%
								int startPage = currentPage - 5;
								int endPage = currentPage + 5;
								if(startPage < 1) startPage=1;
								if(endPage > totalPage) endPage = totalPage;
								for(int i=startPage;i<=endPage;i++) {
							%>
							<li class="<%= currentPage==i?"active":"" %>"><a href="#"  onclick="GoToPage(<%=i %>,<%=totalPage %>);"><%=i %></a></li>
							<%  } %> 
							<li><a href="#" onclick="GoToPage(<%=currentPage+1 %>,<%=totalPage %>);"><span aria-hidden="true">&raquo;</span></a></li>
						</ul>
					</nav>
					<div class="pull-right" style="line-height:75px;" >共有<%=recordNumber %>条记录，当前第 <%=currentPage %>/<%=totalPage %> 页</div>
				</div>
			</div>
		</div>
	</div>

	<div class="col-md-3 wow fadeInRight">
		<div class="page-header">
    		<h1>商品信息查询</h1>
		</div>
		<form name="productInfoQueryForm" id="productInfoQueryForm" action="<%=basePath %>ProductInfo/frontlist" class="mar_t15" method="post">
            <div class="form-group">
            	<label for="productClassObj_productClassId">商品类别：</label>
                <select id="productClassObj_productClassId" name="productClassObj.productClassId" class="form-control">
                	<option value="0">不限制</option>
	 				<%
	 				for(ProductClass productClassTemp:productClassList) {
	 					String selected = "";
 					if(productClassObj!=null && productClassObj.getProductClassId()!=null && productClassObj.getProductClassId().intValue()==productClassTemp.getProductClassId().intValue())
 						selected = "selected";
	 				%>
 				 <option value="<%=productClassTemp.getProductClassId() %>" <%=selected %>><%=productClassTemp.getProductClassName() %></option>
	 				<%
	 				}
	 				%>
 			</select>
            </div>
			<div class="form-group">
				<label for="productName">商品名称:</label>
				<input type="text" id="productName" name="productName" value="<%=productName %>" class="form-control" placeholder="请输入商品名称">
			</div>
            <div class="form-group">
            	<label for="priceRegionObj_regionId">价格区域：</label>
                <select id="priceRegionObj_regionId" name="priceRegionObj.regionId" class="form-control">
                	<option value="0">不限制</option>
	 				<%
	 				for(PriceRegion priceRegionTemp:priceRegionList) {
	 					String selected = "";
 					if(priceRegionObj!=null && priceRegionObj.getRegionId()!=null && priceRegionObj.getRegionId().intValue()==priceRegionTemp.getRegionId().intValue())
 						selected = "selected";
	 				%>
 				 <option value="<%=priceRegionTemp.getRegionId() %>" <%=selected %>><%=priceRegionTemp.getRegionName() %></option>
	 				<%
	 				}
	 				%>
 			</select>
            </div>
            <div class="form-group">
            	<label for="newOldLevelObj_levelId">成色：</label>
                <select id="newOldLevelObj_levelId" name="newOldLevelObj.levelId" class="form-control">
                	<option value="0">不限制</option>
	 				<%
	 				for(NewOldLevel newOldLevelTemp:newOldLevelList) {
	 					String selected = "";
 					if(newOldLevelObj!=null && newOldLevelObj.getLevelId()!=null && newOldLevelObj.getLevelId().intValue()==newOldLevelTemp.getLevelId().intValue())
 						selected = "selected";
	 				%>
 				 <option value="<%=newOldLevelTemp.getLevelId() %>" <%=selected %>><%=newOldLevelTemp.getLevelName() %></option>
	 				<%
	 				}
	 				%>
 			</select>
            </div>
            <div class="form-group">
            	<label for="areaObj_areaId">区域：</label>
                <select id="areaObj_areaId" name="areaObj.areaId" class="form-control">
                	<option value="0">不限制</option>
	 				<%
	 				for(AreaInfo areaInfoTemp:areaInfoList) {
	 					String selected = "";
 					if(areaObj!=null && areaObj.getAreaId()!=null && areaObj.getAreaId().intValue()==areaInfoTemp.getAreaId().intValue())
 						selected = "selected";
	 				%>
 				 <option value="<%=areaInfoTemp.getAreaId() %>" <%=selected %>><%=areaInfoTemp.getAreaName() %></option>
	 				<%
	 				}
	 				%>
 			</select>
            </div>
            <div class="form-group">
            	<label for="userObj_user_name">发布人：</label>
                <select id="userObj_user_name" name="userObj.user_name" class="form-control">
                	<option value="">不限制</option>
	 				<%
	 				for(UserInfo userInfoTemp:userInfoList) {
	 					String selected = "";
 					if(userObj!=null && userObj.getUser_name()!=null && userObj.getUser_name().equals(userInfoTemp.getUser_name()))
 						selected = "selected";
	 				%>
 				 <option value="<%=userInfoTemp.getUser_name() %>" <%=selected %>><%=userInfoTemp.getRealname() %></option>
	 				<%
	 				}
	 				%>
 			</select>
            </div>
			<div class="form-group">
				<label for="addTime">发布时间:</label>
				<input type="text" id="addTime" name="addTime" class="form-control"  placeholder="请选择发布时间" value="<%=addTime %>" onclick="SelectDate(this,'yyyy-MM-dd')" />
			</div>
            <input type=hidden name=currentPage value="<%=currentPage %>" />
            <button type="submit" class="btn btn-primary">查询</button>
        </form>
	</div>

		</div>
</div>
<div id="productInfoEditDialog" class="modal fade" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title"><i class="fa fa-edit"></i>&nbsp;商品信息信息编辑</h4>
      </div>
      <div class="modal-body" style="height:450px; overflow: scroll;">
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
		</form> 
	    <style>#productInfoEditForm .form-group {margin-bottom:5px;}  </style>
      </div>
      <div class="modal-footer"> 
      	<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
      	<button type="button" class="btn btn-primary" onclick="ajaxProductInfoModify();">提交</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<jsp:include page="../footer.jsp"></jsp:include> 
<script src="<%=basePath %>plugins/jquery.min.js"></script>
<script src="<%=basePath %>plugins/bootstrap.js"></script>
<script src="<%=basePath %>plugins/wow.min.js"></script>
<script src="<%=basePath %>plugins/bootstrap-datetimepicker.min.js"></script>
<script src="<%=basePath %>plugins/locales/bootstrap-datetimepicker.zh-CN.js"></script>
<script type="text/javascript" src="<%=basePath %>js/jsdate.js"></script>
<script>
var basePath = "<%=basePath%>";
/*跳转到查询结果的某页*/
function GoToPage(currentPage,totalPage) {
    if(currentPage==0) return;
    if(currentPage>totalPage) return;
    document.productInfoQueryForm.currentPage.value = currentPage;
    document.productInfoQueryForm.submit();
}

/*可以直接跳转到某页*/
function changepage(totalPage)
{
    var pageValue=document.productInfoQueryForm.pageValue.value;
    if(pageValue>totalPage) {
        alert('你输入的页码超出了总页数!');
        return ;
    }
    document.productInfoQueryForm.currentPage.value = pageValue;
    documentproductInfoQueryForm.submit();
}

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
				$('#productInfoEditDialog').modal('show');
			} else {
				alert("获取信息失败！");
			}
		}
	});
}

/*删除商品信息信息*/
function productInfoDelete(productId) {
	if(confirm("确认删除这个记录")) {
		$.ajax({
			type : "POST",
			url : basePath + "ProductInfo/deletes",
			data : {
				productIds : productId,
			},
			success : function (obj) {
				if (obj.success) {
					alert("删除成功");
					$("#productInfoQueryForm").submit();
					//location.href= basePath + "ProductInfo/frontlist";
				}
				else 
					alert(obj.message);
			},
		});
	}
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
})
</script>
</body>
</html>

