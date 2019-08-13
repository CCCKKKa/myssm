<%--
  Created by IntelliJ IDEA.
  User: QAQ
  Date: 2019/8/2
  Time: 15:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>学生登陆页面</title>
    <link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <center>
        <h1>学生登陆</h1>
        <br><br><br>
        <form action="/stu/stuLogin" method="post">
            <div class="form-group">
                <label for="stuid">stuid</label>
                <input type="text" style="width: 300px" class="form-control" id="stuid" name="stuid" placeholder="Enter Stuid:"/>
            </div>
            <div class="form-group">
                <label for="stupsd">Password:</label>
                <input type="password" style="width: 300px" class="form-control" id="stupsd" name="stupsd" placeholder="Enter Password:"/>
            </div>
            <div class="form-group" >
                <button type="submit" style="width: 300px" class="btn btn-sm btn-success">登录</button>
            </div>
        </form>

        <button type="button" style="width: 300px" class="btn btn-sm btn-success">
            <a href="/user/welcome" style="text-decoration: none;color: white">主页</a>
        </button>

    </center>
    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</div>
</body>
</html>
