var utils = require("../../utils/common.js");//所有的请求都将通过它来完成
var config = require("../../utils/config.js");

Page({
  /**
   * 页面的初始数据
   */
  data: {
    productId: 0, //商品编号
    productClassObj_Index: "0", //商品类别
    productClasss: [],
    productName: "", //商品名称
    priceRegionObj_Index: "0", //价格区域
    priceRegions: [],
    price: "", //商品价格
    newOldLevelObj_Index: "0", //成色
    newOldLevels: [],
    areaObj_Index: "0", //区域
    areaInfos: [],
    productPhoto: "upload/NoImage.jpg", //商品图片
    productPhotoList: [],
    connectPerson: "", //联系人
    connectPhone: "", //联系电话
    productDes: "", //商品描述
    userObj_Index: "0", //发布人
    userInfos: [],
    addTime: "", //发布时间
    loadingHide: true,
    loadingText: "网络操作中。。",
  },

  //初始化下拉框的信息
  init_select_params: function () { 
    var self = this;
    var url = null;
    url = config.basePath + "api/areaInfo/listAll";
    utils.sendRequest(url, null, function (res) {
      wx.stopPullDownRefresh();
      self.setData({
        areaInfos: res.data,
      });
    });
    url = config.basePath + "api/newOldLevel/listAll";
    utils.sendRequest(url, null, function (res) {
      wx.stopPullDownRefresh();
      self.setData({
        newOldLevels: res.data,
      });
    });
    url = config.basePath + "api/priceRegion/listAll";
    utils.sendRequest(url, null, function (res) {
      wx.stopPullDownRefresh();
      self.setData({
        priceRegions: res.data,
      });
    });
    url = config.basePath + "api/productClass/listAll";
    utils.sendRequest(url, null, function (res) {
      wx.stopPullDownRefresh();
      self.setData({
        productClasss: res.data,
      });
    });
    url = config.basePath + "api/userInfo/listAll";
    utils.sendRequest(url, null, function (res) {
      wx.stopPullDownRefresh();
      self.setData({
        userInfos: res.data,
      });
    });
  },
  //商品类别改变事件
  bind_productClassObj_change: function (e) {
    this.setData({
      productClassObj_Index: e.detail.value
    })
  },

  //价格区域改变事件
  bind_priceRegionObj_change: function (e) {
    this.setData({
      priceRegionObj_Index: e.detail.value
    })
  },

  //成色改变事件
  bind_newOldLevelObj_change: function (e) {
    this.setData({
      newOldLevelObj_Index: e.detail.value
    })
  },

  //区域改变事件
  bind_areaObj_change: function (e) {
    this.setData({
      areaObj_Index: e.detail.value
    })
  },

  //发布人改变事件
  bind_userObj_change: function (e) {
    this.setData({
      userObj_Index: e.detail.value
    })
  },

  //选择发布时间
  bind_addTime_change: function (e) {
    this.setData({
      addTime: e.detail.value
    })
  },
  //清空发布时间
  clear_addTime: function (e) {
    this.setData({
      addTime: "",
    });
  },

  /*提交添加商品信息到服务器 */
  formSubmit: function (e) {
    var self = this;
    var formData = e.detail.value;
    var url = config.basePath + "api/productInfo/add";
    utils.sendRequest(url, formData, function (res) {//进行封装
      wx.stopPullDownRefresh();
      wx.showToast({
        title: '发布成功',
        icon: 'success',
        duration: 500
      })

      //提交成功后重置表单数据
      self.setData({
        productId: 0,
        productClassObj_Index: "0",
    productName: "",
        priceRegionObj_Index: "0",
    price: "",
        newOldLevelObj_Index: "0",
        areaObj_Index: "0",
        productPhoto: "upload/NoImage.jpg",
        productPhotoList: [],
    connectPerson: "",
    connectPhone: "",
    productDes: "",
        userObj_Index: "0",
    addTime: "",
        loadingHide: true,
        loadingText: "网络操作中。。",
      })
    });
  },

  //选择商品图片上传
  select_productPhoto: function (e) {
    var self = this
    wx.chooseImage({
      count: 1,   //可以上传一张图片
      sizeType: ['original', 'compressed'],
      sourceType: ['album', 'camera'],
      success: function (res) {
        var tempFilePaths = res.tempFilePaths
        self.setData({
          productPhotoList: tempFilePaths,
          loadingHide: false
        });
        utils.sendUploadImage(config.basePath + "upload/image", tempFilePaths[0], function (res) {
          wx.stopPullDownRefresh()
          setTimeout(function () {
            self.setData({
              productPhoto: res.data,
              loadingHide: true
            });
          }, 200);
        });
      }
    })
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    this.init_select_params();
  },

  /**
   * 生命周期函数--监听页面初次渲染完成
   */
  onReady: function () {
  },

  /**
   * 生命周期函数--监听页面显示
   */
  onShow: function () {
    var token = wx.getStorageSync('authToken');
    if (!token) {
      wx.navigateTo({
        url: '../mobile/mobile',
      })
    }
  },

  /**
   * 用户点击右上角分享
   */
  onShareAppMessage: function () {
  }
})

