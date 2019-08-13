<%--
  Created by IntelliJ IDEA.
  User: QAQ
  Date: 2019/8/5
  Time: 10:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>学生信息管理系统</title>
    <link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <center>
        <h1>欢迎进入管理员界面</h1>
        <br><br><br>
        <button type="button" class="btn btn-primary btn-lg btn-block" style="width: 300px;height: 300px;float: left;margin-left: 266px;margin-top: 20px" >
            <a href="/stu/student/stuList" style="text-decoration: none;color: white">进入学生管理界面</a>
        </button>
        <button type="button" class="btn btn-success btn-lg btn-block" style="width: 300px;height: 300px;float: right;margin-right: 266px;margin-top: 20px">
            <a href="/tea/teacher/teaList" style="text-decoration: none;color: white">进入教师管理界面</a>
        </button>
    </center>
    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</div>

</body>
</html>
