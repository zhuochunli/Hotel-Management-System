package src.edu.xaut.sql;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.lyq.bean.resident;
import com.lyq.bean.room;

public class roomSql {
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
	public int insert(room room) {
		int row;
		Connection conn = getConnection();
		
		try {
			String sql = "insert into hotel.room(ID,type,price,status) values(?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setString(1,room.getID());
			ps.setString(2, room.getType());
			ps.setString(3, room.getPrice());
			ps.setString(3, room.getStatus());
			row = ps.executeUpdate();
		}catch(Exception e) {
			row=0;
			e.printStackTrace();
		}
		
		return row;
	}
	public boolean search(String ID,String type,String price,String status ) {
		Connection conn = getConnection();
		boolean flag = false;
		try {
			java.sql.Statement stmt = conn.createStatement();
			String sql = "select * from hotel.room where ID ='" + ID +"'" + " and type = '" + type + "'"+ " and price = '" + price + "'"+ " and time = '" + status + "'";
			ResultSet rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				flag = true;
			}

		}catch(Exception e) {
			e.printStackTrace();
		}
		return flag;
		
	}
	public void Update(String ID,String a) {
		Connection conn = getConnection();
		try {


				String sql = "update hotel.room set status=?  where ID=?";
				PreparedStatement ps = conn.prepareStatement(sql);
				ps.setString(1, a);
				ps.setString(2, ID);
				ps.executeUpdate();
				ps.close();
			
				conn.close();


			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}
