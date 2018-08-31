package com.internousdev.ecsite.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.internousdev.ecsite.dto.LoginDTO;
import com.internousdev.ecsite.util.DBConnector;

public class AdminLoginDAO {
	public LoginDTO getAdminLoginUserInfo(String loginUserId, String loginPassword) {
		 DBConnector dbConnector = new DBConnector();
		 Connection connection = dbConnector.getConnection();
		 LoginDTO loginDTO = new LoginDTO();

		String sql = "SELECT * FROM login_user_transaction where login_id='admin' AND login_pass='admin01'";

		try {
			PreparedStatement preparedStatement = connection.prepareStatement(sql);

			ResultSet resultSet = preparedStatement.executeQuery();

			if(resultSet.next()) {
				if(resultSet.getString("login_id").equals(loginUserId)
						&& resultSet.getString("login_pass").equals(loginPassword)) {
					loginDTO.setLoginId(resultSet.getString("login_id"));
					loginDTO.setLoginPassword(resultSet.getString("login_pass"));
					loginDTO.setUserName(resultSet.getString("user_name"));
					loginDTO.setLoginFlg(true);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return loginDTO;
	}

}