package com.internousdev.ecsite.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.internousdev.ecsite.dto.BuyItemDTO;
import com.internousdev.ecsite.util.DBConnector;


public class BuyItemDAO {
	DBConnector dbConnector = new DBConnector();
	Connection connection = dbConnector.getConnection();

	public ArrayList<BuyItemDTO> getBuyItemInfo() {
		ArrayList<BuyItemDTO> buyItemDTOList = new ArrayList<BuyItemDTO>();

		String sql = "SELECT id, item_name, item_price, item_stock FROM item_info_transaction";

		try {
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			ResultSet resultSet = preparedStatement.executeQuery();

			while(resultSet.next()) {
				BuyItemDTO buyItemDTO = new BuyItemDTO();
				buyItemDTO.setId(resultSet.getInt("id"));
				buyItemDTO.setItemName(resultSet.getString("item_name"));
				buyItemDTO.setItemPrice(resultSet.getString("item_price"));
				buyItemDTO.setItemStock(resultSet.getInt("item_stock"));
				buyItemDTOList.add(buyItemDTO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return buyItemDTOList;
	}

}
