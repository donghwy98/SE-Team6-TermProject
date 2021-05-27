<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>
<%@ include file="/connection.jsp" %>
<% 
	request.setCharacterEncoding("UTF-8"); 
	
	String name = request.getParameter("name");
	String phoneNumber = request.getParameter("phoneNumber");

	if(name!=null && phoneNumber != null ){
	
	int last_wNum = 0;
	
	Statement stmt = null;
	PreparedStatement pstmt = null;
	PreparedStatement pstmt2 = null;
	ResultSet rs = null;
	
	String sql = "SELECT last_waiting_number FROM wNumber";
	stmt = conn.createStatement();
	rs = stmt.executeQuery(sql);
	
	while(rs.next()){
		last_wNum = rs.getInt("last_waiting_number");
		last_wNum++;
	}
	
	if(last_wNum != 0){
		sql = "UPDATE wNumber SET last_waiting_number=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1,last_wNum);
		pstmt.executeUpdate();
		
		sql = "INSERT INTO waitingList (waiting_number, name, phoneNumber) VALUES (?, ?, ?)";
		pstmt2 = conn.prepareStatement(sql);
		pstmt2.setInt(1,last_wNum);
		pstmt2.setString(2, name);
		pstmt2.setString(3,phoneNumber);
		pstmt2.executeUpdate();
	}
	if(rs!=null)
		rs.close();
	if(stmt!=null)
		stmt.close();
	if(pstmt!=null)
		stmt.close();
	if(pstmt2!=null)
		stmt.close();
	}
%>
<!DOCTYPE html>
<html>
<head>
<link rel = "stylesheet"
href = "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"/>
<title>Insert title here</title>
</head>
<script>
	function del(){
		sql = "SELECT waiting_number from waitingList order by waiting_number ASC";
		PreparedStatement stmt = conn.createStatement();
		ResultSet rs = stmt2.executeQuery(sql);
		int num = rs.getInt("waiting_number");
		
		sql = "DELETE FROM waitingList WHERE waiting_number=?";
		PreparedStatement pstmt = conn.createStatement(sql);
		pstmt.setString(1, num);
		pstmt.executeUpdate();
	}
</script>
<body>
<%@ include file="./menu.jsp" %>
<% String greeting = "대기자 명단"; 
String tagline = "돌아가기";%>
<div class = "jumbotron">
	<div class = "container">
		<h1 class = "display-3"><%= greeting %>
		</h1>
	</div>
</div>
<div>
	<input type="button" value="삭제" onclick='del()'>
	<% 
	String sql = "SELECT * FROM waitingList";
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery(sql);
	while(rs.next()){ %>
	<hr>
	대기번호: <%=rs.getInt("waiting_number") %> 
	이름: <%=rs.getString("name") %>
	전화번호: <%=rs.getString("phoneNumber") %>
	<hr>
	<%
	}
	if(rs!=null)
		rs.close();
	if(stmt!=null)
		stmt.close();
	%>
</div>
<div class = "text-center">
	<h2><a href="./Main.jsp">
		<%= tagline %>
	</a></h2>
</div>
</body>
</html>