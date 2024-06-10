<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 리스트 확인</title>
</head>
<body>
	<%
		String sql = "SELECT * FROM student_tbl";
	
		String driverName = "com.mysql.jdbc.Driver";
		String url="jdbc:mysql://192.168.0.100:3306/jdy_school_db";
		String username ="guest01";
		String password ="12345";
		
		Connection conn = null; // DB와의 연결
		Statement stmt = null; // sql문 실행
		ResultSet rs = null; // select를 사용할 때만 필요 --> DB에서 반환하는 결과받는 타입
		
		try {
			Class.forName(driverName); // mySQL 드라이브 불러오기
			conn = DriverManager.getConnection(url, username, password);
			stmt = conn.createStatement();
			
			// int resultNum = stmt.executeUpdate(sql); // sql문을 DB에실행 --> delete, insert, update 에만 적용
			// 반환값이 1이면 성공, 아니면 실패
			
			rs = stmt.executeQuery(sql);
			
			// ArrayList memberList = new ArrayList(); 6/11일 수업 내용
			// memberList = null;
			
			while(rs.next()) {
				int sno = rs.getInt("sno");
				String name = rs.getString("name");
				String dept = rs.getString("dept");
				
				out.println(sno + "/" + name + "/" + dept + "<br><br>");
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