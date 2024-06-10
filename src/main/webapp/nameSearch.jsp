<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이름으로 회원 검색</title>
</head>
<body>
	<h3>이름으로 회원 검색</h3>
	<hr>
	<form action="nameSearchOk.jsp">
		이름 검색 : <input type="text" name="name">
		<input type="submit" value="검색">
	</form>
</body>
</html>