package com.internousdev.ecsite.action;

import java.sql.SQLException;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.ecsite.dao.BuyItemCompleteDAO;
import com.opensymphony.xwork2.ActionSupport;

public class BuyItemConfirmAction extends ActionSupport implements SessionAware {
	public Map<String, Object> session;
	public String message;

	BuyItemCompleteDAO buyItemCompleteDAO = new BuyItemCompleteDAO();

	public String execute() throws SQLException {
		String result = SUCCESS;

		// item_info_transaction からitem_stockを取得する
		int itemStock = buyItemCompleteDAO.selectItemStock(session.get("id").toString());

		// sessionからキーがcountの値を取得し、int型に変換
		int buyCount = Integer.parseInt(session.get("count").toString());

		// 在庫管理(item_stockからtotal_countを引き算する)
		itemStock = itemStock - buyCount;

		// 在庫個数がマイナスでないときに購入処理を行う
		if (itemStock >= 0){
			int count = buyItemCompleteDAO.buyItemInfo(
					session.get("id").toString(),
					session.get("login_user_id").toString(),
					session.get("total_price").toString(),
					session.get("count").toString(),
					session.get("pay").toString());

			if (count > 0) {
					// item_info_transactionの在庫を更新する
					buyItemCompleteDAO.itemInfoUpdate(itemStock,
							session.get("id").toString());
			}
		} else {
			setMessage("購入個数が在庫より多いため購入できませんでした。");
		}
		return result;
	}

	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	public Map<String, Object> getSession() {
		return session;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getMessage() {
		return message;
	}

}