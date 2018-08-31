package com.internousdev.ecsite.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.internousdev.ecsite.util.DBConnector;
import com.internousdev.ecsite.util.DateUtil;

public class BuyItemCompleteDAO {
	String sql = "INSERT INTO user_buy_item_transaction(item_transaction_id, total_price, total_count, user_master_id, pay, insert_date) VALUES(?,?,?,?,?,?)";

	public int buyItemInfo(String item_transaction_id, String user_master_id,
			String total_price, String total_count, String pay) throws SQLException {
		DBConnector dbConnector = new DBConnector();
		Connection connection = dbConnector.getConnection();
		DateUtil dateUtil = new DateUtil();

		int result = 0;

		try {
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, item_transaction_id);
			preparedStatement.setString(2, total_price);
			preparedStatement.setString(3, total_count);
			preparedStatement.setString(4, user_master_id);
			preparedStatement.setString(5, pay);
			preparedStatement.setString(6, dateUtil.getDate());

			result = preparedStatement.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			connection.close();
		}

		return result;
	}

	public int selectItemStock (String item_transaction_id) throws SQLException {
		int itemStock = 0;
		DBConnector dbConnector = new DBConnector();
		Connection connection = dbConnector.getConnection();

		String sql = "SELECT item_stock FROM item_info_transaction WHERE id =? ";

		PreparedStatement preparedStatement;

		try {
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, item_transaction_id);
			ResultSet resultSet = preparedStatement.executeQuery();

			if(resultSet.next()) {
				itemStock = resultSet.getInt("item_stock");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			connection.close();
		}

		return itemStock;
	}

	/*在庫管理(item_stockからtotal_countを引き算する)*/
	public void itemInfoUpdate
	(int itemStock, String item_transaction_id) throws SQLException {
		DBConnector dbConnector = new DBConnector();
		Connection connection = dbConnector.getConnection();

		String sql = "UPDATE item_info_transaction iit "
					+ "SET iit.item_stock = ? "
					+ "WHERE iit.id =?";

		PreparedStatement preparedStatement;

		try {
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, itemStock);
			preparedStatement.setString(2, item_transaction_id);
			preparedStatement.execute();

		} catch (SQLException e) {
			e.printStackTrace();

		} finally {
			connection.close();

		}

	}

}
