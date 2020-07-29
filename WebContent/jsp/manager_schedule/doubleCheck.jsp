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
		sheetMethod method = new sheetMethod();
		PrintWriter script =  response.getWriter();
		String sessionID = session.getAttribute("sessionID").toString();
		String date = request.getParameter("date");
		String no = request.getParameter("num");
		String amPlace = request.getParameter("amPlace");
		String pmPlace = request.getParameter("pmPlace");
		String num = method.doubleCheck(sessionID, date);
		
		%>
		<form id="GoAdd" name="GoAdd"method="post" action="manager_schedule_add.jsp">
			<input type="hidden" name = "date" value="<%=date%>"/>
			</form>
		<form id="GoUpdate" name="GoUpdate" method="post" action="manager_schedule_update.jsp">
			<input type="hidden" name = "date" value="<%=date%>"/>
			<input type="hidden" name = "num" value="<%=no%>"/>
			<input type="hidden" name = "amPlace" value="<%=amPlace%>"/>
			<input type="hidden" name = "pmPlace" value="<%=pmPlace%>"/>
		</form>
		<%
		if(num.equals("")){
			%>
				<script>document.GoAdd.submit();</script>
			<%	
		} else {
			%>
				<script>document.GoUpdate.submit();</script>
			<%	
		}
	%>
	

</body>
</html>