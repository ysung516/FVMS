<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "jsp.sheet.method.*"
    %>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 처리 JSP</title>
</head>
<body>

	<%
	    String id= request.getParameter("id");
    	String pw = request.getParameter("pw");
   
    	
    	sheetMethod method = new sheetMethod();

   	if (method.loginCheck(id, pw) == 1){
    		out.print("alert('로그인 성공')");
    	} else 
    		out.print("alert('로그인 실패')");
		
	%>

</body>
</html>