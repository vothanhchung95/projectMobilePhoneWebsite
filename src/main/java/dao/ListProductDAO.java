package dao;

import java.security.interfaces.RSAKey;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import context.DBContext;
import model.Product;

// Work with Product table
public class ListProductDAO {
	
	private Connection conn;
	// return the list of products 
	public List<Product> search(String characters) {
		List<Product> ls = new ArrayList<>();
		try {
			String query = "select * from products where product_name like ?";
			DBContext db = new DBContext();
			conn = db.getConnection();
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1,"%" + characters + "%");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				
				int id = rs.getInt("product_id");
				String name = rs.getString("product_name");
				String description = rs.getNString("product_des");
				float price = rs.getFloat("product_price");
				String src = rs.getString("product_img_source");
				String type = rs.getString("product_type");
				String brand = rs.getString("product_brand");
				Product product = new Product(id, name, description, price, src, type, brand);
				
				ls.add(product);
			}
			rs.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return ls;		
	}
	
	public List<Product> searchIndex(String characters, int index, int pageSize) {
		List<Product> ls = new ArrayList<>();
		try {
			String query = "with x as (select row_number() over(order by product_id) as r, products.* from products where product_name like ?) select * from x where r between ?*6-5 and ?*6";
			DBContext db = new DBContext();
			conn = db.getConnection();
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1,"%" + characters + "%");
			ps.setInt(2, index);
			ps.setInt(3, index);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				
				int id = rs.getInt("product_id");
				String name = rs.getString("product_name");
				String description = rs.getNString("product_des");
				float price = rs.getFloat("product_price");
				String src = rs.getString("product_img_source");
				String type = rs.getString("product_type");
				String brand = rs.getString("product_brand");
				Product product = new Product(id, name, description, price, src, type, brand);
				
				ls.add(product);
			}
			rs.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return ls;		
	}
	
	// get the product
	public Product getProduct (String characters) {
		Product product = new Product();
		try {
			String query = "select * from products where product_id = ?";
			int id = Integer.parseInt(characters);
			DBContext db = new DBContext();
			conn = db.getConnection();
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				
				product.setId(rs.getInt("product_id"));
				product.setName(rs.getString("product_name")); 
				product.setDescription(rs.getNString("product_des"));
				product.setPrice(rs.getFloat("product_price"));
				product.setSrc(rs.getString("product_img_source"));
				product.setType(rs.getString("product_type"));
				product.setBrand(rs.getString("product_brand"));
				
				
				
			}
			rs.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return product;	
		
		
	}
	
	// count searched product
	public int count(String characters) {
		try {
			String query = "select count(*) from products where product_name like ?";
			DBContext db = new DBContext();
			conn = db.getConnection();
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1,"%" + characters + "%");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				return rs.getInt(1);
			}
			rs.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return 0;
	}
	
	public static void main(String[] args) {
		ListProductDAO test = new ListProductDAO();
		List<Product> ls = new ArrayList<>();
		ls = test.searchIndex("iPhone", 1, 6);
		System.out.println(ls.toString());
		
		for (Product xProduct : ls) {
			System.out.println(xProduct.getName());
		}
	}
}
