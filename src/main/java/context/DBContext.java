package context;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBContext {
	
	public Connection getConnection() throws Exception {
		String url = "jdbc:mysql://localhost:3306/" + dbName;
				
		Class.forName("com.mysql.jdbc.Driver");  
		return DriverManager.getConnection(url, userID, password);
		
	}
	
	private final String dbName = "shoppingdb";
	private final String userID = "root";
	private final String password = "";
}

