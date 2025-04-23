












<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <%@ include file="../../static/head.jsp" %>
    <link href="http://www.bootcss.com/p/bootstrap-datetimepicker/bootstrap-datetimepicker/css/datetimepicker.css"
          rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap-select.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <script type="text/javascript" charset="utf-8">
        window.UEDITOR_HOME_URL = "${pageContext.request.contextPath}/resources/ueditor/"; //UEDITOR_HOME_URL、config、all这三个顺序不能改变
    </script>
    <script type="text/javascript" charset="utf-8"
            src="${pageContext.request.contextPath}/resources/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8"
            src="${pageContext.request.contextPath}/resources/ueditor/ueditor.all.min.js"></script>
    <script type="text/javascript" charset="utf-8"
            src="${pageContext.request.contextPath}/resources/ueditor/lang/zh-cn/zh-cn.js"></script>
</head>
<style>
    .error {
        color: red;
    }
</style>
<body>
<!-- Pre Loader -->
<div class="loading">
    <div class="spinner">
        <div class="double-bounce1"></div>
        <div class="double-bounce2"></div>
    </div>
</div>
<!--/Pre Loader -->
<div class="wrapper">
    <!-- Page Content -->
    <div id="content">
        <!-- Top Navigation -->
        <%@ include file="../../static/topNav.jsp" %>
        <!-- Menu -->
        <div class="container menu-nav">
            <nav class="navbar navbar-expand-lg lochana-bg text-white">
                <button class="navbar-toggler" type="button" data-toggle="collapse"
                        data-target="#navbarSupportedContent"
                        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="ti-menu text-white"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul id="navUl" class="navbar-nav mr-auto">

                    </ul>
                </div>
            </nav>
        </div>
        <!-- /Menu -->
        <!-- Breadcrumb -->
        <!-- Page Title -->
        <div class="container mt-0">
            <div class="row breadcrumb-bar">
                <div class="col-md-6">
                    <h3 class="block-title">编辑民宿信息</h3>
                </div>
                <div class="col-md-6">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a href="${pageContext.request.contextPath}/index.jsp">
                                <span class="ti-home"></span>
                            </a>
                        </li>
                        <li class="breadcrumb-item">民宿信息管理</li>
                        <li class="breadcrumb-item active">编辑民宿信息</li>
                    </ol>
                </div>
            </div>
        </div>
        <!-- /Page Title -->

        <!-- /Breadcrumb -->
        <!-- Main Content -->
        <div class="container">

            <div class="row">
                <!-- Widget Item -->
                <div class="col-md-12">
                    <div class="widget-area-2 lochana-box-shadow">
                        <h3 class="widget-title">民宿信息信息</h3>
                        <form id="addOrUpdateForm">
                            <div class="form-row">
                            <!-- 级联表的字段 -->
                                    <div class="form-group col-md-6 aaaaaa fangdong">
                                        <label>房东</label>
                                        <div>
                                            <select style="width: 450px" id="fangdongSelect" name="fangdongSelect"
                                                    class="selectpicker form-control"  data-live-search="true"
                                                    title="请选择" data-header="请选择" data-size="5" data-width="650px">
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group col-md-6 fangdong">
                                        <label>房东姓名</label>
                                        <input style="width: 450px" id="fangdongName" name="fangdongName" class="form-control"
                                               placeholder="房东姓名" readonly>
                                    </div>
                                    <div class="form-group col-md-6 fangdong">
                                        <label>身份证号</label>
                                        <input style="width: 450px" id="fangdongIdNumber" name="fangdongIdNumber" class="form-control"
                                               placeholder="身份证号" readonly>
                                    </div>
                                    <div class="form-group col-md-6 fangdong">
                                        <label>手机号</label>
                                        <input style="width: 450px" id="fangdongPhone" name="fangdongPhone" class="form-control"
                                               placeholder="手机号" readonly>
                                    </div>
                                    <div class="form-group col-md-6 fangdong">
                                        <label>照片</label>
                                        <img id="fangdongPhotoImg" src="" width="100" height="100">
                                    </div>
                            <!-- 当前表的字段 -->
                                    <input id="updateId" name="id" type="hidden">
                                    <div class="form-group col-md-6 minsuNameDiv">
                                        <label>民宿名称</label>
                                        <input style="width: 450px" id="minsuName" name="minsuName" class="form-control"
                                               placeholder="民宿名称">
                                    </div>
                                    <div class="form-group col-md-6 fagwuTypesDiv">
                                        <label>房屋类型</label>
                                        <select style="width: 450px" id="fagwuTypesSelect" name="fagwuTypes" class="form-control">
                                        </select>
                                    </div>
                                    <div class="form-group col-md-6 minsuNewMoneyDiv">
                                        <label>价格/天</label>
                                        <input style="width: 450px" id="minsuNewMoney" name="minsuNewMoney" class="form-control"
                                               onchange="minsuNewMoneyChickValue(this)" placeholder="价格/天">
                                    </div>
                                    <div class="form-group col-md-6 minsuPhotoDiv">
                                        <label>房屋图片</label>
                                        <img id="minsuPhotoImg" src="" width="100" height="100">
                                        <input name="file" type="file" id="minsuPhotoupload"
                                               class="form-control-file">
                                        <input name="minsuPhoto" id="minsuPhoto-input" type="hidden">
                                    </div>
                                    <div class="form-group col-md-6 minsuAddressDiv">
                                        <label>地址</label>
                                        <input style="width: 450px" id="minsuAddress" name="minsuAddress" class="form-control"
                                               placeholder="地址">
                                    </div>
                                    <div class="form-group col-md-6 fwstateTypesDiv">
                                        <label>房屋状态</label>
                                        <select style="width: 450px" id="fwstateTypesSelect" name="fwstateTypes" class="form-control">
                                        </select>
                                    </div>
                                <input id="fangdongId" name="fangdongId" type="hidden">
                                    <div class="form-group  col-md-6 minsuContentDiv">
                                        <label>具体信息</label>
                                        <input id="minsuContentupload" name="file" type="file">
                                        <script id="minsuContentEditor" type="text/plain"
                                                style="width:100%;height:230px;"></script>
                                        <script type = "text/javascript" >
                                        //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
                                        //相见文档配置属于你自己的编译器
                                        var minsuContentUe = UE.getEditor('minsuContentEditor', {
                                            toolbars: [
                                                [
                                                    'undo', //撤销
                                                    'bold', //加粗
                                                    'redo', //重做
                                                    'underline', //下划线
                                                    'horizontal', //分隔线
                                                    'inserttitle', //插入标题
                                                    'cleardoc', //清空文档
                                                    'fontfamily', //字体
                                                    'fontsize', //字号
                                                    'paragraph', //段落格式
                                                    'inserttable', //插入表格
                                                    'justifyleft', //居左对齐
                                                    'justifyright', //居右对齐
                                                    'justifycenter', //居中对
                                                    'justifyjustify', //两端对齐
                                                    'forecolor', //字体颜色
                                                    'fullscreen', //全屏
                                                    'edittip ', //编辑提示
                                                    'customstyle', //自定义标题
                                                ]
                                            ]
                                        });
                                        </script>
                                        <input type="hidden" name="minsuContent" id="minsuContent-input">
                                    </div>
                                    <div class="form-group col-md-12 mb-3">
                                        <button id="submitBtn" type="button" class="btn btn-primary btn-lg">提交</button>
                                        <button id="exitBtn" type="button" class="btn btn-primary btn-lg">返回</button>
                                    </div>
                            </div>
                        </form>
                    </div>
                </div>
                <!-- /Widget Item -->
            </div>
        </div>
        <!-- /Main Content -->
    </div>
    <!-- /Page Content -->
