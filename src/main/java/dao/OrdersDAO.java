package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.mysql.jdbc.Statement;

import context.DBContext;
import model.Cart;
import model.Orders;
import model.Product;
import model.ProductOrders;

public class OrdersDAO {
	
	private Connection conn;
	// insert information of Order to data source, that including list of
	// products in cart(c) and information  of buyer in Order(o)
	public void insertOrder(Orders o, Cart c) throws Exception {
		// 1. Update to Orders table (usermail, order_id, orderstatus, date, discount, address, phone)
		
		String insert = "insert into shoppingdb.orders (`user_mail`, `order_id`, `order_status`, `order_date`, `order_discount_code`, `order_address`,`phone`)"
				+ " VALUES (N?, 0, ?, default, ?, N?, ?)";
		
		String userMail = o.getUserMail();
		int orderStatus = o.getStatus();
		String discount = o.getDiscount();
		String address = o.getAddress();
		String phone = o.getPhoneNumber();
		
		DBContext db = new DBContext();
		conn = db.getConnection();
		PreparedStatement ps = conn.prepareStatement(insert, Statement.RETURN_GENERATED_KEYS);
		
		ps.setString(1, userMail);
		ps.setInt(2, orderStatus);
		ps.setString(3, discount);
		ps.setString(4, address);
		ps.setString(5, phone);
		
		int affectedRows = ps.executeUpdate();

        if (affectedRows == 0) {
            throw new SQLException("Creating order failed, no rows affected.");
        }

        try (ResultSet generatedKeys = ps.getGeneratedKeys()) {
            if (generatedKeys.next()) {
                o.setOrderId(generatedKeys.getInt(1));
            }
            else {
                throw new SQLException("Creating order failed, no ID obtained.");
            }
        }
		ps.close();
		
		
		// 2. Update orders detail (order_id, product_id, amount_product, price_product)
		
		List<Product> items = c.getItems();
		
		for (Product x : items) {
			ProductOrders ordersDetail = new ProductOrders();
			ordersDetail.setOrderId(o.getOrderId());
			ordersDetail.setNameProduct(x.getName());
			ordersDetail.setAmountProduct(x.getNumber());
			ordersDetail.setProductId(x.getId());
			
			
			String updateOrder = "insert into shoppingdb.orders_detail (`order_id`, `product_id`, `amount_product`, `price_product`)"
					+ " VALUES (?, ?, ?, ?)";
			
			PreparedStatement statement = conn.prepareStatement(updateOrder);
			
			statement.setInt(1, o.getOrderId());
			statement.setInt(2, x.getId());
			statement.setInt(3, x.getNumber());
			statement.setFloat(4, x.getPrice());
			
			statement.executeUpdate();
			
			statement.close();
		}
	}
}
