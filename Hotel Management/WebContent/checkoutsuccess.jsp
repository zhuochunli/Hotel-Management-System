<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>退房成功</title>
</head>
<body>
<%
String a=request.getParameter("fang");
String b=request.getParameter("shui");
String c=request.getParameter("xi");
String d=request.getParameter("zhi");
String e=request.getParameter("shu");
if(a!=null&b!=null&c!=null&d!=null&e!=null)
{
int q=Integer.parseInt(a);
int w=Integer.parseInt(b);
int f=Integer.parseInt(c);
int r=Integer.parseInt(d);
int t=Integer.parseInt(e);
int sum=4*q+3*w+12*f+2*r+5*t;
int remain=200-sum;
out.println("您的消费金额为： "+sum);
out.println("您押金所剩为： "+remain);
}%>
<p>此住客已成功退房！欢迎您下次再来！
<a href="roomshow.jsp">点击返回</a>
</body>
</html>