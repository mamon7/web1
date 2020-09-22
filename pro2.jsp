<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbcon.jsp" %>
<%
	String STUDENT_NO = request.getParameter("STUDENT_NO");
	String STUDENT_NAME = request.getParameter("STUDENT_NAME");
	String CLASS_CODE = request.getParameter("CLASS_CODE");
	String BIRTH_DATE = request.getParameter("BIRTH_DATE");
	String STUDENT_STATUS = request.getParameter("STUDENT_STATUS");
	String STUDENT_GRADE = request.getParameter("STUDENT_GRADE");
	String STUDENT_TEL = request.getParameter("STUDENT_TEL");
	String STUDENT_ADDR = request.getParameter("STUDENT_ADDR");
%>

<%
	try {
		sql+="update STUDENT_TBL set";
		sql+=" STUDENT_NAME= '"+STUDENT_NAME+"',";
		
		sql+=" CLASS_CODE= '"+CLASS_CODE+"',";
		sql+=" BIRTH_DATE= '"+BIRTH_DATE+"',";
		sql+=" STUDENT_STATUS= '"+STUDENT_STATUS+"',";
		sql+=" STUDENT_GRADE= '"+STUDENT_GRADE+"',";
		sql+=" STUDENT_TEL= '"+STUDENT_TEL+"',";
		sql+=" STUDENT_ADDR= '"+STUDENT_ADDR+"'";
		sql+=" where STUDENT_NO= '"+STUDENT_NO+"'";
		
		int result = stmt.executeUpdate(sql);

%>
<script>
	alert("학생등록수정이 완료 되었습니다.");
	location.href="select.jsp";

</script>
<%
	}catch(Exception e) {
%>
<script>
	alert("학생등록수정이 완료 되지 않았습니다.");
	history.back();

</script>
<%} %>
<%
if(con != null) con.close();
if(stmt != null) stmt.close();
if(rs != null) rs.close();
%>














