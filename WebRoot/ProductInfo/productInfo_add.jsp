<%@ page language="java" import="java.util.*"  contentType="text/html;charset=UTF-8"%>
<jsp:include page="../check_logstate.jsp"/>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/productInfo.css" />
<div id="productInfoAddDiv">
	<form id="productInfoAddForm" enctype="multipart/form-data"  method="post">
		<div>
			<span class="label">商品类别:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="productInfo_productClassObj_productClassId" name="productInfo.productClassObj.productClassId" style="width: auto"/>
			</span>
		</div>
		<div>
			<span class="label">商品名称:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="productInfo_productName" name="productInfo.productName" style="width:200px" />

			</span>

		</div>
		<div>
			<span class="label">价格区域:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="productInfo_priceRegionObj_regionId" name="productInfo.priceRegionObj.regionId" style="width: auto"/>
			</span>
		</div>
		<div>
			<span class="label">商品价格:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="productInfo_price" name="productInfo.price" style="width:80px" />

			</span>

		</div>
		<div>
			<span class="label">成色:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="productInfo_newOldLevelObj_levelId" name="productInfo.newOldLevelObj.levelId" style="width: auto"/>
			</span>
		</div>
		<div>
			<span class="label">区域:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="productInfo_areaObj_areaId" name="productInfo.areaObj.areaId" style="width: auto"/>
			</span>
		</div>
		<div>
			<span class="label">商品图片:</span>
			<span class="inputControl">
				<input id="productPhotoFile" name="productPhotoFile" type="file" size="50" />
			</span>
		</div>
		<div>
			<span class="label">联系人:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="productInfo_connectPerson" name="productInfo.connectPerson" style="width:200px" />

			</span>

		</div>
		<div>
			<span class="label">联系电话:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="productInfo_connectPhone" name="productInfo.connectPhone" style="width:200px" />

			</span>

		</div>
		<div>
			<span class="label">商品描述:</span>
			<span class="inputControl">
				<textarea id="productInfo_productDes" name="productInfo.productDes" rows="6" cols="80"></textarea>

			</span>

		</div>
		<div>
			<span class="label">发布人:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="productInfo_userObj_user_name" name="productInfo.userObj.user_name" style="width: auto"/>
			</span>
		</div>
		<div>
			<span class="label">发布时间:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="productInfo_addTime" name="productInfo.addTime" />

			</span>

		</div>
		<div class="operation">
			<a id="productInfoAddButton" class="easyui-linkbutton">添加</a>
			<a id="productInfoClearButton" class="easyui-linkbutton">重填</a>
		</div> 
	</form>
</div>
<script src="${pageContext.request.contextPath}/ProductInfo/js/productInfo_add.js"></script> 
