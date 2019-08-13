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
            <a class="btn btn-primary" href="/user/userChoose">查看评教系统</a>
            <a class="btn btn-primary" href="/tea/teaManage">返回上一页</a>
            <table id="grid-data" class="table table-condensed table-hover table-striped">
                <thead>
                <tr>
                    <th data-column-id="selectAll"><input type="checkbox" id="selectAll"/>全选</th>
                    <th data-column-id="stuid"  data-identifier="true" data-type="numeric"> stuid</th>
                    <th data-column-id="stuname">stuname</th>
                    <th data-column-id="stumajor" data-order="desc">stumajor</th>
                    <th data-column-id="phone">phone</th>
                    <th data-column-id="mail">mail</th>
                    <th data-column-id="score">socre</th>
                    <th data-column-id="commands" data-formatter="commands" data-sortable="false">Commands</th>
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
            selection: true,
            multiSelect: true,
            rowSelect: true,
            keepSelection: true,//让复选框出来
            ReverseSelect:true,
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

<div class="modal fade stumodal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">update Stu</h4>
            </div>
            <form action="/tea/updateStu" name="forma" method="post"  onsubmit="return doValidate()" >
                <div class="modal-body">
                    <div class="form-group">
                        <label for="stuid2">stuid</label>
                        <input type="text" name="stuid" class="form-control" id="stuid2" readonly="true">
                    </div>
                    <div class="form-group">
                        <label for="stuname2">stuname</label>
                        <input type="text" name="stuname" class="form-control" id="stuname2" readonly="true">
                    </div>
                    <div class="form-group">
                        <label for="stupsd2">stupsd</label>
                        <input type="password" name="stupsd" class="form-control" id="stupsd2" readonly="true">
                    </div>
                    <div class="form-group">
                        <label for="stumajor2">stuMajor</label>
                        <input type="text" name="stumajor" class="form-control" id="stumajor2"  readonly="true">
                        </input>
                    </div>
                    <div class="form-group">
                        <label for="phone2">phone</label>
                        <input type="text" name="phone" class="form-control" id="phone2"  readonly="true">
                    </div>
                    <div class="form-group">
                        <label for="mail2">mail</label>
                        <input type="text" name="mail" class="form-control" id="mail2"  readonly="true">
                    </div>
                    <div class="form-group">
                        <label for="score2">score</label>
                        <input type="text" name="score" class="form-control" id="score2">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Save changes</button>
                </div>
            </form>
        </div>
    </div>
</div>

<div class="modal fade addmodal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">add stu</h4>
            </div>
            <form action="${pageContext.request.contextPath}/stu/addStu" name="form1"  method="post" onsubmit="return doValidate1()">
                <div class="modal-body">
                    <div class="form-group">
                        <label for="stuname1">stuname</label>
                        <input type="text" name="stuname" class="form-control" id="stuname1"  readonly="true">
                    </div>
                    <div class="form-group">
                        <label for="stupsd1">stupsd</label>
                        <input type="password" name="stupsd" class="form-control" id="stupsd1"  readonly="true">
                    </div>
                    <div class="form-group">
                        <label for="stumajor1">stumajor</label>
                        <input type="text" name="stumajor" class="form-control" id="stumajor1"  readonly="true">
                        </input>
                    </div>
                    <div class="form-group">
                        <label for="phone1">phone</label>
                        <input type="text" name="phone" class="form-control" id="phone1"  readonly="true">
                    </div>
                    <div class="form-group">
                        <label for="mail1">mail</label>
                        <input type="text" name="mail" class="form-control" id="mail1"  readonly="true">
                    </div>
                    <div class="form-group">
                        <label for="score1">score</label>
                        <input type="text" name="score" class="form-control" id="score1" >
                    </div>
                    <div class="form-group">
                        <input type="hidden" name="Id" class="form-control" id="Id">
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Add Stu</button>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>
