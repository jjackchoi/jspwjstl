<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
String bno=request.getParameter("c");
%>
<%
String driver="oracle.jdbc.driver.OracleDriver";
String url="jdbc:oracle:thin:@localhost:1521:xe";
String user="hr";
String pw="123456";

Class.forName(driver);
Connection conn=DriverManager.getConnection(url,user,pw);
//접속성공
String sql="delete from board where bno=?";

PreparedStatement pstmt=conn.prepareStatement(sql);
pstmt.setString(1, bno);

int af=pstmt.executeUpdate();//delete 실행

if(af>0){
	//
	response.sendRedirect("board.jsp");
}else{
	//
	out.write("삭제오류");
}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>noticeDelProc</h3>

</body>
</html>