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
		String sessionID = session.getAttribute("sessionID").toString();
		String sessionName = session.getAttribute("sessionName").toString();
		PrintWriter script =  response.getWriter();
		String AmPlace = request.getParameter("AMradio");
		if(AmPlace.equals("기타")){
			AmPlace = request.getParameter("AMother");
		}
		
		String PmPlace = request.getParameter("PMradio");
		if(PmPlace.equals("기타")){
			PmPlace = request.getParameter("PMother");
		}
		String date = request.getParameter("DATE");
		
		sheetMethod method = new sheetMethod();
		String num = method.doubleCheck(sessionID, date);
		method.saveUser_info(sessionID);
		String team = method.getMember().getTEAM();
		if(num.equals("")){
			if (method.insert_MSC(sessionID, AmPlace, PmPlace, date, team, sessionName) == 1){
				script.print("<script> alert('일정이 추가 됬습니다.'); location.href = 'manager_schedule.jsp'</script>");
			} else script.print("<script> alert('빈칸을 모두 작성해주세요.'); history.back(); </script>");
		}
		else{ 
			if(method.update_MSC(num, AmPlace, PmPlace, date) == 1){
			 script.print("<script> alert('일정이 수정되었습니다.'); location.href = 'manager_schedule.jsp'; </script>");
			} else script.print("<script> alert('수정되지 않았습니다.'); history.back(); </script>");
		}
	%>
</body>
</html>