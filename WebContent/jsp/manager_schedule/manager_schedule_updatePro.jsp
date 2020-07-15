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
		String startDate = request.getParameter("START_DATE");
		String endDate = request.getParameter("END_DATE");
		String place = request.getParameter("place");
		PrintWriter script =  response.getWriter();
		sheetMethod method = new sheetMethod();
		
		if(method.update_MSC(num, place, startDate, endDate) == 1){
			 script.print("<script> alert('일정이 수정되었습니다.'); location.href = 'manager_schedule.jsp'; </script>");
			
		} else script.print("<script> alert('수정되지 않았습니다.'); history.back(); </script>");
		
	
	%>
</body>
</html>