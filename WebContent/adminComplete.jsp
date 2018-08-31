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
		<title>AdminComplete画面</title>
</head>
<body>
		<jsp:include page="header.jsp" />
		<div id = "main">
				<div id = "top">
						<p>AdminComplete</p>
				</div>
				<div>
						<h3>登録が完了致しました。</h3>
						<div>
								<a href='<s:url action="GoHomeAction" />'>HOMEへ戻る</a>
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