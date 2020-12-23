<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<jsp:include page="../check_logstate.jsp"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/productInfo.css" />
<div id="productInfo_editDiv">
	<form id="productInfoEditForm" enctype="multipart/form-data"  method="post">
		<div>
			<span class="label">商品编号:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="productInfo_productId_edit" name="productInfo.productId" value="<%=request.getParameter("productId") %>" style="width:200px" />
			</span>
		</div>

		<div>
			<span class="label">商品类别:</span>
			<span class="inputControl">
				<input class="textbox"  id="productInfo_productClassObj_productClassId_edit" name="productInfo.productClassObj.productClassId" style="width: auto"/>
			</span>
		</div>
		<div>
			<span class="label">商品名称:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="productInfo_productName_edit" name="productInfo.productName" style="width:200px" />

			</span>

		</div>
		<div>
			<span class="label">价格区域:</span>
			<span class="inputControl">
				<input class="textbox"  id="productInfo_priceRegionObj_regionId_edit" name="productInfo.priceRegionObj.regionId" style="width: auto"/>
			</span>
		</div>
		<div>
			<span class="label">商品价格:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="productInfo_price_edit" name="productInfo.price" style="width:80px" />

			</span>

		</div>
		<div>
			<span class="label">成色:</span>
			<span class="inputControl">
				<input class="textbox"  id="productInfo_newOldLevelObj_levelId_edit" name="productInfo.newOldLevelObj.levelId" style="width: auto"/>
			</span>
		</div>
		<div>
			<span class="label">区域:</span>
			<span class="inputControl">
				<input class="textbox"  id="productInfo_areaObj_areaId_edit" name="productInfo.areaObj.areaId" style="width: auto"/>
			</span>
		</div>
		<div>
			<span class="label">商品图片:</span>
			<span class="inputControl">
				<img id="productInfo_productPhotoImg" width="200px" border="0px"/><br/>
    			<input type="hidden" id="productInfo_productPhoto" name="productInfo.productPhoto"/>
				<input id="productPhotoFile" name="productPhotoFile" type="file" size="50" />
			</span>
		</div>
		<div>
			<span class="label">联系人:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="productInfo_connectPerson_edit" name="productInfo.connectPerson" style="width:200px" />

			</span>

		</div>
		<div>
			<span class="label">联系电话:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="productInfo_connectPhone_edit" name="productInfo.connectPhone" style="width:200px" />

			</span>

		</div>
		<div>
			<span class="label">商品描述:</span>
			<span class="inputControl">
				<textarea id="productInfo_productDes_edit" name="productInfo.productDes" rows="8" cols="60"></textarea>

			</span>

		</div>
		<div>
			<span class="label">发布人:</span>
			<span class="inputControl">
				<input class="textbox"  id="productInfo_userObj_user_name_edit" name="productInfo.userObj.user_name" style="width: auto"/>
			</span>
		</div>
		<div>
			<span class="label">发布时间:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="productInfo_addTime_edit" name="productInfo.addTime" />

			</span>

		</div>
		<div class="operation">
			<a id="productInfoModifyButton" class="easyui-linkbutton">更新</a> 
		</div>
	</form>
</div>
<script src="${pageContext.request.contextPath}/ProductInfo/js/productInfo_modify.js"></script> 
