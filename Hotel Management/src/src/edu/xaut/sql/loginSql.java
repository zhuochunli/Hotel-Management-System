package src.edu.xaut.sql;

import java.awt.List;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.lyq.bean.login;
import com.mysql.cj.xdevapi.Statement;

public class loginSql {
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
	public int insert(login login) {
		int row;
		Connection conn = getConnection();
		
		try {
			String sql = "insert into hotel.login(ID,name,password) values(?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setString(1,login.getID());
			ps.setString(2, login.getName());
			ps.setString(3, login.getPassword());
			
			row = ps.executeUpdate();
		}catch(Exception e) {
			row=0;
			e.printStackTrace();
		}
		
		return row;
	}
	public boolean search(String ID,String name,String password ) {
		Connection conn = getConnection();
		boolean flag = false;
		try {
			java.sql.Statement stmt = conn.createStatement();
			String sql = "select * from hotel.login where ID ='" + ID +"'" + " and name = '" + name + "'"+ " and password = '" + password + "'";
			ResultSet rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				flag = true;
			}

		}catch(Exception e) {
			e.printStackTrace();
		}
		return flag;
		
	}
	public void Update(int id,boolean flag) {
		Connection conn = getConnection();
		try {
			if(flag)
			{
				String sql = "update tb_books set bookCount=bookCount-1  where id=?";
				PreparedStatement ps = conn.prepareStatement(sql);
				ps.setInt(1, id);
				ps.executeUpdate();
				ps.close();
			
				conn.close();
			}
			else
			{
				String sql = "update tb_books set bookCount=bookCount+1  where id=?";
				PreparedStatement ps = conn.prepareStatement(sql);
				ps.setInt(1, id);

				ps.executeUpdate();
				ps.close();

				conn.close();
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}
