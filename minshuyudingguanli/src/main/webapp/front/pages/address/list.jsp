












<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="true" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <!--通用-->
    <meta name="format-detection" content="telephone=no">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0">
    <title>收货地址列表页</title>
    <meta name="keywords" content="" />
    <meta name="description" content="" />
    <link rel="stylesheet" href="../../layui/css/layui.css">
    <link rel="stylesheet" href="../../xznstatic/css/aos.css" />
    <link rel="stylesheet" href="../../xznstatic/css/bootstrap.min.css" />
    <link rel="stylesheet" href="../../xznstatic/css/idangerous.swiper.css" />
    <link rel="stylesheet" href="../../xznstatic/css/lightbox.css">
    <link rel="stylesheet" href="../../xznstatic/css/app.css" />
    <link rel="stylesheet" href="../../xznstatic/css/apmin.css"/>
    <link rel="stylesheet" type="text/css" href="../../xznstatic/css/iconfont.css">
    <link rel="stylesheet" type="text/css" href="../../xznstatic/css/color.css">
    <link rel="stylesheet" type="text/css" href="../../xznstatic/css/global.css">
    <link rel="stylesheet" type="text/css" href="../../xznstatic/css/page.css">
    <link rel="stylesheet" type="text/css" href="../../xznstatic/css/uzlist.css">
    <link rel="stylesheet" type="text/css" href="../../xznstatic/css/animate.min.css">
    <link rel="stylesheet" type="text/css" href="../../xznstatic/css/fancybox.css" />
    <script type="text/javascript" src="../../xznstatic/js/jquery.min.js"></script>
    <script type="text/javascript" src="../../xznstatic/js/superslide.2.1.1.min.js"></script>
    <script type="text/javascript" src="../../xznstatic/js/wow.min.js"></script>
    <script type="text/javascript" src="../../xznstatic/js/fancybox.js"></script>
    <!-- 样式 -->
    <link rel="stylesheet" href="../../css/style.css"/>
    <!-- 主题（主要颜色设置） -->
    <link rel="stylesheet" href="../../css/theme.css"/>
    <!-- 通用的css -->
    <link rel="stylesheet" href="../../css/common.css"/>
    <script type="text/javascript" charset="utf-8">
        window.UEDITOR_HOME_URL = "../../../resources/ueditor/"; //UEDITOR_HOME_URL、config、all这三个顺序不能改变
    </script>
    <script type="text/javascript" charset="utf-8"
            src="../../../resources/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8"
            src="../../../resources/ueditor/ueditor.all.min.js"></script>
    <script type="text/javascript" charset="utf-8"
            src="../../../resources/ueditor/lang/zh-cn/zh-cn.js"></script>
    <script type="text/javascript">
        var CATID = "0",
                BCID = "0",
                NAVCHILDER = "",
                ONCONTEXT = 0,
                ONCOPY = 0,
                ONSELECT = 0;
    </script>
    <style>
        .ng-djn-txt {
            text-align: justify;
            text-justify: inter-ideograph;
            word-wrap: break-word;
            word-break: break-all;
        }
        .ng-inpusbox {
            text-indent:0px;
        }
        .am-inside-adv{
            height:auto;
        }
        .am-inside-adv img {
            width:100%;
        }
        .ng-oa a .small {
            display:none;
        }
        .ng-oa a:hover .small {
            display:block;
        }
        .ng-oa a:hover .image {
            display:none;
        }
        .pos-a {
            height:30px;
            line-height:30px;
            margin:0 5px;
        }
        .pos-a a {
            margin:0 5px;
        }
        .layui-laypage .layui-laypage-curr .layui-laypage-em {
            background-color: var(--publicColor,orange);
        }
        .jishuzichis a {
            font-size: 12px;
            color: #878787;
        }
        .ng-siotext {
            line-height: 50px;
        }

        @media screen and (max-width: 992px) {
            .ng-zein-iten-link li {
                width: 50%;
                text-align: center;
            }
            .ng-zein-iten-link li.li {
                width: 100%;
            }
            .bdshare-button-style2-16 a, .bdshare-button-style2-16 .bds_more {
                float: initial;
            }
            .ng-zein-code {
                width: 100%;
            }
            .ng-zein-code-tit {
                width: 100%;
                text-align: center;
            }
        }

        /* 前台模态框使用集成tinymce富文本框会导致页面做下角出现上传图片和添加表格功能，由于处理不了，把它z-index属性设置为负的，不能让页面上可以点*/
        .tox-pop{
            z-index: -99999;
        }
    </style>
