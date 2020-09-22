<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>update</title>
</head>

<script>
	function check() {
		if(f.STUDENT_NO.value == "") {
			alert("학생번호가 입력되지 않았습니다.");
			return f.STUDENT_NO.focus();
		}
		if(f.STUDENT_NAME.value == "") {
			alert("학생명이 입력되지 않았습니다.");
			return f.STUDENT_NAME.focus();
		}
		if(f.CLASS_CODE[0].checked == false && f.CLASS_CODE[1].checked == false) {
			alert("학과코드가 입력되지 않았습니다.");
			return ;
		}
		if(f.BIRTH_DATE.value == "") {
			alert("생년월일이 입력되지 않았습니다.");
			return f.BIRTH_DATE.focus();
		}
		if(f.STUDENT_STATUS[0].checked == false && f.STUDENT_STATUS[1].checked == false && f.STUDENT_STATUS[2].checked == false) {
			alert("학생상태가 입력되지 않았습니다.");
			return ;
		}
		if(f.STUDENT_GRADE.value == "") {
			alert("학년이 입력되지 않았습니다.");
			return f.STUDENT_GRADE.focus();
		}
		if(f.STUDENT_TEL.value == "") {
			alert("전화번호가 입력되지 않았습니다.");
			return f.STUDENT_TEL.focus();
		}
		if(f.STUDENT_ADDR.value == "") {
			alert("주소가 입력되지 않았습니다.");
			return f.STUDENT_ADDR.focus();
		}
		f.submit();
	}
	
</script>

<body>

<%@ include file="header.jsp" %>

<%
	
	String STUDENT_NAME = request.getParameter("STUDENT_NAME");
	
	sql+="select STUDENT_NO, CLASS_CODE, "; 
	sql+=" to_char(BIRTH_DATE,'yyyy/mm/dd') BIRTH_DATE,";	 
	sql+=" STUDENT_STATUS, STUDENT_GRADE, STUDENT_TEL, STUDENT_ADDR";	 
	sql+=" from STUDENT_TBL";	 
	sql+=" where STUDENT_NAME = '"+STUDENT_NAME+"'";	 
	rs=stmt.executeQuery(sql);
	rs.next();
	
	String STUDENT_NO =rs.getString("STUDENT_NO");
	String CLASS_CODE =rs.getString("CLASS_CODE");
	String BIRTH_DATE =rs.getString("BIRTH_DATE");
	String STUDENT_STATUS =rs.getString("STUDENT_STATUS");
	String STUDENT_GRADE =rs.getString("STUDENT_GRADE");
	String STUDENT_TEL =rs.getString("STUDENT_TEL");
	String STUDENT_ADDR =rs.getString("STUDENT_ADDR");
	
%>

<section>
	
	<div>
		<h3>학생정보 수정</h3>
	</div>
	
	<form name="f" method="post" action="pro2.jsp">
		<table border="1" width="600" style="margin:0 auto" align="center">
			<tr>
				<th>학생번호</th>
				<td>
					<input type="text" size="20" name="STUDENT_NO" value="<%=STUDENT_NO %>" readonly>
				</td>
			</tr>
			<tr>
				<th>학생명</th>
				<td>
					<input type="text" size="20" name="STUDENT_NAME" value="<%=STUDENT_NAME %>">
				</td>
			</tr>
			<tr>
				<th>학과코드</th>
				<td>
					<input type="radio" name="CLASS_CODE" value="A1" <%if(CLASS_CODE != null && CLASS_CODE.equals("A1")) {out.print("checked='checked'");} %>> 컴퓨터공학
					<input type="radio" name="CLASS_CODE" value="A2" <%if(CLASS_CODE != null && CLASS_CODE.equals("A2")) {out.print("checked='checked'");} %>> 사이버보안
				</td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td>
					<input type="text" size="20" name="BIRTH_DATE" value="<%=BIRTH_DATE %>">(예)yyyy/mm/dd
				</td>
			</tr>
			<tr>
				<th>학생상태</th>
				<td>
					<input type="radio" name="STUDENT_STATUS" value="1" <%if(STUDENT_STATUS !=null && STUDENT_STATUS.equals("1")) {out.print("checked='checked'");} %>> 재학
					<input type="radio" name="STUDENT_STATUS" value="2" <%if(STUDENT_STATUS !=null && STUDENT_STATUS.equals("2")) {out.print("checked='checked'");} %>> 휴학
					<input type="radio" name="STUDENT_STATUS" value="3" <%if(STUDENT_STATUS !=null && STUDENT_STATUS.equals("3")) {out.print("checked='checked'");} %>> 졸업
				</td>
			</tr>
			<tr>
				<th>학년</th>
				<td>
					<input type="text" size="10" name="STUDENT_GRADE" value="<%=STUDENT_GRADE %>">
				</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td>
					<input type="text" size="20" name="STUDENT_TEL" value="<%=STUDENT_TEL %>">(예)010-1234-5678
				</td>
			</tr>
			<tr>
				<th>주소</th>
				<td>
					<input type="text" size="60" name="STUDENT_ADDR" value="<%=STUDENT_ADDR %>">
				</td>
			</tr>
		
		
		</table>
		
		<center>
		<input type="submit" value="수정" onclick="check(); return false"> &nbsp;&nbsp;
		<input type="button" value="조회"	 onclick="location='select.jsp'">
		</center>
		
	</form>
</section>

<%@ include file="footer.jsp" %>
</body>
</html>