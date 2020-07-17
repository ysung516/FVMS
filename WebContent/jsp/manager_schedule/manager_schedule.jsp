<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "java.io.PrintWriter"
    import = "jsp.sheet.method.*"
    import = "jsp.Bean.model.MSC_Bean"
    import = "java.util.ArrayList"
    import = "java.util.Date"
    import = "java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html lang="en">

<head>

<%

	String sessionID = session.getAttribute("sessionID").toString();
	String sessionName = session.getAttribute("sessionName").toString();
	PrintWriter script =  response.getWriter();
	if (sessionID == null || sessionID.equals("") ){
		script.print("<script> alert('세션의 정보가 없습니다.'); location.href = '../../html/login.html' </script>");
	}
	
%>
<link href='./lib/main.css' rel='stylesheet' />
<script type="text/javascript" src="./fullcalendar-2.9.1/lib/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src='./lib/main.js'></script>
<script>
function formatDate(date) { 
		var d = new Date(date), 
		month = '' + (d.getMonth() + 1), 
		day = '' + d.getDate(), year = d.getFullYear(); 
		if (month.length < 2) month = '0' + month;
		if (day.length < 2) day = '0' + day; 
		return [year, month, day].join('-'); 
	}

document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');

    var calendar = new FullCalendar.Calendar(calendarEl, {
    	headerToolbar: {
            center: 'title',
            left: 'prev,next',
            right: 'today,dayGridWeek,dayGridMonth'
          },
        initialView: 'dayGridWeek',
    	navLinks: true,
      	editable: true,
      	dayMaxEvents: true, // allow "more" link when too many events
     
      <%
    	sheetMethod method = new sheetMethod();
		ArrayList<MSC_Bean> MSCList = new ArrayList<MSC_Bean>();
		MSCList = method.getMSCList();
 		
		String [] color = {"RED", "ORANGE", "BROWN", "GREEN", "BLACK", "PURPLE", "GRAY", "#FF0099"};
		String [] place = {"슈어소프트(본사, 삼성)", "슈어소프트(남양사무실)", "HMC(남양연구소)", "오트론(삼성)", 
				"모비스(의왕)", "모비스(마북)", "엠엔소프트(용산)", "트랜시스(남양)"};
		SimpleDateFormat format = new SimpleDateFormat("HH");
		Date time = new Date();
		int nowTime = Integer.parseInt(format.format(time));
      %>
      events: [
      <%
      	for(MSC_Bean li : MSCList){
      		String id = li.getNo()+ " " + li.getID();
         	 %> 
         	    	  {
         	    		  id : '<%=id%>',
         	    		  title: '<%=li.getTeam()%>\n<%=li.getName()%>\n오전: <%=li.getAMplace()%> \n오후: <%=li.getPMplace()%>',
         	    		  start: '<%=li.getDate()%>',
         	    		  <%for(int i = 0; i < place.length; i++){
         	    			  if (nowTime >= 12){
         	    				  if(li.getPMplace().equals(place[i])){
         	    					 %>color: '<%=color[i]%>'<%  
         	    				  }
         	    			  } else {
         	    				  if(li.getAMplace().equals(place[i])){
           	    				  	%>color: '<%=color[i]%>'<%         	    					  
         	    				  }
         	    			  }
         	    		  }%> 
         	    		   
         	    	  },
         <%}%>
         ]
      , eventClick: function(arg) {
    		var str = arg.event.id.split(' ');
    		var no = str[0];
    		var id = str[1];
    		var date = formatDate(arg.event.start);
    		var str2 = arg.event.title.split(' ');
    		var amPlace = str2[1];
    		var pmPlace = str2[3];
    		
        	if(id == '<%=sessionID%>'){
        		if(confirm("일정을 수정하시겠습니까?") == true){
        			var setNo = document.getElementById("number");
        			var setDate = document.getElementById("setDate");
        			var setAm = document.getElementById("setAm");
        			var setPm = document.getElementById("setPm");
        			setNo.value = no;
        			setDate.value = date;
        			setAm.value = amPlace;
        			setPm.value = pmPlace;
        			document.jsvarform.submit();
        			
        		}
        	}	// end if
      }	//end eventClick
      	

       });
    calendar.render();
  });
</script>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Sure FVMS - Manager_Schedule_add</title>

  <!-- Custom fonts for this template-->
  <link href="../../vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="../../https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="../../css/sb-admin-2.min.css" rel="stylesheet">
  
<style>
.fc-daygrid-event {
	white-space: pre;
}

.fc .fc-col-header-cell.fc-day-today {
	background-color: rgb(153, 153, 255);
	background-color: var(- -fc-today-bg-color, rgb(153, 153, 255));
}

.fc .fc-daygrid-day.fc-day-today {
	background-color: rgb(153, 153, 255);
	background-color: var(- -fc-today-bg-color, rgb(153, 153, 255));
}

.fc .fc-toolbar{
	display: inline;
    justify-content: space-between;
    align-items: center;
}

.fc-direction-ltr{
	direction: lrt;
	text-align: center;
}

#calendar {
	padding: 5px;
	max-width: 1100px;
	margin: 0 auto;
}

.fc .fc-button-group > .fc-button {
    position: relative;
    flex: 1 1 auto;
    background-color: #858796;
    }
</style>

</head>

