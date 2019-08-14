<%--
  Created by IntelliJ IDEA.
  User: QAQ
  Date: 2019/8/13
  Time: 14:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>学生评教界面</title>
</head>
<body>
<div class="container">
    <center>
        <h1>评教系统</h1>
        <form action="/stu/mark">
            <label for="stumajor">你现在所在的班级是：</label>
            <input type="text" name="stumajor" style="width: 300px" class="form-control" id="stumajor" value="${sessionScope.stu.stumajor}" readonly="true">
            <%--<select type="text" name="stumajor" style="width: 300px" class="form-control" id="stumajor1">
                <option value="Java1">Java1</option>
                <option value="Java2">Java2</option>
                <option value="Java3">Java3</option>
                <option value="Java4">Java4</option>
                <option value="大数据">大数据</option>
                <option value="物联网">物联网</option>
            </select>
            <select type="text" name="stumajor" style="width: 300px" class="form-control" id="stumajor1">
            <option value="Java1">Java1</option>
            <option value="Java2">Java2</option>
            <option value="Java3">Java3</option>
            <option value="Java4">Java4</option>
            <option value="大数据">大数据</option>
            <option value="物联网">物联网</option>
        </select>
            <select type="text" name="stumajor" style="width: 300px" class="form-control" id="stumajor1">
                <option value="Java1">Java1</option>
                <option value="Java2">Java2</option>
                <option value="Java3">Java3</option>
                <option value="Java4">Java4</option>
                <option value="大数据">大数据</option>
                <option value="物联网">物联网</option>
            </select>
            <select type="text" name="stumajor" style="width: 300px" class="form-control" id="stumajor1">
                <option value="Java1">Java1</option>
                <option value="Java2">Java2</option>
                <option value="Java3">Java3</option>
                <option value="Java4">Java4</option>
                <option value="大数据">大数据</option>
                <option value="物联网">物联网</option>
            </select>
            <select type="text" name="stumajor" style="width: 300px" class="form-control" id="stumajor1">
                <option value="Java1">Java1</option>
                <option value="Java2">Java2</option>
                <option value="Java3">Java3</option>
                <option value="Java4">Java4</option>
                <option value="大数据">大数据</option>
                <option value="物联网">物联网</option>
            </select>--%>



        </form>
    </center>
</div>

</body>
</html>
