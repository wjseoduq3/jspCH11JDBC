<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이름으로 회원 검색하여 반환</title>
</head>
<body>
// 미완성임 //
	<%
		request.setCharacterEncoding("utf-8");
		
		String searchName = request.getParameter("name");
	
		String sql = "SELECT * FROM student_tbl WHERE name = '"+searchName+"'";
				
		String driverName = "com.mysql.jdbc.Driver";
		String url="jdbc:mysql://192.168.0.100:3306/jdy_school_db";
		// String url="jdbc:mysql://localhost:3306/jdy_school_db";
		String username ="guest01";
		// String username ="root";
		String password ="12345";
		
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName(driverName); // mySQL 드라이브 불러오기
			conn = DriverManager.getConnection(url, username, password);
			stmt = conn.createStatement();
			
			// int resultNum = stmt.executeUpdate(sql); // sql문을 DB에실행 --> delete, insert, update 에만 적용
			// 반환값이 1이면 성공, 아니면 실패
			
			rs = stmt.executeQuery(sql);
			
			// ArrayList memberList = new ArrayList();
			// memberList = null;
			
			while (rs.next()) {
				int sno =rs.getInt("sno");
				String name = rs.getString("name");
				String dept = rs.getString("dept");
				if (name.equals(null)) {
					out.println("검색하신 회원은 없는 회원입니다.");
				} else {
					System.out.println(sno);
					out.println(sno + "/" + name + "/" + dept + "<br><br>");	
				}						
			}
						
		} catch (Exception e) {
			out.println("DB연결 실패! 회원목록 불러오기 실패!");
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