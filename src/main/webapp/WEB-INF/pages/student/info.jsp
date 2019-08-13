<%--
  Created by IntelliJ IDEA.
  User: QAQ
  Date: 2019/8/6
  Time: 13:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>学生管理</title>
    <script src="/js/jquery-1.12.3.min.js"></script>
    <link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/jquery.bootgrid.min.css">
    <script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <script src="/js/jquery.bootgrid.min.js"></script>
    <script type="text/javascript" src="/js/bootstrap-datetimepicker.min.js"></script>
    <link rel="stylesheet" href="/css/bootstrap-datetimepicker.min.css" type="text/css"></link>
    <script>
        function doValidate() {
            var phoneNumReg = /(^[0-9]{3,4}\-[0-9]{7}$)|(^[0-9]{7}$)|(^[0-9]{3,4}[0-9]{7}$)|(^0{0,1}13[0-9]{9}$)/
            if(!phoneNumReg.test(document.forma.phone.value)) {
                alert('请填写正确电话号码!!');
                document.forma.phone.focus();
                return false;
            }
            var mailReg=/^[a-zA-Z0-9_-]+@([a-zA-Z0-9]+\.)+(com|cn|net|org)$/
            if (!mailReg.test(document.forma.mail.value)){
                alert("请填写正确的邮箱！");
                document.forma.mail.focus();
                return false;
            }
            return true;
        }
        function doValidate1() {
            var phoneNumReg = /(^[0-9]{3,4}\-[0-9]{7}$)|(^[0-9]{7}$)|(^[0-9]{3,4}[0-9]{7}$)|(^0{0,1}13[0-9]{9}$)/
            if(!phoneNumReg.test(document.form1.phone.value)) {
                alert('请填写正确电话号码!!');
                document.form1.phone.focus();
                return false;
            }
            var mailReg=/^[a-zA-Z0-9_-]+@([a-zA-Z0-9]+\.)+(com|cn|net|org)$/
            if (!mailReg.test(document.form1.mail.value)){
                alert("请填写正确的邮箱！");
                document.form1.mail.focus();
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <nav class="navbar navbar-inverse">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar">*****</span>
                        </button>
                        <a class="navbar-brand" href="#">学生信息管理系统</a>
                    </div>
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav">
                            <li><a href="/user/teaLogin">logout</a></li>
                        </ul>
                    </div>
                </div>
            </nav>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <h2>student信息</h2>
            <!-- Single button -->
            <div class="btn-group">
                <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                   查询教师信息 <span class="caret"></span>
                </button>
                <ul class="dropdown-menu">
                    <li><a href="/stu/info2">查询教师信息</a></li>
                    <li><a href="#">查询学生信息</a></li>
                </ul>
            </div>
            <a class="btn btn-primary" href="/stu/stuManage">返回上一页</a>
            <table id="grid-data" class="table table-condensed table-hover table-striped">
                <thead>
                <tr>
                    <th data-column-id="stuid"  data-identifier="true" data-type="numeric"> stuid</th>
                    <th data-column-id="stuname">stuname</th>
                    <th data-column-id="stumajor" data-order="desc">stumajor</th>
                    <th data-column-id="phone">phone</th>
                    <th data-column-id="mail">mail</th>
                </tr>
                </thead>
            </table>
        </div>
    </div>
</div>
</div>
<script>
    $(document).ready(function(){
        var grid = $("#grid-data").bootgrid({
            ajax:true,
            post: function ()
            {
                return {
                    id: "b0df282a-0d67-40e5-8558-c9e93b7befed"
                };
            },
            url:"/stu/stuList",
            formatters: {
                "commands": function(column, row)
                {
                    return "<button type=\"button\" class=\"btn btn-xs btn-default command-edit\" data-row-id=\"" + row.stuid + "\">编辑<span class=\"fa fa-pencil\"></span></button> " +
                        "<button type=\"button\" class=\"btn btn-xs btn-default command-delete\" data-row-id=\"" + row.stuid + "\">删除<span class=\"fa fa-trash-o\"></span></button>";
                }
            }
        }).on("loaded.rs.jquery.bootgrid", function()
        {
            grid.find(".command-edit").on("click", function(e)
            {
                $(".stumodal").modal();
                $.post("/stu/getStuInfo",{stuid:$(this).data("row-id")},function(str){
                    $("#stuid2").val(str.stuid);
                    $("#stuname2").val(str.stuname);
                    $("#stupsd2").val(str.stupsd);
                    $("#stumajor2").val(str.stumajor);
                    $("#phone2").val(str.phone);
                    $("#mail2").val(str.mail);
                    $("#score2").val(str.score);
                });
            }).end().find(".command-delete").on("click", function(e)
            {
                alert("You pressed delete on row: " + $(this).data("row-id"));
                $.post("/stu/delStu",{stuid:$(this).data("row-id")},function(){
                    alert("删除成功");
                    $("#grid-data").bootgrid("reload");
                });
            });
        });
    });

    $(document).ready(function(){
        $("#add").click(function(){
            $(".addmodal").modal();
        });
    });
    //反选
    $("#ReverseSelect").on("click",function(){

        $("#tab td :checkbox").each(function(){
            //遍历所有复选框，然后取值进行 !非操作
            $(this).prop("checked", !$(this).prop("checked"));
        })
    });

    $("#btn_print").click(function(){
        var $ids = [];
        var $chkBoxes = $('#grid-data').find('input:checked');
        console.log($chkBoxes);
        if ($chkBoxes.length == 0) {
            alert('请选中一行');
            return false;
        }
        //遍历被选中的checkbox集
        $($chkBoxes).each(function () {
            if($(this).val()!='all'){
                $ids.push( $(this).val() );
            }
        });
        var $ids_str = $ids.join(',');
        console.log($ids_str);

        //var a= $('#grid-data').bootgrid('getSelections');
        //if(a.length<=0){
        //    alert("请选中一行")
        //}else{
        //    var b=JSON.stringify( a );
        //

        $.ajax({
            dataType: "json",
            traditional:true,//这使json格式的字符不会被转码
            data: {"stuIds":$ids_str},
            type: "post",
            url: "/stu/batchDeleteStu",
            success : function (data) {
                alert("批量删除成功！");
            },
            error : function (data){
                alert("批量删除成功");
                location.reload();
            }
        });
    });
</script>
</body>
</html>