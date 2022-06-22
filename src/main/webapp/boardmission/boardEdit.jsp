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
//String sql="select * from notices where seq="+seq;
String sql="select * from board where bno=?";


//Statement st=conn.createStatement();
PreparedStatement pstmt=conn.prepareStatement(sql);
pstmt.setString(1, bno);

//ResultSet rs=st.executeQuery(sql);//stmtm형식 실행 select 실행
ResultSet rs=pstmt.executeQuery();//psmtm형식 실행
rs.next();

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/nstyle.css" />
</head>
<body>
<h3>boardEdit.jsp</h3>

<form action="boardEditProc.jsp" method="post">
<table class="twidth">
   <colgroup>
      <col width=15% />
      <col width=35% />
      <col width=5% />
      <col width=35% />
   </colgroup>
   <caption>boardDetail</caption>
   <tbody>
      <tr>
         <th class="Left">글번호</th>
         <td><%=rs.getString("bno") %></td>
         <th class="Left">조회수</th>
         <td><%=rs.getInt("bcnt") %></td>
      </tr>
      <tr>
         <th class="Left">작성자</th>
         <td><%=rs.getString("bwriter") %></td>
         <th class="Left">작성시간</th>
         <td><%=rs.getDate("bdate") %></td>
      </tr>
      <tr>
			<th class="Left">제목</th>
			<td colspan=3 id="bsubj">
				<input type="text" name="bsubj" value="<%=rs.getString("bsubj") %>" />
			</td>
	  </tr>
      <tr>
         <th class="Left">내용</th>
         <td colspan=3 id="bmemo">
         	<textarea class="txt" name="bmemo"><%=rs.getString("bmemo") %></textarea>
         </td>
      </tr>
      <tr>
         <th class="Left">첨부</th>
         <td colspan=3 id="addfile">
            첨부
         </td>
      </tr>
      
   </tbody>

</table>
<div>
	<input type="hidden" name="c" value="<%=rs.getString("bno") %>" />
	<input type="submit" value="수정" />
	<a href="boardDetail.jsp?c=<%=rs.getString("bno") %>"></a>
</div>
</form>
</body>
</html>