</div>
<!-- Back to Top -->
<a id="back-to-top" href="#" class="back-to-top">
    <span class="ti-angle-up"></span>
</a>
<!-- /Back to Top -->
<%@ include file="../../static/foot.jsp" %>
<script src="${pageContext.request.contextPath}/resources/js/vue.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.ui.widget.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.fileupload.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.form.js"></script>
<script type="text/javascript" charset="utf-8"
        src="${pageContext.request.contextPath}/resources/js/validate/jquery.validate.min.js"></script>
<script type="text/javascript" charset="utf-8"
        src="${pageContext.request.contextPath}/resources/js/validate/messages_zh.js"></script>
<script type="text/javascript" charset="utf-8"
        src="${pageContext.request.contextPath}/resources/js/validate/card.js"></script>
<script type="text/javascript" charset="utf-8"
        src="${pageContext.request.contextPath}/resources/js/datetimepicker/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript" charset="utf-8"
                 src="${pageContext.request.contextPath}/resources/js/bootstrap-select.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/laydate.js"></script>
<script>
    <%@ include file="../../utils/menu.jsp"%>
    <%@ include file="../../static/setMenu.js"%>
    <%@ include file="../../utils/baseUrl.jsp"%>

    var tableName = "minsu";
    var pageType = "add-or-update";
    var updateId = "";
    var crossTableId = -1;
    var crossTableName = '';
    var ruleForm = {};
    var crossRuleForm = {};


    // 下拉框数组
        <!-- 当前表的下拉框数组 -->
    var fagwuTypesOptions = [];
    var fwstateTypesOptions = [];
        <!-- 级联表的下拉框数组 -->
    var fangdongOptions = [];

    var ruleForm = {};


    // 文件上传
    function upload() {

        <!-- 当前表的文件上传 -->
        $('#minsuPhotoupload').fileupload({
            url: baseUrl + 'file/upload',
            headers: {token: window.sessionStorage.getItem("token")},
            dataType: 'json',
            done: function (e, data) {
                var photoUrl= baseUrl + 'file/download?fileName=' + data.result.file;
                document.getElementById('minsuPhotoImg').setAttribute('src',photoUrl);
                document.getElementById('minsuPhoto-input').setAttribute('value',photoUrl);
            }
        });


        $('#minsuContentupload').fileupload({
            url: baseUrl + 'file/upload',
            headers: {token: window.sessionStorage.getItem("token")},
            dataType: 'json',
            done: function (e, data) {
                UE.getEditor('minsuContentEditor').execCommand('insertHtml', '<img src=\"' + baseUrl + 'upload/' + data.result.file + '\" width=900 height=560>');
            }
        });


    }

    // 表单提交
    function submit() {
        if (validform() == true && compare() == true) {
            let data = {};
            getContent();
            if(window.sessionStorage.getItem('role') != '房东'){//当前登录用户不为这个
                if($("#fangdongId") !=null){
                    var fangdongId = $("#fangdongId").val();
                    if(fangdongId == null || fangdongId =='' || fangdongId == 'null'){
                        alert("所属房东不能为空");
                        return;
                    }
                }
            }
            let value = $('#addOrUpdateForm').serializeArray();
            $.each(value, function (index, item) {
                data[item.name] = item.value;
            });
            let json = JSON.stringify(data);
            var urlParam;
            var successMes = '';
            if (updateId != null && updateId != "null" && updateId != '') {
                urlParam = 'update';
                successMes = '修改成功';
            } else {
                urlParam = 'save';
                    successMes = '添加成功';

            }
            httpJson("minsu/" + urlParam, "POST", data, (res) => {
                if(res.code == 0){
                    window.sessionStorage.removeItem('addminsu');
                    window.sessionStorage.removeItem('updateId');
                    let flag = true;
                    if (flag) {
                        alert(successMes);
                    }
                    if (window.sessionStorage.getItem('onlyme') != null && window.sessionStorage.getItem('onlyme') == "true") {
                        window.sessionStorage.removeItem('onlyme');
                        window.sessionStorage.setItem("reload","reload");
                        window.parent.location.href = "${pageContext.request.contextPath}/index.jsp";
                    } else {
                        window.location.href = "list.jsp";
                    }
                }
            });
        } else {
            alert("表单未填完整或有错误");
        }
    }

    // 查询列表
        <!-- 查询当前表的所有列表 -->
        function fagwuTypesSelect() {
            //填充下拉框选项
            http("dictionary/page?page=1&limit=100&sort=&order=&dicCode=fagwu_types", "GET", {}, (res) => {
                if(res.code == 0){
                    fagwuTypesOptions = res.data.list;
                }
            });
        }
        function fwstateTypesSelect() {
            //填充下拉框选项
            http("dictionary/page?page=1&limit=100&sort=&order=&dicCode=fwstate_types", "GET", {}, (res) => {
                if(res.code == 0){
                    fwstateTypesOptions = res.data.list;
                }
            });
        }
        <!-- 查询级联表的所有列表 -->
        function fangdongSelect() {
            //填充下拉框选项
            http("fangdong/page?page=1&limit=100&sort=&order=", "GET", {}, (res) => {
                if(res.code == 0){
                    fangdongOptions = res.data.list;
                }
            });
        }

        function fangdongSelectOne(id) {
            http("fangdong/info/"+id, "GET", {}, (res) => {
                if(res.code == 0){
                ruleForm = res.data;
                fangdongShowImg();
                fangdongShowVideo();
                fangdongDataBind();
            }
        });
        }



    // 初始化下拉框
    <!-- 初始化当前表的下拉框 -->
        function initializationFagwutypesSelect(){
            var fagwuTypesSelect = document.getElementById('fagwuTypesSelect');
            if(fagwuTypesSelect != null && fagwuTypesOptions != null  && fagwuTypesOptions.length > 0 ){
                for (var i = 0; i < fagwuTypesOptions.length; i++) {
                    fagwuTypesSelect.add(new Option(fagwuTypesOptions[i].indexName,fagwuTypesOptions[i].codeIndex));
                }
            }
        }
        function initializationFwstatetypesSelect(){
            var fwstateTypesSelect = document.getElementById('fwstateTypesSelect');
            if(fwstateTypesSelect != null && fwstateTypesOptions != null  && fwstateTypesOptions.length > 0 ){
                for (var i = 0; i < fwstateTypesOptions.length; i++) {
                    fwstateTypesSelect.add(new Option(fwstateTypesOptions[i].indexName,fwstateTypesOptions[i].codeIndex));
                }
            }
        }

        function initializationfangdongSelect() {
            var fangdongSelect = document.getElementById('fangdongSelect');
            if(fangdongSelect != null && fangdongOptions != null  && fangdongOptions.length > 0 ) {
                for (var i = 0; i < fangdongOptions.length; i++) {
                        fangdongSelect.add(new Option(fangdongOptions[i].fangdongName, fangdongOptions[i].id));
                }

                $("#fangdongSelect").change(function(e) {
                        fangdongSelectOne(e.target.value);
                });
            }

        }



    // 下拉框选项回显
    function setSelectOption() {

        <!-- 当前表的下拉框回显 -->

        var fagwuTypesSelect = document.getElementById("fagwuTypesSelect");
        if(fagwuTypesSelect != null && fagwuTypesOptions != null  && fagwuTypesOptions.length > 0 ) {
            for (var i = 0; i < fagwuTypesOptions.length; i++) {
                if (fagwuTypesOptions[i].codeIndex == ruleForm.fagwuTypes) {//下拉框value对比,如果一致就赋值汉字
                        fagwuTypesSelect.options[i].selected = true;
                }
            }
        }

        var fwstateTypesSelect = document.getElementById("fwstateTypesSelect");
        if(fwstateTypesSelect != null && fwstateTypesOptions != null  && fwstateTypesOptions.length > 0 ) {
            for (var i = 0; i < fwstateTypesOptions.length; i++) {
                if (fwstateTypesOptions[i].codeIndex == ruleForm.fwstateTypes) {//下拉框value对比,如果一致就赋值汉字
                        fwstateTypesSelect.options[i].selected = true;
                }
            }
        }
        <!--  级联表的下拉框回显  -->
            var fangdongSelect = document.getElementById("fangdongSelect");
            if(fangdongSelect != null && fangdongOptions != null  && fangdongOptions.length > 0 ) {
                for (var i = 0; i < fangdongOptions.length; i++) {
                    if (fangdongOptions[i].id == ruleForm.fangdongId) {//下拉框value对比,如果一致就赋值汉字
                        fangdongSelect.options[i+1].selected = true;
                        $("#fangdongSelect" ).selectpicker('refresh');
                    }
                }
            }
    }


    // 填充富文本框
    function setContent() {

        <!-- 当前表的填充富文本框 -->
        if (ruleForm.minsuContent != null && ruleForm.minsuContent != 'null' && ruleForm.minsuContent != '' && $("#minsuContentupload").length>0) {

            var minsuContentUeditor = UE.getEditor('minsuContentEditor');
            minsuContentUeditor.ready(function () {
                var mes = '';
                if(ruleForm.minsuContent != null){
                    mes = ''+ ruleForm.minsuContent;
                    // mes = mes.replace(/\n/g, "<br>");
                }
                minsuContentUeditor.setContent(mes);
            });
        }
    }
    // 获取富文本框内容
    function getContent() {

        <!-- 获取当前表的富文本框内容 -->
        if($("#minsuContentupload").length>0) {
            var minsuContentEditor = UE.getEditor('minsuContentEditor');
            if (minsuContentEditor.hasContents()) {
                $('#minsuContent-input').attr('value', minsuContentEditor.getContent());
            }
        }
    }
    //数字检查
        <!-- 当前表的数字检查 -->
        function minsuNewMoneyChickValue(e){
            var this_val = e.value || 0;
            var reg=/^[0-9]{0,6}(\.[0-9]{1,2})?$/;
            if(!reg.test(this_val)){
                e.value = "";
                alert("只允许输入整数6位,小数2位的数字");
                return false;
            }
        }

    function exit() {
        window.sessionStorage.removeItem("updateId");
        window.sessionStorage.removeItem('addminsu');
        window.location.href = "list.jsp";
    }
    // 表单校验
    function validform() {
        return $("#addOrUpdateForm").validate({
            rules: {
                minsuName: "required",
                fagwuTypes: "required",
                // minsuNewMoney: "required",
                minsuPhoto: "required",
                minsuAddress: "required",
                fwstateTypes: "required",
                fangdongId: "required",
                minsuContent: "required",
            },
            messages: {
                minsuName: "民宿名称不能为空",
                fagwuTypes: "房屋类型不能为空",
                // minsuNewMoney: "价格/天不能为空",
                minsuPhoto: "房屋图片不能为空",
                minsuAddress: "地址不能为空",
                fwstateTypes: "房屋状态不能为空",
                fangdongId: "所属房东不能为空",
                minsuContent: "具体信息不能为空",
            }
        }).form();
    }

    // 获取当前详情
    function getDetails() {
        var addminsu = window.sessionStorage.getItem("addminsu");
        if (addminsu != null && addminsu != "" && addminsu != "null") {
            //注册表单验证
            $(validform());

            $('#submitBtn').text('新增');

        } else {
            $('#submitBtn').text('修改');
            var userId = window.sessionStorage.getItem('userId');
            updateId = userId;//先赋值登录用户id
            var uId  = window.sessionStorage.getItem('updateId');//获取修改传过来的id
            if (uId != null && uId != "" && uId != "null") {
                //如果修改id不为空就赋值修改id
                updateId = uId;
            }
            window.sessionStorage.removeItem('updateId');
            http("minsu/info/" + updateId, "GET", {}, (res) => {
                if(res.code == 0)
                {
                    ruleForm = res.data
                    // 是/否下拉框回显
                    setSelectOption();
                    // 设置图片src
                    showImg();
                    // 设置视频src
                    showVideo();
                    // 数据填充
                    dataBind();
                    // 富文本框回显
                    setContent();
                    //注册表单验证
                    $(validform());
                }

            });
        }
    }

    // 清除可能会重复渲染的selection
    function clear(className) {
        var elements = document.getElementsByClassName(className);
        for (var i = elements.length - 1; i >= 0; i--) {
            elements[i].parentNode.removeChild(elements[i]);
        }
    }

    function dateTimePick() {
    }


    function dataBind() {


    <!--  级联表的数据回显  -->
        fangdongDataBind();


    <!--  当前表的数据回显  -->
        $("#updateId").val(ruleForm.id);
        $("#minsuName").val(ruleForm.minsuName);
        $("#minsuNewMoney").val(ruleForm.minsuNewMoney);
        $("#minsuAddress").val(ruleForm.minsuAddress);
        $("#fangdongId").val(ruleForm.fangdongId);
        $("#minsuContent").val(ruleForm.minsuContent);

    }
    <!--  级联表的数据回显  -->
    function fangdongDataBind(){

                    <!-- 把id赋值给当前表的id-->
        $("#fangdongId").val(ruleForm.id);

        $("#fangdongName").val(ruleForm.fangdongName);
        $("#fangdongIdNumber").val(ruleForm.fangdongIdNumber);
        $("#fangdongPhone").val(ruleForm.fangdongPhone);
    }


    //图片显示
    function showImg() {
        <!--  当前表的图片  -->
        $("#minsuPhotoImg").attr("src",ruleForm.minsuPhoto);

        <!--  级联表的图片  -->
        fangdongShowImg();
    }


    <!--  级联表的图片  -->

    function fangdongShowImg() {
        $("#fangdongPhotoImg").attr("src",ruleForm.fangdongPhoto);
    }



    //视频回显
    function showVideo() {
    <!--  当前表的视频  -->

    <!--  级联表的视频  -->
        fangdongShowVideo();
    }


    <!--  级联表的视频  -->

    function fangdongShowVideo() {
        $("#fangdongPhotoV").attr("src",ruleForm.fangdongPhoto);
    }



    $(document).ready(function () {
        //设置右上角用户名
        $('.dropdown-menu h5').html(window.sessionStorage.getItem('username'))
        //设置项目名
        $('.sidebar-header h3 a').html(projectName)
        //设置导航栏菜单
        setMenu();
        $('#exitBtn').on('click', function (e) {
            e.preventDefault();
            exit();
        });
        //初始化时间插件
        dateTimePick();
        //查询所有下拉框
            <!--  当前表的下拉框  -->
            fagwuTypesSelect();
            fwstateTypesSelect();
            <!-- 查询级联表的下拉框(用id做option,用名字及其他参数做名字级联修改) -->
            fangdongSelect();



        // 初始化下拉框
            <!--  初始化当前表的下拉框  -->
            initializationFagwutypesSelect();
            initializationFwstatetypesSelect();
            <!--  初始化级联表的下拉框  -->
            initializationfangdongSelect();

        $(".selectpicker" ).selectpicker('refresh');
        getDetails();
        //初始化上传按钮
        upload();
    <%@ include file="../../static/myInfo.js"%>
                $('#submitBtn').on('click', function (e) {
                    e.preventDefault();
                    //console.log("点击了...提交按钮");
                    submit();
                });
        readonly();
        window.sessionStorage.removeItem('addminsu');
    });

    function readonly() {
        if (window.sessionStorage.getItem('role') == '管理员') {
            //$('#jifen').attr('readonly', 'readonly');
            //$('#role').attr('style', 'pointer-events: none;');
        }
		else if (window.sessionStorage.getItem('role') == '用户') {
            // $(".aaaaaa").remove();
            $(".yonghu").remove();//删除当前用户的信息
            // 价格/天设置不可选
            $('#minsuNewMoney').attr('readonly', 'readonly');
        }
        else{
            // alert("未知情况.......");
            // var replyTextUeditor = UE.getEditor('replyTextEditor');
            // replyTextUeditor.ready(function () {
            //     replyTextUeditor.setDisabled('fullscreen');
            // });
        }
    }

    //比较大小
    function compare() {
        var largerVal = null;
        var smallerVal = null;
        if (largerVal != null && smallerVal != null) {
            if (largerVal <= smallerVal) {
                alert(smallerName + '不能大于等于' + largerName);
                return false;
            }
        }
        return true;
    }


    // 用户登出
    <%@ include file="../../static/logout.jsp"%>
</script>
</body>

</html>
