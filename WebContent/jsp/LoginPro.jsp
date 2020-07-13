<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "jsp.sheet.method.*"
    import = "java.io.PrintWriter"
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 처리 JSP</title>
</head>
<body>

	<%
		
	    String ID = request.getParameter("ID");
    	String PW = request.getParameter("PW");
   		PrintWriter script =  response.getWriter();
    	sheetMethod method = new sheetMethod();
   	if (method.loginCheck(ID, PW) == 1){
    		script.print("<script> location.href = '../jsp/summary/summary.jsp'; </script>");
    		session.setAttribute("sessionID", ID);
    	
    	} else 
    		script.print("<script> alert('아이디 혹은 비밀번호가 틀립니다.'); history.back(); </script>");
   	
		
	%>

</body>
</html>