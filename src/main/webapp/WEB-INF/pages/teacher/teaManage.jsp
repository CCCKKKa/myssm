<%--
  Created by IntelliJ IDEA.
  User: QAQ
  Date: 2019/8/5
  Time: 18:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>教师管理系统</title>
    <link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <center>
        <h1>欢迎进入教师管理界面</h1>
        <br><br><br>
        <button type="button" class="btn btn-success btn-lg btn-block" style="width: 300px;height: 300px;float: left;margin-left: 266px;margin-top: 20px" >
            <a href="/tea/teaManStu" style="text-decoration: none;color: white">学生管理</a>
        </button>
        <button type="button" class="btn btn-info btn-lg btn-block" style="width: 300px;height: 300px;float: right;margin-right: 266px;margin-top: 20px">
            <a href="/tea/teaPerson" style="text-decoration: none;color: white">个人信息管理</a>
        </button>
        <button type="button" class="btn btn-warning btn-lg btn-block" style="width: 300px;height: 300px;float: left;margin-left: 266px">
            <a href="/tea/teaApply" style="text-decoration: none;color: white">评教系统</a>
        </button>
        <button type="button" class="btn btn-primary btn-lg btn-block" style="width: 300px;height: 300px;float: right;margin-right: 266px">
            <a href="/user/welcome" style="text-decoration: none;color: white">注销系统</a>
        </button>
    </center>
</div>

</body>
</html>
