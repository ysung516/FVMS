<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import ="jsp.sheet.method.*"
    import = "java.io.PrintWriter"
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
	
		String num = request.getParameter("num");
		String AmPlace = request.getParameter("AMradio");
		if(AmPlace.equals("기타")){
			AmPlace = request.getParameter("AMother");
		}
		
		String PmPlace = request.getParameter("PMradio");
		if(PmPlace.equals("기타")){
			PmPlace = request.getParameter("PMother");
		}
		String date = request.getParameter("DATE");
		PrintWriter script =  response.getWriter();
		sheetMethod method = new sheetMethod();
		
		if(method.update_MSC(num, AmPlace, PmPlace, date) == 1){
			 script.print("<script> alert('일정이 수정되었습니다.'); location.href = 'manager_schedule.jsp'; </script>");
			
		} else script.print("<script> alert('수정되지 않았습니다.'); history.back(); </script>");
		
	
	%>
</body>
</html>