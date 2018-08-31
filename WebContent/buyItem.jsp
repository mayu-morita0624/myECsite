<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "s" uri = "/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<meta http-equiv="Content-Script-Type" content = "text/javascript" />
		<meta http-equiv="imagetoolbar" content = "no" />
		<meta name = "description" content = "" />
		<meta name = "keywords" content = "" />
		<link rel="stylesheet" href="./css/style.css">
		<title>BuyItem画面</title>
</head>
<body>



		<jsp:include page="header.jsp" />
		<div id = "main">
				<div id = "top">
						<p>BuyItem</p>
				</div>
				<div>
						<s:form action = "BuyItemAction">

						<s:if test="#session.buyItemDTOList == null">
								<h3>商品情報はありません。</h3>
						</s:if>

						<s:elseif test="message == null">
								<h3>商品一覧</h3>

								 <table>
								 <thead>
								 <tr>
								 <th >#</th>
								 <th >商品名</th>
								 <th>値段</th>
								 <th>購入個数</th>
								 <th>支払い方法</th>
								 </tr>
								 </thead>

								 <tbody>
								 <s:iterator value="#session.buyItemDTOList" status="st">
								 <tr>
								 <td>
								 <s:if test="#st.index == 0">
								 <input type="radio" name="id" checked="checked" value="<s:property value='id' />" />
								 </s:if>
								 <s:else>
								 <input type="radio" name="id" value="<s:property value='id'/>" />
								 </s:else>
								 </td>
								 <td>
								 <s:property value="itemName" />
								 </td>
								 <td>
								 <s:property value="itemPrice" />
								 </td>
								 <td>
											<select name = "count">
												<option value = "1" selected = "selected">1</option>
												<option value = "2">2</option>
												<option value = "3">3</option>
												<option value = "4">4</option>
												<option value = "5">5</option>
											</select>
											<span>個</span>
										</td>
										<td>
												<input type = "radio" name = "pay" value = "1" checked = "checked">現金払い
												<input type = "radio" name = "pay" value = "2">クレジットカード
										</td>
									</tr>
                                           </s:iterator>
               </tbody>
               </table>








								<%-- <table border = "1">
								<s:iterator value = "#session.buyItemDTOList">
								<tr>
										<td>
												<span>商品名</span>
										</td>
										<td><s:property value = "itemName" /><s:hidden name="itemName" value="%{itemName}"/></td>
								</tr>
								<tr>
										<td>
												<span>値段</span>
										<td><s:property value = "itemPrice" /><span>円</span><s:hidden name="itemPrice" value="%{itemPrice}"/></td>
								</tr>
								<tr>
										<td>
												<span>購入個数</span>
										<td>
											<select name = "count">
												<option value = "1" selected = "selected">1</option>
												<option value = "2">2</option>
												<option value = "3">3</option>
												<option value = "4">4</option>
												<option value = "5">5</option>
											</select>
											<span>個</span>
										</td>
								</tr>
								<tr>
										<td>
												<span>支払い方法</span>
										</td>
										<td>
												<input type = "radio" name = "pay" value = "1" checked = "checked">現金払い
												<input type = "radio" name = "pay" value = "2">クレジットカード
										</td>
								</tr>
								</s:iterator>
								</table> --%>
						</s:elseif>


							<div id = "submit"><s:submit value = "購入" /></div>

						</s:form>
								<div>
										<p>前画面に戻る場合は<a href='<s:url action = "GoHomeAction" />'>こちら</a></p>
										<p>マイページは<a href='<s:url action = "MyPageAction" />'>こちら</a></p>
								</div>
				</div>
		</div>
		<div id = "footer">
		Copyright 2018 EC site all rights reserved.
				<div id = "pr">
				</div>
		</div>
</body>
</html>