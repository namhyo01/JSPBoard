package util.connection;

import java.sql.Connection;
import java.sql.DriverManager;

public class MyConnection {
	public static Connection getConnection() {
		Connection con = null;
		String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
		String user = "jsp";
		String password = "jsp";
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection(url,user,password);
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return con;
	}
	
}