</head>
<body >
<div id="app">

    <div class="am-add">
        <div class="swiper-container ng-swiper">
            <div class="swiper-wrapper">
                <div class="swiper-slide" v-for="(item,index) in swiperList" v-bind:key="index">
                    <a href="#">
                        <div class="swiper-slide"><img :src="item.img" style="width: 100%;height:400px "></div>
                    </a>
                </div>
            </div>
            <div class="swiper-pagination"></div>
            <div class="swiper-button-prev ng-swiper-ovleft"><img src="../../xznstatic/img/snne1.png"/></div>
            <div class="swiper-button-next ng-swiper-ovright"><img src="../../xznstatic/img/snne2.png"/></div>
        </div>
    </div>
    <!-- 新增修改模态框 -->
    <div class="modal fade" id="addOrUpdateAddressModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog" style="z-index: 3000">
            <div class="modal-content">
                <%-- 模态框标题--%>
                <div class="modal-header">
                    <h5 class="modal-title"  id="addressTitle" >标题</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <%-- 模态框内容 --%>
            <form class="layui-form layui-form-pane" lay-filter="myForm" id ="myForm">
                <div class="modal-body">
                        <!-- 当前表的 -->
                        <input type="hidden"  id="id" name="id"/>
                        <div class="layui-form-item" pane>
                            <label class="layui-form-label">收货人：</label>
                            <div class="layui-input-block">
                                <input  type="text" name="addressName" id="addressName" placeholder="收货人" lay-verify="required" autocomplete="off"
                                       class="layui-input">
                            </div>
                        </div>

                        <!-- 手机号 -->
                        <div class="layui-form-item" pane>
                            <label class="layui-form-label">电话：</label>
                            <div class="layui-input-inline">
                                <input  type="text" name="addressPhone" id="addressPhone"  lay-verify="phone|required"   placeholder="电话" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item" pane>
                            <label class="layui-form-label">地址：</label>
                            <div class="layui-input-block">
                                <input  type="text" name="addressDizhi" id="addressDizhi" placeholder="地址" lay-verify="required" autocomplete="off"
                                       class="layui-input">
                            </div>
                        </div>

                        <div class="layui-form-item" pane>
                            <label class="layui-form-label">是否默认地址：</label>
                            <div class="layui-input-block">
                                <select name="isdefaultTypes" id="isdefaultTypes" lay-filter="isdefaultTypes">
                                    <option v-for="item in isdefaultTypesList" :value="item.codeIndex" :key="item.codeIndex">{{ item.indexName }}</option>
                                </select>
                            </div>
                        </div>
                </div>
                <%-- 模态框按钮 --%>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button class="btn btn-theme btn-submit" lay-submit lay-filter="addOrUpdateAddress">提交</button>
                </div>
            </form>
            </div>
        </div>
    </div>

    <!-- 标题 -->
    <h2 style="margin-top: 20px;" class="index-title">USER ADDRESS</h2>
    <div class="line-container">
        <p class="line" style="background: #EEEEEE;"> 收货地址 </p>
    </div>
    <!-- 标题 -->

    <div class="center-container">
        <!-- 个人中心菜单 config.js-->
        <div class="left-container">
            <ul class="layui-nav layui-nav-tree">
                <li v-for="(item,index) in centerMenu" v-bind:key="index" class="layui-nav-item"
                    :class="item.url=='../address/list.jsp'?'layui-this':''">
                    <a :href="'javascript:jump(\''+item.url+'\')'">{{item.name}}</a>
                </li>
            </ul>
        </div>
        <!-- 个人中心菜单 -->
        <div class="right-container" style="padding-top: 0;">
            <div class="btn-container" style="margin-bottom: 0;">
                <button @click="addAddress()"type="button" class="layui-btn layui-btn-lg btn-theme">
                    <i class="layui-icon">&#xe654;</i> 添加新地址
                </button>
            </div>
            <table class="layui-table" lay-skin="nob">
                <thead>
                <tr>
                    <th>主键 </th>
                    <th>收货人 </th>
                    <th>电话 </th>
                    <th>地址 </th>
                    <th>是否默认地址 </th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <tr v-for="(item,index) in dataList" v-bind:key="index">

                    <th style="width: 60px;">{{item.id}}</th>
                    <th style="width: 80px;">{{item.addressName}}</th>
                    <th style="width: 100px;">{{item.addressPhone}}</th>
                    <th>{{item.addressDizhi}}</th>
                    <th style="width: 115px;">{{item.isdefaultValue}}</th>
                    <td style="width: 150px;">
                        <button @click="updateeAddress(item.id)" type="button"
                                class="layui-btn layui-btn-radius layui-btn-sm layui-btn-warm">
                            <i class="layui-icon">&#xe642;</i> 修改
                        </button>
                        <button @click="deleteClick(item.id)" type="button"
                                class="layui-btn layui-btn-radius layui-btn-sm btn-theme">
                            <i class="layui-icon">&#xe640;</i> 删除
                        </button>
                    </td>
                </tr>
                </tbody>
            </table>
            <div class="pager" id="pager"></div>
        </div>
    </div></div>


