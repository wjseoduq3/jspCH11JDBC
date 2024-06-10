<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JDBC 연결 테스트</title>
</head>
<body>
	<%
		// mySQL과 연결에 필요한 4개의 변수 선언
		String driverName = "com.mysql.jdbc.Driver";
		String url="jdbc:mysql://192.168.0.100:3306/school_db";
		String username ="guest01";
		String password ="12345";
		
		Connection conn = null; // db와의 커넥션 생성
		
		try {
			Class.forName(driverName); // mySQL 드라이브 불러오기
			conn = DriverManager.getConnection(url, username, password); //DB와의 커넥션 생성
			out.println(conn);
		} catch(Exception e) {
			out.println("DB연결 실패!!");
			e.printStackTrace();
		} finally {
			try {
				if(conn != null) {
					conn.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	%>
</body>
</html>