<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>select2</title>
</head>



<body>
	<%@ include file="header.jsp"%>



	<section>
		
		<div>
			<h3>학생 성적 조회</h3>
		</div>
		
		<table border="1" width="600" style="margin: 0 auto" align="center">
			<tr>
				<th>학번</th>
				<th>이름</th>
				<th>학년 - 학기</th>
				<th>성적</th>

			</tr>
			<%
				sql += "select st.STUDENT_NO, STUDENT_NAME, SCORE_YEAR, SCORE_TERM, round(sum(SCORE*SCORE_UNIT)/sum(SCORE_UNIT),1) as grade";
			sql += " from STUDENT_TBL st join SCORE_TBL sc";
			sql += " on st.STUDENT_NO = sc.STUDENT_NO";
			sql += " group by st.STUDENT_NO, STUDENT_NAME, SCORE_YEAR, SCORE_TERM";
			sql += " order by SCORE_TERM, st.STUDENT_NO";
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
			%>
			<tr align="center">
				<td><%=rs.getString(1)%></td>
				<td><%=rs.getString(2)%></td>
				<td><%=rs.getString(3)%> - <%=rs.getString(4)%></td>
				<td><%=rs.getString(5)%></td>

			</tr>
			<%
				}
			%>
		</table>




	</section>



	<%@ include file="footer.jsp"%>
</body>
</html>