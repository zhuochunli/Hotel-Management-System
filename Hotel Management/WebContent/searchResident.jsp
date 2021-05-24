<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<%@page import="java.util.List"%>
<%@page import="com.lyq.bean.login"%>
<%@page import="java.sql.SQLException"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<%@page import="com.lyq.bean.room"%>

<html>
<head>
<meta charset="utf-8">
<title>客户信息</title>
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

		
<table align="center" width="450" border="1" height="180" bordercolor="white" bgcolor="black" cellpadding="1" cellspacing="1">
	<p style="font-size:20px;">
		<tr bgcolor="white">
			<td align="center" colspan="7">
				<h2>客户信息</h2>
			</td>
		</tr>
		<tr align="center" bgcolor="#e1ffc1" >
			<td><b>身份证号</b></td>
			<td><b>姓名</b></td>
			<td><b>房间号</b></td>
			<td><b>类型</b></td>
			<td><b>时间</b></td>
			<td><b>价格</b></td>

			
			<%	try {
				  Class.forName("com.mysql.cj.jdbc.Driver"); 
					String url = "jdbc:mysql://localhost:3306/hotel?characterEncoding=utf-8&serverTimezone=GMT%2B8&useSSL=false";
					String username = "root";

					String password = "731731";

					Connection conn=DriverManager.getConnection(url,username,password);
					String a=request.getParameter("roomnumber");
				String sql = "select resident.ID,resident.name,room.ID,room.type,resident.time,room.price from resident,room where resident.number='" + a +"'"+ "and resident.number=room.ID ";
				PreparedStatement ps = conn.prepareStatement(sql);
				ResultSet rs = ps.executeQuery(sql);
				while(rs.next()){%>
				<tr align="center" bgcolor="white">
					
					<td><%=rs.getString("resident.ID")%></td>
					<td><%=rs.getString("resident.name")%></td>
					<td><%=rs.getString("room.ID")%></td>
					<td><%=rs.getString("room.type")%></td>
					<td><%=rs.getString("resident.time")%></td>
					<td><%=rs.getString("room.price")%></td>
				<% }

				rs.close();		
				ps.close();	
				conn.close();	
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}
				
			%>
	</table>
</body>
</html>