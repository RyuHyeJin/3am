<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="conn.ConnectionContext" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.sql.*" %>
<% 
	request.setCharacterEncoding("utf-8"); 
%>
<jsp:useBean id="member" class="jsp.bean.member"/>
<jsp:setProperty name="member" property="*" />
<html>
<head><title>등록</title></head>
<body>
<%
Connection conn= ConnectionContext.getConnection();
Statement stmt=conn.createStatement();
ResultSet rs= stmt.executeQuery("SELECT * FROM member");
String[] storeID = new String[100];
String[] storePW = new String[100];
String id = request.getParameter("ID");
String pw = request.getParameter("PW");
int i = 0;
int count = 0;
while(rs.next()){
	storeID[i] = rs.getString("id");
	storePW[i] = rs.getString("password");
	i++;
}
for(int j=0;j<i;j++){
	if(id.equals(storeID[j]) && pw.equals(storePW[j])){
	session.setAttribute("ID",id);
	count = 1;
	}
}
/*System.out.println(i+"i");
System.out.println(id+"id");
System.out.println(pw+"pw");
for(int j=0;j<i;j++){
System.out.println(storeID[j]+"sid");
System.out.println(storePW[j]+"spw");
}
System.out.println(count+"()");
*/


if(count==1){%>
	<script>
	 alert("로그인에 성공하였습니다.");
	 </script>
	    <% response.sendRedirect("index.jsp");//로그인 성공시 가는 화면
		
	 }

	 else{  
		 //로그인 실패시 원래 화면으로 돌아간다.%>  
	  <script> 
		alert("로그인 ID,Password가 다릅니다.");
		history.go(-1);
		</script>
	 <% }

%>
</body></html>
