<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="com.lyq.bean.resident"%>
<html>
<head>
	<meta charset="UTF-8">
	<title>注册成功</title>
	<link rel="stylesheet" href="../css/registerResult1.css"></link>
</head>
<body>
<jsp:useBean id="r" class="com.lyq.bean.resident" scope="session" />
	<div class="main">
		<div class="main-header">
           	<span>订房成功！</span>
		</div>
		<div class="main-bottom">
			<ul>
				
				<li>
					您的名字：<%= r.getName()%>
				</li>
				<li>
					您的房间号：<%= r.getNumber()%>
				</li>
				<li>
					您的住房时间：<%= r.getTime()%>
				</li>
				<li>
					<a href="roomshow.jsp">前往所有房源页面</a>
				</li>
			</ul>
		</div>
	</div>
</body>
</html>