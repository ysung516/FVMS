<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "java.io.PrintWriter"
    import = "jsp.sheet.method.*"
    import = "java.util.ArrayList"
	import = "java.util.Arrays"
	import = "java.util.List"
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
		String date_arr[] = new String[5];
		String AmPlace_arr[] = new String[5];
		String PmPlace_arr[] = new String[5];
		//String date = request.getParameter("DATE");
		
		String AMother = "미입력";
		String PMother = "미입력";
		String level;
		
		//save date
		date_arr[0] = request.getParameter("DATE_mon");
		date_arr[1] = request.getParameter("DATE_tue");
		date_arr[2] = request.getParameter("DATE_wed");
		date_arr[3] = request.getParameter("DATE_thu");
		date_arr[4] = request.getParameter("DATE_fri");
		
		//mon
		if(!(request.getParameter("amselboxDirect_mon") == "")){
			AMother = request.getParameter("amselboxDirect_mon");	
		}
		
		if(!(request.getParameter("pmselboxDirect_mon") == "")){
			PMother = request.getParameter("pmselboxDirect_mon");	
		}
		
		
		AmPlace_arr[0] = request.getParameter("amPlaceSel_mon");
		if(AmPlace_arr[0] != null && AmPlace_arr[0].equals("기타")){
			AmPlace_arr[0] = AMother;
		}
		
		PmPlace_arr[0] = request.getParameter("pmPlaceSel_mon");
		if(PmPlace_arr[0] != null && PmPlace_arr[0].equals("기타")){
			PmPlace_arr[0] = PMother;
		}
		
		//tue
		if(!(request.getParameter("amselboxDirect_tue") == "")){
			AMother = request.getParameter("amselboxDirect_tue");	
		}
		
		if(!(request.getParameter("pmselboxDirect_tue") == "")){
			PMother = request.getParameter("pmselboxDirect_tue");	
		}
		
		
		AmPlace_arr[1] = request.getParameter("amPlaceSel_tue");
		if(AmPlace_arr[1] != null && AmPlace_arr[1].equals("기타")){
			AmPlace_arr[1] = AMother;
		}
		
		PmPlace_arr[1] = request.getParameter("pmPlaceSel_tue");
		if(PmPlace_arr[1] != null && PmPlace_arr[1].equals("기타")){
			PmPlace_arr[1] = PMother;
		}
		
		//wed
		if(!(request.getParameter("amselboxDirect_wed") == "")){
			AMother = request.getParameter("amselboxDirect_wed");	
		}
		
		if(!(request.getParameter("pmselboxDirect_wed") == "")){
			PMother = request.getParameter("pmselboxDirect_wed");	
		}
		
		
		AmPlace_arr[2] = request.getParameter("amPlaceSel_wed");
		if(AmPlace_arr[2] != null && AmPlace_arr[2].equals("기타")){
			AmPlace_arr[2] = AMother;
		}
		
		PmPlace_arr[2] = request.getParameter("pmPlaceSel_wed");
		if(PmPlace_arr[2] != null && PmPlace_arr[2].equals("기타")){
			PmPlace_arr[2] = PMother;
		}
		
		//thu
		if(!(request.getParameter("amselboxDirect_thu") == "")){
			AMother = request.getParameter("amselboxDirect_thu");	
		}
		
		if(!(request.getParameter("pmselboxDirect_thu") == "")){
			PMother = request.getParameter("pmselboxDirect_thu");	
		}
		
		
		AmPlace_arr[3] = request.getParameter("amPlaceSel_thu");
		if(AmPlace_arr[3] != null && AmPlace_arr[3].equals("기타")){
			AmPlace_arr[3] = AMother;
		}
		
		PmPlace_arr[3] = request.getParameter("pmPlaceSel_thu");
		if(PmPlace_arr[3] != null && PmPlace_arr[3].equals("기타")){
			PmPlace_arr[3] = PMother;
		}
	
		//fri
		if(!(request.getParameter("amselboxDirect_fri") == "")){
			AMother = request.getParameter("amselboxDirect_fri");	
		}
		
		if(!(request.getParameter("pmselboxDirect_fri") == "")){
			PMother = request.getParameter("pmselboxDirect_fri");	
		}
		
		
		AmPlace_arr[4] = request.getParameter("amPlaceSel_fri");
		if(AmPlace_arr[4] != null && AmPlace_arr[4].equals("기타")){
			AmPlace_arr[4] = AMother;
		}
		
		PmPlace_arr[4] = request.getParameter("pmPlaceSel_fri");
		if(PmPlace_arr[4] != null && PmPlace_arr[4].equals("기타")){
			PmPlace_arr[4] = PMother;
		}
		
		//level
		if(sessionName.equals("유영민")){
			level = "1";
		} else if (sessionName.equals("송우람")){
			level = "2";
		} else if (sessionName.equals("최인석")){
			level = "3";
		} else if (sessionName.equals("이창우")){
			level = "4";
		} else if (sessionName.equals("윤영산")){
			level = "5";
		} else if (sessionName.equals("이창수")){
			level = "6";
		} else {
			level = "1000";
		}
		
		
		sheetMethod method = new sheetMethod();
		method.saveUser_info(sessionID);
		String team = method.getMember().getTEAM();
		List<String> print = method.week_MSC(AmPlace_arr, PmPlace_arr, date_arr, team, sessionID, sessionName, level);
		if(print.isEmpty() == false){
			%><script> alert('<%for(String value : print){out.print(value);%>'+'\n'+'<%}%>'+'\n일정이 입력되었습니다.'); location.href = 'manager_schedule.jsp'; </script><%
		}else  %><script> alert('일정 입력이 실패되었습니다.'); location.href = 'manager_schedule.jsp'; </script>
</body>
</html>