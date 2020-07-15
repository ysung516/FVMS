<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "java.io.PrintWriter"
    import = "jsp.sheet.method.*"
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
		sheetMethod method = new sheetMethod();
		String sessionID = session.getAttribute("sessionID").toString();
		String sessionName = session.getAttribute("sessionName").toString();
		PrintWriter script =  response.getWriter();
		method.saveUser_info(sessionID);
		String team = method.getMember().getTEAM();
		String place = request.getParameter("place");
		String startDate = request.getParameter("START_DATE");
		String endDate = request.getParameter("END_DATE");
		
		if(method.insert_MSC(sessionID, place, startDate, endDate, team, sessionName) == 1){
			script.print("<script> alert('일정이 추가 됬습니다.'); location.href = 'manager_schedule.jsp'</script>");
		} else script.print("<script> alert('빈칸을 모두 작성해주세요.'); history.back(); </script>");
		
	%>
</body>
</html>