<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<%@page import="java.util.List"%>
<%@page import="com.lyq.bean.login"%>
<%@page import="java.sql.SQLException"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<%@page import="com.lyq.bean.goods"%>

<html>
<head>
<meta charset="utf-8">
<title>商品信息</title>
<style>
	.body{
		background-image:url("./images/10.jpg");
		background-repeat:no-repeat;
		background-size:100% 100%;
		-moz-background-size:100% 100%;
	}
	#obj{
		overflow: hidden;
		width: 1900px;
		height: 900px;
		margin: 50px auto;
		position: relative;
	}
	#obj div{
		color: white;
		font-size: 50px;
		text-shadow:0 0 10px black;
		position: absolute;
	}
</style>
</head>
<body>
<p style="font-size: 20px"><a  href="roomshow.jsp">首页</a>
		<%
			login login = (login)session.getAttribute("login");
		%>
		<a  href="#" style="font-size: 25px">欢迎您：
			<%
					out.print(login.getName());
			%>
			</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="breadcrumb-item text-right" href="logout.jsp">退出登录</a></p>
			<h1 style="text-align:center;font-size:40px">酒店管理系统(员工客户端)</h1>

<form action="checkoutsuccess.jsp" method="post">		
<table align="center" width="450" border="1" height="180" bordercolor="white" bgcolor="black" cellpadding="1" cellspacing="1">
	<p style="font-size:20px;">
		<tr bgcolor="white">
			<td align="center" colspan="7">
				<h2>商品信息</h2>
			</td>
		</tr>

		<tr align="center" bgcolor="#e1ffc1" >
			<td><b>商品名</b></td>		
			<td><b>价格</b></td>		
			<td><b>数量</b></td>
				<tr align="center" bgcolor="white">					
					<td>方便面</td><td>4元</td>
						<td><input id ="fang" name="fang" placeholder="数量" required autofocus />	</td>	
						</tr>
					<tr align="center" bgcolor="white">					
					<td>水</td><td>3元</td>
						<td><input id ="shui" name="shui" placeholder="数量" required autofocus />	</td>	
						</tr>
					<tr align="center" bgcolor="white">					
					<td>洗发水</td><td>12元</td>
						<td><input id ="xi" name="xi" placeholder="数量" required autofocus />	</td>	
						</tr>
				<tr align="center" bgcolor="white">					
					<td>纸</td><td>2元</td>
						<td><input id ="zhi" name="zhi" placeholder="数量" required autofocus />	</td>	
						</tr>
					<tr align="center" bgcolor="white">					
					<td>薯片</td><td>5元</td>
						<td><input id ="shu" name="shu" placeholder="数量" required autofocus />	</td>	
						</tr>
						<tr><td><input type="submit" value="提交" /></td></tr>			
	</table>
	</form>	
</body>
</html>