<body id="page-top">
  <!-- Page Wrapper -->
  <div id="wrapper">

    <!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

      <!-- Sidebar - Brand -->
      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="../summary/summary.jsp">
        <div class="sidebar-brand-icon rotate-n-15">
          <i class="fas fa-laugh-wink"></i>
        </div>
        <div class="sidebar-brand-text mx-3">Sure FVMS</div>
      </a>

   <!-- Divider -->
			<hr class="sidebar-divider my-0">

			<!-- Nav Item - summary -->
		    <li class="nav-item">
	          <a class="nav-link" href="../summary/summary.jsp">
	          <i class="fas fa-fw fa-table"></i>
	          <span>요약정보</span></a>
	     	</li>
      
       		<!-- Nav Item - project -->
      		<li class="nav-item">
     	     <a class="nav-link" href="../project/project.jsp">
             <i class="fas fa-fw fa-clipboard-list"></i>
             <span>프로젝트</span></a>
     	    </li>
      
		    <!-- Nav Item - rowdata -->
		    <li class="nav-item">
		      <a class="nav-link" href="../rowdata/rowdata.jsp">
		      <i class="fas fa-fw fa-chart-area"></i>
		      <span>인력</span></a>
     		</li>
     		
	      <!-- Nav Item - schedule -->
	      <li class="nav-item ">
	        <a class="nav-link" href="../schedule/schedule.jsp">
	        <i class="fas fa-fw fa-calendar"></i>
	        <span>스케줄</span></a>
	      </li>
	      
	      <!-- Nav Item - manager schedule -->
	      <li class="nav-item active">
	        <a class="nav-link" href="../manager_schedule/manager_schedule.jsp">
	        <i class="fas fa-fw fa-calendar"></i>
	        <span>관리자 스케줄</span></a>
	      </li>
	      
	      <!-- Nav Item - dayreport -->
			<li class="nav-item">
			  <a class="nav-link" href="../day_report/day_report.jsp">
			  <i class="fas fa-fw fa-clipboard-list"></i> 
			  <span>일간보고서</span></a>
			</li>
		
		  <!-- Nav Item - report -->
			<li class="nav-item">
			  <a class="nav-link" href="../report/report.jsp">
			  <i class="fas fa-fw fa-clipboard-list"></i> 
			  <span>주간보고서</span></a>
			</li>
      


      <!-- Divider -->
      <hr class="sidebar-divider d-none d-md-block">

      <!-- Sidebar Toggler (Sidebar) -->
      <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
      </div>

    </ul>
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      
      <div id="content">      
        <!-- Topbar -->
        <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

          <!-- Sidebar Toggle (Topbar) -->
          <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
            <i class="fa fa-bars"></i>
          </button>

          <!-- Topbar Search -->
          <form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
            <div class="input-group">
              <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
              <div class="input-group-append">
                <button class="btn btn-primary" type="button">
                  <i class="fas fa-search fa-sm"></i>
                </button>
              </div>
            </div>
          </form>

          <!-- Topbar Navbar -->
          <ul class="navbar-nav ml-auto">

        

            <div class="topbar-divider d-none d-sm-block"></div>

            <!-- Nav Item - User Information -->
            <li class="nav-item dropdown no-arrow">
              <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <span class="mr-2 d-none d-lg-inline text-gray-600 small"><%=sessionName%></span>
                <i class="fas fa-info-circle"></i>
              </a>
              <!-- Dropdown - User Information -->
              <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                  <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                  Logout
                </a>
              </div>
            </li>

          </ul>

        </nav>
        <!-- End of Topbar -->

        <!-- Begin Page Content -->
        <div class="container-fluid">
        
     <div class="card shadow mb-4">
     
     <div class="card-header py-3">
     
    <!-- /.container-fluid -->
		<div id='calendar'></div>
		
		<form id="jsvarform" name ="jsvarform" action="manager_schedule_update.jsp">
			<input id="number" type="hidden" name = "num" value="" />
			<input id="setDate" type="hidden" name = "date" value="" />
			<input id="setAm" type="hidden" name = "amPlace" value="" />
			<input id="setPm" type="hidden" name = "pmPlace" value="" />
		</form>
		 <div class="card-body" style="margin: 0 auto;display: table;">
      		<a href="manager_schedule_add.jsp" class="btn btn-primary">일정등록</a>
      	</div>
 		
      </div>
     </div>
      <!-- End of Main Content -->

      <!-- Footer -->
      <footer class="sticky-footer bg-white">
        <div class="container my-auto">
          <div class="copyright text-center my-auto">
            <span>Copyright &copy; Your Website 2020</span>
          </div>
        </div>
      </footer>
      <!-- End of Footer -->
      </div>
		</div>
    </div>
    <!-- End of Content Wrapper -->

  </div>
  <!-- End of Page Wrapper -->

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <!-- Logout Modal-->
  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
          <a class="btn btn-primary" href="../../html/login.html">Logout</a>
        </div>
      </div>
    </div>
  </div>
 

  <!-- Bootstrap core JavaScript-->
  <script src="../../vendor/jquery/jquery.min.js"></script>
  <script src="../../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="../../vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="../../js/sb-admin-2.min.js"></script>

  <!-- Page level plugins -->
  <script src="../../vendor/chart.js/Chart.min.js"></script>

  <!-- Page level custom scripts -->
  <script src="../../js/demo/chart-area-demo.js"></script>
  <script src="../../js/demo/chart-pie-demo.js"></script>
  <script src="../../js/demo/chart-bar-demo.js"></script>

</body>

</html>
