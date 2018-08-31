package com.internousdev.ecsite.action;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.ecsite.dao.AdminCompleteDAO;
import com.internousdev.ecsite.util.InputChecker;
import com.opensymphony.xwork2.ActionSupport;

public class AdminCompleteAction extends ActionSupport implements SessionAware {

	private String itemName;
	private String itemPrice;
	private String itemStock;
	public Map<String, Object> session;

	public List<String> itemPriceErrorList = new ArrayList<String>();
	public List<String> itemStockErrorList = new ArrayList<String>();
	AdminCompleteDAO adminCompleteDAO = new AdminCompleteDAO();

	public String execute() throws SQLException {
		String result = ERROR;

		InputChecker inputChecker = new InputChecker();
		itemPriceErrorList = inputChecker.doCheck("値段", session.get("itemPrice").toString());
		itemStockErrorList = inputChecker.doCheck("在庫", session.get("itemStock").toString());

		Iterator<String> iteratorByItemPriceErrorList = itemPriceErrorList.iterator();
		if(!(iteratorByItemPriceErrorList.hasNext())) {
			itemPriceErrorList = null;
		}

		Iterator<String> iteratorByItemStockErrorList = itemStockErrorList.iterator();
		if(!(iteratorByItemStockErrorList.hasNext())) {
			itemStockErrorList = null;
		}

		if (itemPriceErrorList != null || itemStockErrorList != null) {
			return result;
		}

		adminCompleteDAO.admin(session.get("itemName").toString(),
				session.get("itemPrice").toString(),
				session.get("itemStock").toString());

		result = SUCCESS;

		return result;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public String getItemPrice() {
		return itemPrice;
	}

	public void setItemPrice(String itemPrice) {
		this.itemPrice = itemPrice;
	}

	public String getItemStock() {
		return itemStock;
	}

	public void setItemStock(String itemStock) {
		this.itemStock = itemStock;
	}

	public Map<String, Object> getSession() {
		return session;
	}

	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	public List<String> getItemPriceErrorList() {
		return itemPriceErrorList;
	}

	public void setItemPriceErrorList(List<String> itemPriceErrorList) {
		this.itemPriceErrorList = itemPriceErrorList;
	}

	public List<String> getItemStockErrorList() {
		return itemStockErrorList;
	}

	public void setItemStockErrorList(List<String> itemStockErrorList) {
		this.itemStockErrorList = itemStockErrorList;
	}

}