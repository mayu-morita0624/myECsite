<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "s" uri = "/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<meta http-equiv="Content-Style-Type" content = "text/css" />
		<meta http-equiv="Content-Script-Type" content = "text/javascript" />
		<meta http-equiv="imagetoolbar" content = "no" />
		<meta name = "description" content = "" />
		<meta name = "keywords" content = "" />
		<link rel="stylesheet" href="./css/style.css">
		<title>Admin画面</title>
</head>
<body>
		<jsp:include page="header.jsp" />
		<div id = "main">
				<div id = "top">
						<p>Admin</p>
				</div>
				<div>
						<s:if test = "errorMessage != ''">
								<s:property value = "errorMessage" escape = "false" />
						</s:if>
						<table>
						<s:form action = "AdminConfirmAction">
								<tr>
										<td>
												<label>商品名：</label>
										</td>
										<td>
												<input type = "text" name = "itemName" value = "" />
										</td>
								</tr>
								<tr>
										<td>
												<label>値段：</label>
										</td>
										<td>
												<input type = "text" name = "itemPrice" value = "" placeholder = "半角数字で入力" />
										</td>
								</tr>
								<tr>
										<td>
												<label>在庫：</label>
										</td>
										<td>
												<input type = "text" name = "itemStock" value = "" placeholder = "半角数字で入力" />
										</td>
								</tr>
								<div id = "submit"><s:submit value = "登録" /></div>
						</s:form>
						</table>
						<div>
								<span>前画面に戻る場合は</span>
								<a href='<s:url action="GoHomeAction" />'>こちら</a>
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