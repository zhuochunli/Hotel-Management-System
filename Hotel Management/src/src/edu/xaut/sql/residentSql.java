package src.edu.xaut.sql;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.lyq.bean.resident;

public class residentSql {
	public Connection getConnection() {
		Connection conn = null;
		
		try {	
			Class.forName("com.mysql.cj.jdbc.Driver");
			String url= "jdbc:mysql://localhost:3306/hotel?characterEncoding=utf-8&serverTimezone=GMT%2B8&useSSL=false";
			String usename = "root";
			String password = "731731";
			conn = DriverManager.getConnection(url, usename, password);
		}catch(ClassNotFoundException e) {
			e.printStackTrace();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		return conn;
	}
	public int insert(resident resident) {
		int row;
		Connection conn = getConnection();
		
		try {
			String sql = "insert into hotel.resident(ID,name,number,time) values(?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setString(1,resident.getID());
			ps.setString(2, resident.getName());
			ps.setString(3, resident.getNumber());
			ps.setString(4, resident.getTime());
			row = ps.executeUpdate();
		}catch(Exception e) {
			row=0;
			e.printStackTrace();
		}
		
		return row;
	}
	public boolean search(String ID,String name,String number,String time ) {
		Connection conn = getConnection();
		boolean flag = false;
		try {
			java.sql.Statement stmt = conn.createStatement();
			String sql = "select * from hotel.resident where ID ='" + ID +"'" + " and name = '" + name + "'"+ " and number = '" + number + "'"+ " and time = '" + time + "'";
			ResultSet rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				flag = true;
			}

		}catch(Exception e) {
			e.printStackTrace();
		}
		return flag;
		
	}
	public void delete(String roomID) {
		Connection conn = getConnection();
		try {

			
				String sql = "delete from hotel.resident where number=?";
				PreparedStatement ps = conn.prepareStatement(sql);
				ps.setString(1, roomID);
				ps.executeUpdate();
				ps.close();
				conn.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}
