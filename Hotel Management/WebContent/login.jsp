<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html >
<head>
<meta charset="utf-8" />
<title>刘李大酒店管理系统</title><base target="_blank" />
<style>
*{
	padding:0px;
	margin:0px;
	}
    a{color:White}
body{
	font-family:Arial, Helvetica, sans-serif;
	background:url(21/images/timg.jpg) no-repeat  center;
	font-size:13px;    
	}
img{
	border:0;
	}
.lg{width:468px; height:468px; margin:100px auto; border-radius:50%;background:url(21/images/login_bg.png) no-repeat;}
.lg_top{ height:200px; width:468px;}
.lg_main{width:400px; height:180px; margin:0 25px;}
.lg_m_1{
	width:290px;
	height:100px;
	padding:60px 55px 20px 55px;
}
.ur,.pw,.ID{
	height:37px;
	border:0;
	color:#666;
	width:236px;
	margin:4px 28px;
	background:url(21/images/user.png) no-repeat;
	padding-left:10px;
	font-size:16pt;
	font-family:Arial, Helvetica, sans-serif;
}
.bn{width:330px; height:72px; background:url(21/images/enter.png) no-repeat; border:0; display:block; font-size:18px; color:#FFF; font-family:Arial, Helvetica, sans-serif; font-weight:bolder;}
.lg_foot{
	height:80px;
	width:330px;
	padding: 6px 68px 0 68px;
}
</style>
</head>
<body class="b">
<%

%>
<div class="lg" >
<form action ="DoLogin" name="login"  method="post" >
    <div class="lg_top"></div>
    <div class="lg_main">
        <div class="lg_m_1">
        <input id ="ID"name="ID"  class="ID"placeholder="工号" required autofocus />
        <input id ="name"name="name"  class="ur"placeholder="用户名" required autofocus />
        <input id="password" name="password" type="password" placeholder="密码" class="pw"  required autofocus />
        </div>
    </div>
    <div class="lg_foot">
    <input type="submit" value="点这里登录" class="bn" /></div>
</form>
</div>
<div style="text-align:center;">
<span>刘李酒店有限公司</span>
</div>
</body>
</html>
