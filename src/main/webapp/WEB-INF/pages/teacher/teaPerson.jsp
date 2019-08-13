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
    <title>教师个人信息管理</title>
    <link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
</head>

<script>
    function doValidate1() {
        var phoneNumReg = /(^[0-9]{3,4}\-[0-9]{7}$)|(^[0-9]{7}$)|(^[0-9]{3,4}[0-9]{7}$)|(^0{0,1}13[0-9]{9}$)/
        if (!phoneNumReg.test(document.form1.tephone.value)) {
            alert('请填写正确电话号码!!');
            document.form1.tephone.focus();
            return false;
        }
        var mailReg = /^[a-zA-Z0-9_-]+@([a-zA-Z0-9]+\.)+(com|cn|net|org)$/
        if (!mailReg.test(document.form1.temail.value)) {
            alert("请填写正确的邮箱！");
            document.form1.temail.focus();
            return false;
        }
        alert("修改成功")
        return true;
    }

</script>
<body>
<center>
    <h1>教师修改个人信息界面</h1>
    <br><br>
    <form action="/tea/updateTeaPerson" name="form1"  method="post" onsubmit="return doValidate1()">
        <label for="teid1">teid</label>
        <input type="text" name="teid" style="width: 300px" class="form-control" id="teid1" value="${sessionScope.tea.teid }" readonly="true">
        <br><br>
        <label for="tename1">tename</label>
        <input type="text" name="tename" style="width: 300px" class="form-control" id="tename1" value="${sessionScope.tea.tename }">
        <br><br>
        <label for="tepsd1">tepsd</label>
        <input type="text" name="tepsd" style="width: 300px" class="form-control" id="tepsd1" value="${sessionScope.tea.tepsd }">
        <br><br>
        <label for="major1">major</label>
        <select type="text" name="major" style="width: 300px" class="form-control" id="major1">
            <option value="Java1">Java1</option>
            <option value="Java2">Java2</option>
            <option value="Java3">Java3</option>
            <option value="Java4">Java4</option>
            <option value="大数据">大数据</option>
            <option value="物联网">物联网</option>
        </select>
        <br><br>
        <label for="tephone1">tephone</label>
        <input type="text" name="tephone" style="width: 300px" class="form-control" id="tephone1" value="${sessionScope.tea.tephone }">
        <br><br>
        <label for="temail1">temail</label>
        <input type="text" name="temail" style="width: 300px" class="form-control" id="temail1" value="${sessionScope.tea.temail }">
        <br><br>
        <button type="button" class="btn btn-default" data-dismiss="modal"><a href="/tea/teaManage">返回</a> </button>
        <button type="submit" class="btn btn-primary">修改</button>
    </form>
</center>
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>
</html>
