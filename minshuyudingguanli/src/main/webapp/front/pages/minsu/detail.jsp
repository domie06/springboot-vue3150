












<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="true" %>

<!-- 首页 -->
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>首页</title>
    <link rel="stylesheet" href="../../layui/css/layui.css">
    <link rel="stylesheet" href="../../xznstatic/css/bootstrap.min.css" />
    <!-- 样式 -->
    <link rel="stylesheet" href="../../css/style.css"/>
    <!-- 主题（主要颜色设置） -->
    <link rel="stylesheet" href="../../css/theme.css"/>
    <!-- 通用的css -->
    <link rel="stylesheet" href="../../css/common.css"/>
</head>
<body>

<div id="app">
    <div class="data-detail">
        <div class="data-detail-breadcrumb">
					<span class="layui-breadcrumb">
						<a href="../home/home.jsp">首页</a>
						<a><cite>{{detail.minsuName}}</cite></a>
					</span>


        </div>
        <div class="layui-row">
            <div class="layui-col-md5">
                <div class="layui-carousel" id="swiper">
                    <div carousel-item id="swiper-item">
                        <div v-for="(item,index) in swiperList" v-bind:key="index">
                            <img class="swiper-item" :src="item.img">
                        </div>
                    </div>
                </div>

            </div>
            <div class="layui-col-md7" style="padding-left: 20px;">
                <h1 class="title">{{detail.minsuName}}</h1>

                <div v-if="detail.fagwuTypes" class="detail-item">
                    <span>房屋类型：</span>
                    <span class="desc">
                        {{detail.fagwuValue}}
                    </span>
                </div>

                <div v-if="detail.minsuNewMoney" class="detail-item">
                    <span>价格/天：</span>
                    <span class="desc">
                                {{detail.minsuNewMoney}}
                    </span>
                </div>

                <div v-if="detail.minsuAddress" class="detail-item">
                    <span>地址：</span>
                    <span class="desc">
                                {{detail.minsuAddress}}
                    </span>
                </div>

                <div v-if="detail.fwstateTypes" class="detail-item">
                    <span>房屋状态：</span>
                    <span class="desc">
                        {{detail.fwstateValue}}
                    </span>
                </div>

                <div class="detail-item">

                    <button v-if="detail.fwstateTypes == 2"  type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" type="button" class="layui-btn btn-submit">
                        立即预定
                    </button>
                </div>


                <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                     aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">租房截至日期设置</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <div class="row">
                                    <div class="col-sm-4" style="margin-top: 8px">
                                        输入入住日期：
                                    </div>
                                    <div class="col-sm-8">
                                        <input type="date" id="ruzuTime" class="form-control form-control-sm">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-4" style="margin-top: 8px">
                                        输入退房日期：
                                    </div>
                                    <div class="col-sm-8">
                                        <input type="date" id="tuifangTime" class="form-control form-control-sm">
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
                                <button type="button" id="receive" @click="buyTap" class="btn btn-primary">发布</button>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="detail-item" style="text-align: right;">
                </div>
            </div>
        </div>

        <div class="layui-row">
            <div class="layui-tab layui-tab-card">

                <ul class="layui-tab-title">
                    <li class="layui-this">详情</li>
                </ul>

                <div class="layui-tab-content">
                    <div class="layui-tab-item layui-show">
                        <div v-html="myFilters(detail.minsuContent)"></div>
                    </div>


                </div>
            </div>
        </div>
    </div>
</div>

<script src="../../layui/layui.js"></script>
<script src="../../js/vue.js"></script>
<!-- 组件配置信息 -->
<script src="../../js/config.js"></script>
<!-- 扩展插件配置信息 -->
<script src="../../modules/config.js"></script>
<!-- 工具方法 -->
<script src="../../js/utils.js"></script>
<!-- 校验格式工具类 -->
<script src="../../js/validate.js"></script>
<!-- 地图 -->
<script type="text/javascript" src="../../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
<link href="../../../resources/css/bootstrap.min.css" rel="stylesheet">


<script>
    Vue.prototype.myFilters= function (msg) {
        if(msg != null){
            return msg.replace(/\n/g, "<br>");
        }else{
            return "";
        }
    };
    var vue = new Vue({
        el: '#app',
        data: {
            // 轮播图
            swiperList: [],
            // 数据详情
            detail: {
                id: 0
            },
            // 当前详情页表
            detailTable: 'minsu',
        },
        //  清除定时器
        destroyed: function () {
            // 不知道具体作用
            // window.clearInterval(this.inter);
        },
        methods: {
            jump(url) {
                jump(url)
            },
            // 立即租房
            buyTap() {
                if(new Date().getTime() > new Date($("#ruzuTime").val()).getTime()){
                    alert("入住日期不能小于当前日期")
                    return false
                }
                if(new Date($("#ruzuTime").val()).getTime() > new Date($("#tuifangTime").val()).getTime()){
                    alert("退房日期不能小于入住日期")
                    return false
                }
                var data = {}
                data.minsuId =vue.detail.id
                data.ruzhuTime =$("#ruzuTime").val()
                data.tuifangTime =$("#tuifangTime").val()



                layui.http.requestJson(`minsuzulin/save`, 'post', data, function (res) {
                    if (res && res.code === 0) {
                        alert("预定成功")
                        window.location.reload();
                    } else {
                        this.$message.error(data.msg);
                    }
                });
            },
        }
    });

    layui.use(['layer', 'form', 'element', 'carousel', 'http', 'jquery', 'laypage'], function () {
        var layer = layui.layer;
        var element = layui.element;
        var form = layui.form;
        var carousel = layui.carousel;
        var http = layui.http;
        var jquery = layui.jquery;
        var laypage = layui.laypage;

        var limit = 10;

        // 设置数量
        jquery('#buyNumber').val(vue.buyNumber);

        // 数据ID
        var id = http.getParam('id');
        vue.detail.id = id;
        // 当前详情
        http.request(`${vue.detailTable}/detail/` + id, 'get', {}, function (res) {
            // 详情信息
            vue.detail = res.data;
           // 轮播图片
            vue.swiperList = vue.detail.minsuPhoto ? vue.detail.minsuPhoto.split(",") : [];
            var swiperItemHtml = '';
            for (let item of vue.swiperList) {
                swiperItemHtml +=
                        '<div>' +
                        '<img class="swiper-item" src="' + item + '">' +
                        '</div>';
            }
            jquery('#swiper-item').html(swiperItemHtml);
            // 轮播图
            carousel.render({
                elem: '#swiper',
                width: swiper.width, height: swiper.height,
                arrow: swiper.arrow,
                anim: swiper.anim,
                interval: swiper.interval,
                indicator: swiper.indicator
            });
        });


    });





</script>
</body>
</html>
