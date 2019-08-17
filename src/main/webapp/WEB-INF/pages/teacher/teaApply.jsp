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
    <title>评教系统</title>
    <link rel="stylesheet" href="/css/bootstrap-datetimepicker.min.css" type="text/css"></link>
</head>
<body>
<div class="container">
    <center>
        <h1>补考界面</h1>
        <br><br>
        <form action="/stu/stuManage" name="form1"  method="post">
            <br><br>
            <label for="stumajor">${sessionScope.tea.tename}老师，您的评价分数为</a> </label>
            <input type="text" name="stumajor" style="width: 300px" class="form-control" id="stumajor" value="${sessionScope.tea.mark}" readonly="true">
            <div class="form-group" >
                <button type="submit" style="width: 300px" class="btn btn-sm btn-success">返回上一页</button>
            </div>
        </form>
    </center>
</div>

</body>
</html>
