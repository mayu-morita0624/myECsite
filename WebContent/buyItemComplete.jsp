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
		<title>BuyItemComplete画面</title>
</head>
<body>
		<jsp:include page="header.jsp" />
		<div id = "main">
				<div id = "top">
						<p>BuyItemComplete</p>
				</div>
				<div>
					<s:if test = "message != null">
							<h3><s:property value = "message" /></h3>
					</s:if>
					<s:else>
						<p>購入手続きが完了致しました。</p>
						<div>
							<a href='<s:url action="MyPageAction" />'>
							マイページ</a><span>から購入履歴の確認が可能です。</span>
							<p>Homeへ戻る場合は<a href='<s:url action="GoHomeAction" />'>
							こちら</a></p>
						</div>
					</s:else>
				</div>
		</div>
		<div id = "footer">
		Copyright 2018 EC site all rights reserved.
				<div id = "pr">
				</div>
		</div>
</body>
</html>