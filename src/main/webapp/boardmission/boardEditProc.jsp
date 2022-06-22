<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
String bsubj=request.getParameter("bsubj");
String bmemo=request.getParameter("bmemo");
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
//String sql="select * from notices where seq="+seq;
String sql="update board set bsubj=?, bmemo=? where bno=?";


//Statement st=conn.createStatement();
PreparedStatement pstmt=conn.prepareStatement(sql);
pstmt.setString(1, bsubj);
pstmt.setString(2, bmemo);
pstmt.setString(3, bno);

//ResultSet rs=st.executeQuery(sql);//stmtm형식 실행 select 실행
int cnt=pstmt.executeUpdate();//psmtm형식 실행

response.sendRedirect("boardDetail.jsp?c="+bno);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>boardEditProc.jsp</h3>

</body>
</html>