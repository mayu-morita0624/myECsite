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
		<meta name = "keywords" content  = "" />
		<link rel="stylesheet" href="./css/style.css">
		<title>AdminLogin画面</title>
</head>
<body>
		<jsp:include page="header.jsp" />
		<div id = "main">
				<div id = "top">
						<p>AdminLogin</p>
				</div>
				<div>
						<h3>管理者ログイン</h3>

						<s:form action = "AdminLoginAction">
								<s:textfield name = "loginUserId" />
								<s:password  name = "loginPassword" />
								<s:submit value = "ログイン" />
						</s:form>


						<br/>
								<p>Homeへ戻る場合は
										<a href = '<s:url action = "GoHomeAction" />'>こちら</a></p>
						</div>
				</div>
		<div id = "footer">
		Copyright 2018 EC site all rights reserved.
				<div id = "pr">
				</div>
		</div>
</body>
</html>