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
		<script>
			function check(element){
				var id_value = element.id;
				alert(id_value);
				var id = document.getElementById('selectedId0').value = id_value;
				alert(id);
			}

		</script>
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
								 			<th >商品名</th>
								 			<th>値段</th>
								 			<th>購入個数</th>
								 			<th>支払い方法</th>
								 			<th >#</th>
								 		</tr>
								 </thead>

								 	<tbody>
										 <s:iterator value="#session.buyItemDTOList" status="st">
								 			<tr>
								 				<td>
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
								 				<td>
								 					<s:submit id="%{#st.index}" value = "購入"  onclick="check(this)"/>
								 				</td>
											</tr>
											<s:hidden id="selectedId%{#st.index}" value=""/>
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


<%-- 							<div id = "submit"><s:submit value = "購入" /></div> --%>

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