<%--
  Created by IntelliJ IDEA.
  User: QAQ
  Date: 2019/8/6
  Time: 9:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>账号密码登陆</title>
    <link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
</head>
<body>
<div class="container">
	<h1>账号密码登录</h1>
	<hr/>
	<form action="/user/loginValidate" method="post" commandName="user" role="form">
		<div class="form-group">
			<label for="username">username:</label>
			<input type="text" class="form-control" id="username" name="username" placeholder="Enter Username:"/>
		</div>
		<div class="form-group">
			<label for="password">Password:</label>
			<input type="password" class="form-control" id="password" name="password" placeholder="Enter Password:"/>
		</div>
		<div class="form-group">
			<button type="submit" class="btn btn-sm btn-success">登录</button>
		</div>
	</form>
</div>

</body>
</html>
