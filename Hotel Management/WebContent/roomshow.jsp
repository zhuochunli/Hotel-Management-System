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
<title>酒店管理系统(员工客户端)</title>
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
			<a href="remainroom.jsp">
				<button type="button" class="btn btn-danger" style="font-size: 20px;color: #CE4ED2">查看所剩房间</button>
			</a>
			<h1 style="text-align:center;font-size:40px">酒店管理系统(员工客户端)</h1>

		
<table align="center" width="450" border="1" height="180" bordercolor="white" bgcolor="black" cellpadding="1" cellspacing="1">
	<p style="font-size:20px;">
		<tr bgcolor="white">
			<td align="center" colspan="7">
				<h2>所有房间信息</h2>
			</td>
		</tr>
		<tr align="center" bgcolor="#e1ffc1" >
			<td><b>房间号</b></td>
			<td><b>类型</b></td>
			<td><b>价格</b></td>
			<td><b>状态</b></td>
			<td><b>操作</b></td>
			<%	try {
				  Class.forName("com.mysql.cj.jdbc.Driver"); 
					String url = "jdbc:mysql://localhost:3306/hotel?characterEncoding=utf-8&serverTimezone=GMT%2B8&useSSL=false";
					String username = "root";

					String password = "731731";

					Connection conn=DriverManager.getConnection(url,username,password);
		
				Statement stmt = conn.createStatement();
				String sql = "select * from hotel.room";
				ResultSet rs = stmt.executeQuery(sql);
				List<room> list = new ArrayList<room>();
				while(rs.next()){
					room room = new room();
					room.setID(rs.getString("ID"));
					room.setType(rs.getString("type"));
					room.setPrice(rs.getString("price"));
					room.setStatus(rs.getString("status"));
					list.add(room);
				}
				if(list == null || list.size() < 1){
					out.print("没有数据！");
				}else{
					for(room room : list){					
		%>   
				<tr align="center" bgcolor="white">
					
					<td><%=room.getID()%></td>
					<td><%=room.getType()%></td>
					<td><%=room.getPrice()%></td>
					<td><%=room.getStatus()%></td>
					<%if(room.getStatus().equals("free")){ %>
					<td>
						<form action="residentRegister.jsp" method="post">
							<input type="hidden" name="roomnumber" value="<%=room.getID()%>">
							<input type="submit" value="订             房">
						</form>
						</td>
						<%}else{ %>
					<td>
						<form action="Checkout" method="post">
							<input type="hidden" name="roomnumber" value="<%=room.getID()%>">
							<input type="submit" value="退             房">
						</form>
						<form action="searchResident.jsp" method="post">
							<input type="hidden" name="roomnumber" value="<%=room.getID()%>">
							<input type="submit" value="查看住客信息">
						</form>
						</td>
					</tr>
					<%
						}}}
				rs.close();		
				stmt.close();	
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