<script src="../../xznstatic/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
<script src="../../layui/layui.js"></script>
<script src="../../js/vue.js"></script>
<script src="../../js/config.js"></script>
<script src="../../modules/config.js"></script>
<script src="../../js/utils.js"></script>

<script>
    var vue = new Vue({
        el: '#app',
        data: {
            swiperList: [],//轮播图
            dataList: [],//数据
        // 当前表字典表数据
            isdefaultTypesList : [],
            addressTypes: 0,//类型
            limit: 10,
            projectName: projectName,//项目名
            centerMenu: centerMenu

        },
        updated: function() {
            layui.form.render(null, 'myForm');
        },
        filters: {
            //把字符串去除无用字符 如果字段长度大于60  就截取到60
            subString: function(val) {
                if (val) {
                    val = val.replace(/<[^<>]+>/g, '').replace(/undefined/g, '');
                    if (val.length > 60) {
                        val = val.substring(0, 60);
                        val+='...';
                    }

                    return val;
                }
                return '';
            }
        },
        computed: {
        },
        methods: {
            jump(url) {
                jump(url)
            }
			,deleteClick(id) {
				layui.layer.confirm('是否确认删除？', {
					btn: ['删除', '取消'] //按钮
				}, function() {
					layui.http.requestJson(`address/delete`, 'post', [id], function(res) {
						layer.msg('删除成功', {
							time: 2000,
							icon: 6
						}, function(res) {
							window.location.reload();
						});
					})
				});
			}
			,updateeAddress(id) {
				$("#addressTitle").text("修改");
				$("#myForm")[0].reset();
				layui.form.render(null, 'myForm');
				layui.http.request(`address/info/`+id, 'get', {}, function(res) {
					layui.form.val("myForm", res.data);
					layui.form.render(null, 'myForm');
				});
				$('#addOrUpdateAddressModal').modal('show');//打开模态框
			}
			,addAddress() {
                $("#addressTitle").text("新增");
				$("#myForm")[0].reset();
				layui.form.render(null, 'myForm');
				$('#addOrUpdateAddressModal').modal('show');//打开模态框
			}

        }
    });

    layui.use(['layer', 'element', 'carousel', 'laypage','form', 'http', 'jquery', 'laydate', 'tinymce'], function() {
        var layer = layui.layer;
        var element = layui.element;
        var carousel = layui.carousel;
        var laypage = layui.laypage;
        var http = layui.http;
        var form = layui.form;
        var laydate = layui.laydate;
        var tinymce = layui.tinymce;
        window.jQuery = window.$ = jquery = layui.jquery;

        var limit = 10;

        // 获取轮播图 数据
        http.request('config/list', 'get', {
            page: 1,
            limit: 5
        }, function(res) {
            if (res.data.list.length > 0) {
                let swiperList = [];
                res.data.list.forEach(element => {
                    if (element.value != null) {
                        swiperList.push({
                            img: element.value
                        });
                    }
                });
                vue.swiperList = swiperList;
                vue.$nextTick(()=>{
                    var mySwiper = new Swiper('.ng-swiper', {
                        speed: 400,
                        spaceBetween: 100,
                        pagination: '.ng-swiper .swiper-pagination',
                        autoplay : 5000,
                        loop : true,
                        autoplayDisableOnInteraction : false,
                        calculateHeight : true
                    });
                    $(".ng-swiper-ovleft").bind("click",function (){ mySwiper.swipePrev();});
                    $(".ng-swiper-ovright").bind("click",function (){ mySwiper.swipeNext();});
                });
            }
        });
        // 查询当前字典表相关
            // 是否默认地址的查询和初始化
        isdefaultTypesSelect();
    // 当前表的字典表
        // 是否默认地址的查询
        function isdefaultTypesSelect() {
            http.request("dictionary/page?page=1&limit=100&sort=&order=&dicCode=isdefault_types", 'get', {}, function (res) {
                if(res.code == 0){
                    vue.isdefaultTypesList = res.data.list;
                }
            });
        }




		// 获取列表数据
		http.request('address/page', 'get', {
			page: 1,
			limit: limit,
			yonghu: localStorage.getItem('userid')
		}, function(res) {
			vue.dataList = res.data.list
			// 分页
			laypage.render({
				elem: 'pager',
				count: res.data.total,
				limit: limit,
				jump: function(obj, first) {
					//首次不执行
					if (!first) {
						http.request('address/page', 'get', {
							page: obj.curr,
							limit: obj.limit,
							yonghu: localStorage.getItem('userid')
						}, function(res) {
							vue.dataList = res.data.list
						})
					}
				}
			});
		})

		// 提交
        form.on('submit(addOrUpdateAddress)', function (data) {
            data = data.field;
            if (data.id == null || data.id == ""){
                data["yonghuId"]= localStorage.getItem("userid");
                http.requestJson('address/add', 'post', data, function (res) {
                    layer.msg('新增成功', {
                        time: 2000,
                        icon: 6
                    }, function () {
                        back();
                    });
                });
            }else{
                http.requestJson('address/update', 'post', data, function (res) {
                    layer.msg('修改成功', {
                        time: 2000,
                        icon: 6
                    }, function () {
                        back();
                    });
                });
            }
            return false
        });
    });
