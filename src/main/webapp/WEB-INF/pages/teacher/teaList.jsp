<%--
  Created by IntelliJ IDEA.
  User: QAQ
  Date: 2019/8/5
  Time: 10:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>教师管理界面</title>
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
            if(!phoneNumReg.test(document.forma.tephone.value)) {
                alert('请填写正确电话号码!!');
                document.forma.tephone.focus();
                return false;
            }
            var mailReg=/^[a-zA-Z0-9_-]+@([a-zA-Z0-9]+\.)+(com|cn|net|org)$/
            if (!mailReg.test(document.forma.temail.value)){
                alert("请填写正确的邮箱！");
                document.forma.temail.focus();
                return false;
            }
            return true;
        }
        function doValidate1() {
            var phoneNumReg = /(^[0-9]{3,4}\-[0-9]{7}$)|(^[0-9]{7}$)|(^[0-9]{3,4}[0-9]{7}$)|(^0{0,1}13[0-9]{9}$)/
            if(!phoneNumReg.test(document.form1.tephone.value)) {
                alert('请填写正确电话号码!!');
                document.form1.tephone.focus();
                return false;
            }
            var mailReg=/^[a-zA-Z0-9_-]+@([a-zA-Z0-9]+\.)+(com|cn|net|org)$/
            if (!mailReg.test(document.form1.temail.value)){
                alert("请填写正确的邮箱！");
                document.form1.temail.focus();
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
                        <a class="navbar-brand" href="#">教师信息管理系统</a>
                    </div>
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                          <ul class="nav navbar-nav">
                            <li><a href="/user/logout">log out</a></li>
                        </ul>
                    </div>
                </div>
            </nav>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <h2>teacher信息</h2>
            <a class="btn btn-primary" href="/tea/exportTea">导出数据为excel</a>
            <button type="button" class="btn btn-primary" id="btn_print">全部删除</button>
            <a class="btn btn-primary" href="#" id="add">添加教师</a>
            <div class="btn-group">
                <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    角色切换<span class="caret"></span>
                </button>
                <ul class="dropdown-menu">
                    <li><a href="#">教师</a></li>
                    <li><a href="/stu/student/stuList">学生</a></li>
                </ul>
            </div>
            <table id="grid-data" class="table table-condensed table-hover table-striped">
                <thead>
                <tr>
                    <th data-column-id="selectAll"><input type="checkbox" id="selectAll"/>全选</th>
                    <th data-column-id="teid"  data-identifier="true" data-type="numeric"> teid</th>
                    <th data-column-id="tename" >tename</th>
                    <th data-column-id="tepsd" >tepsd</th>
                    <th data-column-id="major" data-order="desc">major</th>
                    <th data-column-id="tephone">tephone</th>
                    <th data-column-id="temail">temail</th>
                    <th data-column-id="commands" data-formatter="commands" data-sortable="false">Commands</th>
                </tr>
                </thead>
            </table>
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
            url:"/tea/teaList",
            formatters: {
                "commands": function(column, row)
                {
                    return "<button type=\"button\" class=\"btn btn-xs btn-default command-edit\" data-row-id=\"" + row.teid + "\">编辑<span class=\"fa fa-pencil\"></span></button> " +
                        "<button type=\"button\" class=\"btn btn-xs btn-default command-delete\" data-row-id=\"" + row.teid + "\">删除<span class=\"fa fa-trash-o\"></span></button>";
                }
            }
        }).on("loaded.rs.jquery.bootgrid", function()
        {
            grid.find(".command-edit").on("click", function(e)
            {
                $(".temodal").modal();
                $.post("/tea/getTeaInfo",{teid:$(this).data("row-id")},function(str){
                    $("#teid2").val(str.teid);
                    $("#tename2").val(str.tename);
                    $("#tepsd2").val(str.tepsd);
                    $("#major2").val(str.major);
                    $("#tephone2").val(str.tephone);
                    $("#temail2").val(str.temail);
                });
            }).end().find(".command-delete").on("click", function(e)
            {
                alert("You pressed delete on row: " + $(this).data("row-id"));
                $.post("/tea/delTea",{teid:$(this).data("row-id")},function(){
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
            $(this).prop("checked", !$(this).prop("checked")) ;
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
            data: {"teaIds":$ids_str},
            type: "post",
            url: "/tea/batchDeleteTea",
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

<div class="modal fade temodal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">update Tea</h4>
            </div>
            <form action="/tea/updateTea" name="forma" method="post"  onsubmit="return doValidate()" >
                <div class="modal-body">
                    <div class="form-group">
                        <label for="teid2">teid</label>
                        <input type="text" name="teid" class="form-control" id="teid2" readonly="true">
                    </div>
                    <div class="form-group">
                        <label for="tename2">tename</label>
                        <input type="text" name="tename" class="form-control" id="tename2">
                    </div>
                    <div class="form-group">
                        <label for="tepsd2">tepsd</label>
                        <input type="text" name="tepsd" class="form-control" id="tepsd2">
                    </div>
                    <div class="form-group">
                        <label for="major2">stuMajor</label>
                        <select type="text" name="major" class="form-control" id="major2">
                            <option value="Java1">Java1</option>
                            <option value="Java2">Java2</option>
                            <option value="Java3">Java3</option>
                            <option value="Java4">Java4</option>
                            <option value="大数据">大数据</option>
                            <option value="物联网">物联网</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="tephone2">tephone</label>
                        <input type="text" name="tephone" class="form-control" id="tephone2">
                    </div>
                    <div class="form-group">
                        <label for="temail2">temail</label>
                        <input type="text" name="temail" class="form-control" id="temail2">
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
                <h4 class="modal-title">add tea</h4>
            </div>
            <form action="${pageContext.request.contextPath}/tea/addTea" name="form1"  method="post" onsubmit="return doValidate1()">
                <div class="modal-body">
                    <div class="form-group">
                        <label for="tename1">tename</label>
                        <input type="text" name="tename" class="form-control" id="tename1">
                    </div>
                    <div class="form-group">
                        <label for="tepsd1">tepsd</label>
                        <input type="text" name="tepsd" class="form-control" id="tepsd1">
                    </div>
                    <div class="form-group">
                        <label for="major1">major</label>
                        <select type="text" name="major" class="form-control" id="major1">
                            <option value="Java1">Java1</option>
                            <option value="Java2">Java2</option>
                            <option value="Java3">Java3</option>
                            <option value="Java4">Java4</option>
                            <option value="大数据">大数据</option>
                            <option value="物联网">物联网</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="tephone1">phone</label>
                        <input type="text" name="tephone" class="form-control" id="tephone1">
                    </div>
                    <div class="form-group">
                        <label for="temail1">mail</label>
                        <input type="text" name="temail" class="form-control" id="temail1">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Add Tea</button>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>
