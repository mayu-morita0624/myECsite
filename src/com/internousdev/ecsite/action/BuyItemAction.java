package com.internousdev.ecsite.action;

import java.util.Collection;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.ecsite.dao.BuyItemCompleteDAO;
import com.opensymphony.xwork2.ActionSupport;

public class BuyItemAction extends ActionSupport implements SessionAware {
	public Map<String, Object> session;
	private String count;
	private String pay;
	private String itemName;
	private String itemPrice;
	private String id;

	private Collection<String> checkList;

	BuyItemCompleteDAO buyItemCompleteDAO = new BuyItemCompleteDAO();

	public String execute() {
		String result = SUCCESS;

		System.out.println(id);

		session.put("count", count);
		count = String.valueOf((count.split(", ",0))[0]);
		int intCount = Integer.parseInt(count);
		int intPrice = Integer.parseInt(itemPrice);

		session.put("total_price", intCount * intPrice);

		String payment;

		if(pay.equals("1")) {
			payment = "現金払い";
			session.put("pay", payment);
		} else {
			payment = "クレジットカード";
			session.put("pay", payment);
		}

		return result;
	}

	public void setCount(String count) {
		this.count = count;
	}

	public void setPay(String pay) {
		this.pay = pay;
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


	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	public Map<String, Object> getSession() {
		return session;
	}

	public String getCount() {
		return count;
	}

	public String getPay() {
		return pay;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

}