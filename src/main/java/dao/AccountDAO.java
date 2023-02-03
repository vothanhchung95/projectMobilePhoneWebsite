package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import context.DBContext;
import model.Account;
import model.Product;


// Work with Product table
public class AccountDAO {
	
	private Connection conn;
	
		
	// get the Account
	public Account getAccount (String userMail) {
		Account account = new Account();
		try {
			String query = "select * from account where user_mail = ?";
			String userId = userMail;
			DBContext db = new DBContext();
			conn = db.getConnection();
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, userId);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				
				account.setUsr(rs.getString("user_mail"));
				account.setPwd(rs.getString("password")); 
				account.setRole(rs.getInt("account_role"));
				account.setName(rs.getNString("user_name"));
				account.setAddress(rs.getNString("user_address"));
				account.setPhone(rs.getString("user_phone"));
	
			}
			rs.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return account;	
		
		
	}
	
	public void setAccount(Account account) {
		try {
			String query = "insert into shoppingdb.account (`user_mail`, `password`, `account_role`, `user_name`, `user_address`, `user_phone`)"
					+ " VALUES (N?, N?, ?, N?, N?, N?)";
			
			String usermail = account.getUsr();
			String password = account.getPwd();
			int role = 2;
			String username = account.getName();
			String address = account.getAddress();
			String phone = account.getPhone();

			DBContext db = new DBContext();
			conn = db.getConnection();
			PreparedStatement ps = conn.prepareStatement(query);
			
			ps.setString(1, usermail);
			ps.setString(2, password);
			ps.setInt(3, role);
			ps.setString(4, username);
			ps.setString(5, address);
			ps.setString(6, phone);
			
			ps.executeUpdate();
			ps.close();

		} 
		catch (Exception e) {
			// TODO: handle exception
		}
	}
	

	
	public static void main(String[] args) {
		AccountDAO test = new AccountDAO();
		Account ls = new Account();
		ls = test.getAccount("duongdt@fpt.com");
		System.out.println(ls.getName());
		
		System.out.println(ls.getAddress());
	}
}
