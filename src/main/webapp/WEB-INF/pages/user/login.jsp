<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
	<title>管理员登录</title>
	<link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
</head>
<body>
<%--<div class="container">
	<h1>用户登录</h1>
	<hr/>
	<form:form action="/user/loginValidate" method="post" commandName="user" role="form">
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
	</form:form>
</div>--%>
<center>
<div class="container">
    <h1>用户登录</h1>
    <br>
    <form action="/user/yzmLogin" method="post" commandName="user" name="forma" role="form" onsubmit="return doValidate()">
        <div class="control-group">
        <label>Phone</label>
        <input type="text" style="width: 300px" class="form-control" id="phone" name="phone" placeholder="Phone Number"/>
    </div>
        <div class="input-append">
            <label>Verification</label><br>
            <input type="text" style="width: 150px;height: 30px" class="span2" id="smsCode" name="smsCode" placeholder="Verification Code"/>
            <button class="btn" type="button" onclick="sendCode()"  style="width: 130px"/>点击获取验证码
        </div>
        <br>
        <div class="form-group">
            <button type="submit" style="width: 300px" class="btn btn-sm btn-success">登录</button>
        </div>
        <div class="form-group">
            <button type="button" style="width: 300px" class="btn btn-sm btn-success">
                <a href="/user/welcome" style="text-decoration: none;color: white">主页</a>
            </button>
        </div>
        <div class="form-group">
            <button type="button" style="width: 300px" class="btn btn-sm btn-success">
                <a href="/user/userLogin" style="text-decoration: none;color: white">账号密码登陆</a>
            </button>
        </div>
    </form>
</div>
</center>
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script>
    var vercode	 = 0;
    var time = 60;
    var flag = true;   //设置点击标记，防止60内再次点击生效
    function sendCode(){
        console.log('send code');
        var phone = $('#phone').val();
        console.log(phone);
        $.ajax({
            type : 'POST',
            async : false,
            url : '/user/sendSmsCode',
            data : {
                "phone" : phone
            },
            dataType:"json",
            success : function(data) {
                // vercode = data.data; 不需要吧验证码返回到页面上进行判断
                if(data == "success"){
                    alert("已发送")
                }
            }
        });
    }

    function yzmLogin() {
        doValidate();

        $.ajax({
            type : 'GET',
            async : false,
            url : '/user/yazlogin',
            data : {
                "phone" : $('#phone').val(),
                "smsCode":$('#smsCode').val()
            },
            dataType:"json",
            success : function(data) {
            }
        });
    }

    /*//发送验证码
    $('#dyMobileButton').click(function(){
        console.log('send code')
        $(this).attr("disabled",true);
        var phone = $('#phone').val();
        if(flag){
            var timer = setInterval(function () {
                if(time == 60 && flag){
                    flag = false;
                    $.ajax({
                        type : 'post',
                        async : false,
                        url : '/user/yazlogin',
                        data : {
                            "phone" : phone
                         },
                        dataType:"json",
                        success : function(data) {
                            // if(data.status == 0){
                                // vercode = data.data; 不需要吧验证码返回到页面上进行判断
                                if(data.data == "success"){
                                    alert("已发送")
                                }
                            // }
                                // $("#dyMobileButton").html("已发送");
                            // else {
                            //     alert(data.msg);
                            //     flag = true;
                            //     time = 60;
                            //     clearInterval(timer);
                            // }
                        }
                    });
                }else if(time == 0){
                    $("#dyMobileButton").removeAttr("disabled");
                    $("#dyMobileButton").html("免费获取验证码");
                        clearInterval(timer);
                    time = 60;
                    flag = true;
                }else {
                    $("#dyMobileButton").html(time + " s 重新发送");
                    time--;
                }
            },1000);
        }
    });*/


    function doValidate() {
        var phoneNumReg = /(^[0-9]{3,4}\-[0-9]{7}$)|(^[0-9]{7}$)|(^[0-9]{3,4}[0-9]{7}$)|(^0{0,1}13[0-9]{9}$)/
        if (!phoneNumReg.test(document.forma.phone.value)) {
            alert('请填写正确电话号码!!');
            document.forma.phone.focus();
            return false;
        }
        return true;
    }
</script>
</body>
</html>
