<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입 확인</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
	
		String sno = request.getParameter("sno");
		String name = request.getParameter("name");
		String dept = request.getParameter("dept");
		
		String sql = "INSERT INTO student_tbl VALUES ('"+sno+"', '"+name+"', '"+dept+"')";
	
		String driverName = "com.mysql.jdbc.Driver";
		String url="jdbc:mysql://192.168.0.100:3306/jdy_school_db";
		String username ="guest01";
		String password ="12345";
		
		
		Connection conn = null;
		Statement stmt = null;
		
		try {
			Class.forName(driverName); // mySQL 드라이브 불러오기
			conn = DriverManager.getConnection(url, username, password);
			stmt = conn.createStatement();
			
			int resultNum = stmt.executeUpdate(sql); // sql문을 DB에실행 --> delete, insert, update 에만 적용
			// 반환값이 1이면 성공, 아니면 실패
			if (resultNum == 1) {
				out.println("회원가입성공");
			} else {
				out.println("회원가입실패");	
			}			
		} catch (Exception e) {
			out.println("DB연결 실패! 회원가입실패!");
		} finally {
			try {
				if (stmt != null) {
					stmt.close();
				}
				if (stmt != null) {
					conn.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
			
	%>

</body>
</html>