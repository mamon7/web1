<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>select</title>
</head>
<body>
	<%@ include file="header.jsp"%>

	<section>
		<div>
			<h3>학생목록조회/수정</h3>
		</div>
		<table border="1" width="900" style="margin: 0 auto" align="center">
			<tr>
				<th>학생번호</th>
				<th>학생명</th>
				<th>학과코드</th>
				<th>생년월일</th>
				<th>학생상태</th>
				<th>학년</th>
				<th>전화번호</th>
				<th>주소</th>
			</tr>
			<%
				sql += "select STUDENT_NO, STUDENT_NAME,";
			sql += " decode(CLASS_CODE,'A1','컴퓨터공학','A2','사이버보안') CLASS_CODE,";
			sql += " to_char(BIRTH_DATE,'yyyy-mm-dd') BIRTH_DATE,";
			sql += " decode(STUDENT_STATUS,'1','재학','2','휴학','3','재학') STUDENT_STATUS,";
			sql += " STUDENT_GRADE, STUDENT_TEL, STUDENT_ADDR";
			sql += " from STUDENT_TBL";
			sql += " order by 1";

			rs = stmt.executeQuery(sql);

			while (rs.next()) {
			%>
			<tr align="center">
				<td><%=rs.getString(1)%></td>
				<td><a href="update.jsp?STUDENT_NAME=<%=rs.getString(2)%>"><%=rs.getString(2)%></a>
				<td><%=rs.getString(3)%></td>
				<td><%=rs.getString(4)%></td>
				<td><%=rs.getString(5)%></td>
				<td><%=rs.getString(6)%></td>
				<td><%=rs.getString(7)%></td>
				<td><%=rs.getString(8)%></td>
			</tr>
			<%
				}
			%>
		</table>

	</section>


	<%@ include file="footer.jsp"%>
</body>
</html>