</script>

<script src="../../xznstatic/js/idangerous.swiper.min.js"></script>
<script src="../../xznstatic/js/aos.js" type="text/javascript" charset="utf-8"></script>
<script src="../../xznstatic/js/jquery.superslide.2.1.1.js"></script>
<script src="../../xznstatic/js/app.js"></script>
<script src="../../xznstatic/js/lightbox.js"></script>

<script>
    window.xznResize = function() {
        var mySwiper2 = new Swiper('.ng-inzep',{
            calculateHeight : true,
            loop : true,
            paginationClickable :true,
            pagination: ".ng-inzep .swiper-pagination"
        });

        $(document).bind("scroll",function (){
            if($(".ng-swip-porlist").length > 0){
                if($(window).width() > 769){
                    mySwiper2.params.slidesPerView = 4;
                    mySwiper3.params.slidesPerView = 4;
                }else if($(window).width() < 769){
                    if($(window).width() < 480){
                        mySwiper2.params.slidesPerView = 2;
                        mySwiper3.params.slidesPerView = 2;
                    }else{
                        mySwiper2.params.slidesPerView = 3;
                        mySwiper3.params.slidesPerView = 3;
                    }
                }
            }
        });

        $(window).bind("resize", function () {
            // 强制关闭导航
            if ($(window).width() > 992) { $(".ipad-nav").slideUp(); };

            if ($(".ng-swip-porlist").length > 0) {
                if ($(window).width() > 769) {
                    mySwiper2.params.slidesPerView = 4;
                    mySwiper3.params.slidesPerView = 4;
                } else if ($(window).width() < 769) {
                    if ($(window).width() < 480) {
                        mySwiper2.params.slidesPerView = 2;
                        mySwiper3.params.slidesPerView = 2;
                    } else {
                        mySwiper2.params.slidesPerView = 3;
                        mySwiper3.params.slidesPerView = 3;
                    }
                }
            }

            Spirit_dynamicBG($(".ng-inswbg"), 1600, 616, $(".ng-inswbg"));
            Spirit_CallBack($(".ng-porlist-doc>a"), 280, 200);
            Spirit_CallBack($(".ng-incontlst-img"), 368, 240);
            Spirit_CallBack($(".ng-inzep-ims"), 400, 270);
            Spirit_CallBack($(".ng-isenst-img"), 368, 240);
            Spirit_CallBack($(".ng-prslist-img"), 100, 100);
            Spirit_CallBack($(".ng-vrslist-img"), 260, 170);
            Spirit_CallBack($(".ng-newbve-img-ikk"), 368, 240);

            $(".ng-subc-swiper").css({ "height": $(".ng-subc-swiper").width() });

            if ($(window).width() < 640) {
                $(".am-inside-swf").css({
                    "min-height": $(window).height() - 60
                });
            } else {
                $(".am-inside-swf").css({
                    "min-height": "auto"
                });
            }
        }).resize();
    }
</script>
</body>
</html>
