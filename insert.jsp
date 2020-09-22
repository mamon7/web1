<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insert</title>
</head>
<script type="text/javascript">
	function check() {
		if (f.STUDENT_NO.value == "") {
			alert("학생번호가 입력되지 않았습니다.");
			return f.STUDENT_NO.focus();
		}
		if (f.STUDENT_NAME.value == "") {
			alert("학생명이 입력되지 않았습니다.");
			return f.STUDENT_NAME.focus();
		}
		if (f.CLASS_CODE[0].checked == false
				&& f.CLASS_CODE[1].checked == false) {
			alert("학과코드가 입력되지 않았습니다.");
			return;
		}
		if (f.BIRTH_DATE.value == "") {
			alert("생년월일이 입력되지 않았습니다.");
			return f.BIRTH_DATE.focus();
		}
		if (f.STUDENT_STATUS[0].checked == false
				&& f.STUDENT_STATUS[1].checked == false
				&& f.STUDENT_STATUS[2].checked == false) {
			alert("학생상태가 입력되지 않았습니다.");
			return;
		}
		if (f.STUDENT_GRADE.value == "") {
			alert("학년이 입력되지 않았습니다.");
			return f.STUDENT_GRADE.focus();
		}
		if (f.STUDENT_TEL.value == "") {
			alert("전화번호가 입력되지 않았습니다.");
			return f.STUDENT_TEL.focus();
		}
		if (f.STUDENT_ADDR.value == "") {
			alert("주소가 입력되지 않았습니다.");
			return f.STUDENT_ADDR.focus();
		}
		f.submit();
	}
</script>

<body>
	<%@include file="header.jsp"%>
	
	<%
		sql = "select nvl(max(STUDENT_NO),0)+1 as STUDENT_NO from STUDENT_TBL";
	rs = stmt.executeQuery(sql);
	rs.next();
	String STUDENT_NO = rs.getString("STUDENT_NO");
	%>
	
	<section>
	
		<div>
			<h3>학생등록</h3>
		</div>
		<form action="pro.jsp" method="post" name="f">
			<table border="1" style="margin: 0 auto" width="600" align="center">
				<tr>
					<th>학생번호</th>
					<td><input type="text" size="20" name="STUDENT_NO"
						value="<%=STUDENT_NO%>" readonly>(자동발생)</td>
				</tr>
				<tr>
					<th>학생명</th>
					<td><input type="text" size="20" name="STUDENT_NAME"></td>
				</tr>
				<tr>
					<th>학과코드</th>
					<td><input type="radio" value="A1" name="CLASS_CODE">컴퓨터공학
						<input type="radio" value="A2" name="CLASS_CODE">사이버보안</td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td><input type="text" size="20" name="BIRTH_DATE">(예)yyyy/mm/dd</td>
				</tr>
				<tr>
					<th>학생상태</th>
					<td><input type="radio" value="1" name="STUDENT_STATUS">재학
						<input type="radio" value="2" name="STUDENT_STATUS">휴학 <input
						type="radio" value="3" name="STUDENT_STATUS">졸업</td>
				</tr>
				<tr>
					<th>학년</th>
					<td><input type="text" size="10" name="STUDENT_GRADE"></td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td><input type="text" size="20" name="STUDENT_TEL">(예)010-1234-5678</td>
				</tr>
				<tr>
					<th>주소</th>
					<td><input type="text" size="60" name="STUDENT_ADDR"></td>
				</tr>
			</table>
			<center>
				<input type="submit" value="등록" onclick="check(); return false">
				&nbsp;&nbsp; <input type="button" value="조회"
					onclick="location='select.jsp'">
			</center>
		</form>
		
	</section>
	
	<%@include file="footer.jsp"%>
</body>
</html>