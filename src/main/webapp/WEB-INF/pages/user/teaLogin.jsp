<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: QAQ
  Date: 2019/8/2
  Time: 15:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>教师登陆</title>
    <link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <center>
        <h1>教师登陆</h1>
        <br><br><br>
            <hr/>
            <form action="/tea/teaLogin" method="post">
                <div class="form-group">
                    <label for="teid">teid</label>
                    <input type="text" style="width: 300px" class="form-control" id="teid" name="teid" placeholder="Enter Teid:"/>
                </div>
                <div class="form-group">
                    <label for="tepsd">Password:</label>
                    <input type="password" style="width: 300px" class="form-control" id="tepsd" name="tepsd" placeholder="Enter Password:"/>
                </div>
                <div class="form-group" >
                    <button type="submit" style="width: 300px" class="btn btn-sm btn-success">登录</button>
                </div>
            </form>

        <button type="button" style="width: 300px" class="btn btn-sm btn-success">
            <a href="/user/welcome" style="text-decoration: none;color: white">主页</a>
        </button>
    </center>
</div>

    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</div>
</body>
</html>
