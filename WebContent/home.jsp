<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/style.css">
		<title>Home画面</title>
</head>
<body>
<jsp:include page="header.jsp" />
		<!-- <div id = "header">
				<div id = "pr">
				</div>
		</div> -->
		<div id = "main">
				<div id = "top">
						<p>Home</p>
				</div>
				<div id = "text-center">
						<s:form action = "HomeAction">
								<s:submit class = "btn" value = "商品購入" />
						</s:form>
						<s:form action = "AdminAction">
								<s:submit class = "btn" value = "管理者" />
						</s:form>
						<s:if test = "#session.id !=null">
								<p>ログアウトする場合は
										<a href='<s:url action="LoginAction"/>'>こちら</a></p>
						</s:if>
				</div>
		</div>
		<div id = "footer">
		Copyright 2018 EC site all rights reserved.
				<div id = "pr">
				</div>
		</div>
</body>
</html>