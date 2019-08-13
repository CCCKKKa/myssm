<%--
  Created by IntelliJ IDEA.
  User: QAQ
  Date: 2019/8/8
  Time: 15:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>补考信息</title>
    <link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <center>
        <h1>补考界面</h1>
        <br><br>
        <form action="/stu/stuScore" name="form1"  method="post" onsubmit="return doValidate1()">
            <br><br>
            <label for="stumajor">你需要补考的科目是：</label>
            <input type="text" name="stumajor" style="width: 300px" class="form-control" id="stumajor" value="${sessionScope.stu.stumajor}" readonly="true">
            <label>请留意短信通知</label>
            <div class="form-group" >
                <button type="submit" style="width: 300px" class="btn btn-sm btn-success">返回上一页</button>
            </div>
        </form>
    </center>
</div>


</body>
</html>
