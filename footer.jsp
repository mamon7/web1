<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>footer</title>
</head>
<body>
<footer>
HRDKOREA Copyrightⓒ 2016 All right reserved. Human Resources Development Service of Korea.
</footer>
</body>
</html>
<%
if(con != null)con.close();
if(stmt != null)stmt.close();
if(rs != null)rs.close();


%>