<%--
  Created by IntelliJ IDEA.
  User: QAQ
  Date: 2019/8/8
  Time: 13:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>学生分数查询</title>
    <link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
</head>
<script>
    function doValidate1() {
        var score=document.getElementById("score").value;
        if (score>=60){
            alert("当前不需要补考")
            return true;
        }
    }

</script>
<body>
<div class="container">
    <center>
        <h1>学生分数查询</h1>
        <br><br>
        <form action="/stu/stuScoreMan" name="form1"  method="post" onsubmit="return doValidate1()">
            <br><br>
            <label for="stumajor">你的专业是：</label>
            <input type="text" name="stumajor" style="width: 300px" class="form-control" id="stumajor" value="${sessionScope.stu.stumajor}" readonly="true">
            <br><br>
            <label for="score">你的分数是：</label>
            <input type="text" name="score" style="width: 300px" class="form-control" id="score" value="${sessionScope.stu.score}" readonly>
            <br><br>
            <div class="form-group" >
                <button type="submit" style="width: 300px" class="btn btn-sm btn-success">查询补考信息</button>
            </div>
        </form>
        <button type="button" style="width: 300px" class="btn btn-sm btn-success">
            <a href="/stu/stuManage" style="text-decoration: none;color: white">返回上一页</a>
        </button>
    </center>
    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</div>
</body>
</html>
