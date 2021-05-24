<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>注销</title>
<script type="text/javascript">
var i=5;
function refer(){
	document.getElementById("time").innerHTML=(i--)+"秒后跳转到登录页面";
	if(i<1)
		
		location.href='login.jsp';
}
setInterval("refer()",1000);
</script>
</head>
<body>
<% request.getSession().removeAttribute("login");%>
<div id="time"></div>
<span>您已成功注销!</span>
</body>
</html>