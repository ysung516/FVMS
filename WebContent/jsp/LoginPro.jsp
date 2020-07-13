<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "jsp.sheet.method.*"
    import = "java.io.PrintWriter"
    %>
<jsp:useBean id="userInfo" class = "jsp.member.model.MemberBean" scope = "session"></jsp:useBean>

    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 처리 JSP</title>
</head>
<body>

	<%
		//JspBean jb = new JspBean();
		
	    String ID = request.getParameter("ID");
    	String PW = request.getParameter("PW");
   		PrintWriter script =  response.getWriter();
    	sheetMethod method = new sheetMethod();
   	if (method.loginCheck(ID, PW) == 1){
    		script.print("<script> location.href = 'summary/summary.jsp'; </script>");
    		session.setAttribute("sessionID", ID);
    		 //String memberData[] = method.saveUser_info(session.getAttribute("sessionID").toString());
   
    		
    	} else 
    		script.print("<script> alert('아이디 혹은 비밀번호가 틀립니다.'); history.back(); </script>");
   	
		
	%>

</body>
</html>