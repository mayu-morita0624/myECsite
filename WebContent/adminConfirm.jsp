<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "s" uri = "/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<meta http-equiv="Content-Style-type" content = "text/css" />
		<meta http-equiv="Content-Script-Type" content = "text/javascript" />
		<meta http-equiv="imagetoolbar" content = "no" />
		<meta name = "description" content = "" />
		<meta name = "keywords" content = "" />
		<link rel="stylesheet" href="./css/style.css">
		<script src ="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
		<title>AdminConfirm画面</title>

		<script type="text/javascript">
				function submitAction(url){
					$('form').attr('action', url);
					$('form').submit();
				}
		</script>
</head>
<body>
		<jsp:include page="header.jsp" />
		<div id = "main">
				<div id = "top">
						<p>AdminConfirm</p>
				</div>
				<div>
						<h3>登録する内容は以下でよろしいですか。</h3>
						<table>
						<s:form action = "AdminCompleteAction">
						<tr id = "box">
								<td>
										<label>商品名：</label>
								</td>
								<td>
										<s:property value = "itemName" escape = "false" />
								</td>
						</tr>
						<tr id = "box">
								<td>
										<label>値段：</label>
								</td>
								<td>
										<s:property value = "itemPrice" escape = "false" />
								</td>
						</tr>
						<tr id = "box">
								<td>
										<label>在庫：</label>
								</td>
								<td>
										<s:property value = "itemStock" escape = "false" />
								</td>
						</tr>
						<tr>
								<td><br></td>
						</tr>
						<tr>
								<td><input type = "button" value = "戻る" onclick = "submitAction('AdminAction')" /></td>
								<td><input type = "button" value = "完了" onclick = "submitAction('AdminCompleteAction')" /></td>
						</tr>
						</s:form>
						</table>
				</div>
		</div>
		<div id = "footer">
		Copyright 2018 EC site all rights reserved.
				<div id = "pr">
				</div>
		</div>
</body>
</html>