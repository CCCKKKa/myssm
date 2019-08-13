<%--
  Created by IntelliJ IDEA.
  User: 17379
  Date: 2019/7/29
  Time: 15:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户注册界面</title>
    <link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
</head>
<script>
    function doValidate1() {
        var phoneNumReg = /(^[0-9]{3,4}\-[0-9]{7}$)|(^[0-9]{7}$)|(^[0-9]{3,4}[0-9]{7}$)|(^0{0,1}13[0-9]{9}$)/
        if (!phoneNumReg.test(document.form1.phone.value)) {
            alert('请填写正确电话号码!!');
            document.form1.phone.focus();
            return false;
        }
        var mailReg = /^[a-zA-Z0-9_-]+@([a-zA-Z0-9]+\.)+(com|cn|net|org)$/
        if (!mailReg.test(document.form1.mail.value)) {
            alert("请填写正确的邮箱！");
            document.form1.mail.focus();
            return false;
        }
        return true;
    }
</script>
<body>
<center>

    <h1>注册界面</h1>
    <br><br>
    <form action="/stu/regStu" name="form1"  method="post" onsubmit="return doValidate1()">
        <label for="stuname1">stuname</label>
        <input type="text" name="stuname" style="width: 300px" class="form-control" id="stuname1">
        <br><br>
        <label for="stupsd1">stupsd</label>
        <input type="text" name="stupsd" style="width: 300px" class="form-control" id="stupsd1">
        <br><br>
        <label for="stumajor1">stumajor</label>
        <select type="text" name="stumajor" style="width: 300px" class="form-control" id="stumajor1">
            <option value="Java1">Java1</option>
            <option value="Java2">Java2</option>
            <option value="Java3">Java3</option>
            <option value="Java4">Java4</option>
            <option value="大数据">大数据</option>
            <option value="物联网">物联网</option>
            </select>
        <br><br>
        <label for="phone1">phone</label>
        <input type="text" name="phone" style="width: 300px" class="form-control" id="phone1">
        <br><br>
        <label for="mail1">mail</label>
        <input type="text" name="mail" style="width: 300px" class="form-control" id="mail1">
        <br><br>
        <input type="hidden" name="Id"style="width: 300px" class="form-control" id="Id">
        <br>
        <button type="button" class="btn btn-default" data-dismiss="modal"><a href="/user/welcome">返回</a> </button>
        <button type="submit" class="btn btn-primary">注册</button>
    </form>
</center>
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>
</html>
