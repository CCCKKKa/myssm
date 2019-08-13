<%--
  Created by IntelliJ IDEA.
  User: QAQ
  Date: 2019/8/2
  Time: 11:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>欢迎来到学生管理系统</title>
    <link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <center>
        <h1>欢迎来到学生管理系统</h1>
        <br><br><br>
        <button type="button" class="btn btn-primary btn-lg btn-block" style="width: 300px;height: 300px;float: left;margin-left: 266px;margin-top: 20px" >
           <a href="/user/login" style="text-decoration: none;color: white">我是管理员</a>
        </button>
        <button type="button" class="btn btn-success btn-lg btn-block" style="width: 300px;height: 300px;float: right;margin-right: 266px;margin-top: 20px">
           <a href="/user/teaLogin" style="text-decoration: none;color: white">我是老师</a>
        </button>
        <button type="button" class="btn btn-info btn-lg btn-block" style="width: 300px;height: 300px;float: left;margin-left: 266px">
            <a href="/user/stuLogin" style="text-decoration: none;color: white">我是学生</a>
        </button>
        <button type="button" class="btn btn-warning btn-lg btn-block" style="width: 300px;height: 300px;float: right;margin-right: 266px">
            <a href="/user/regist" style="text-decoration: none;color: white">学生注册</a>
        </button>
    </center>
    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</div>

</body>
</html>
