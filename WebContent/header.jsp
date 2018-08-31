<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>ヘッダー</title>
<script>
function logoutAction(){
	document.getElementById("form").action="LogoutAction";
}

function loginAction(){
	document.getElementById("form").action="LoginAction";
}

function myPageAction(){
	document.getElementById("form").action="MyPageAction";
}

function adminAction(){
	document.getElementById("form").action="AdminAction";
}

</script>
</head>
<body>
<header>
<div id="header">
		<div id="header-title">
				<a class = "headerLogo" href = "GoHomeAction">EC site</a>
		</div>
		<div id="header-menu">
			<ul>
					<s:form id="form" name="form">

							<!-- ログインフラグがtrueの場合、ログアウトボタンを表示 -->
							<s:if test="session.loginUser.loginFlg">
							<li><s:submit value="ログアウト" class="button" onclick="logoutAction();"/></li>
							</s:if>

							<!-- ログインフラグがfalseの場合、ログインボタンを表示 -->
							<s:else>
							<li><s:submit value="ログイン" class="button" onclick="loginAction();"/></li>
							</s:else>

							<!-- 商品購入ボタン -->
							<li><s:submit value="商品購入" class="button" onclick="loginAction();"/></li>

							<!-- ログインフラグがtrueの場合、マイページボタンを表示 -->
							<s:if test="session.loginUser.loginFlg">
							<li><s:submit value="マイページ" class="button" onclick="myPageAction();"/></li>
							</s:if>

							<!-- 管理者ボタン -->
							<li><s:submit value="管理者" class="button" onclick="adminAction();"/></li>

					</s:form>
			</ul>
		</div>
</div>
</header>
</body>
</html>