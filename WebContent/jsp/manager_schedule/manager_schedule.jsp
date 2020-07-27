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

	PrintWriter script =  response.getWriter();
	if (session.getAttribute("sessionID") == null){
		script.print("<script> alert('세션의 정보가 없습니다.'); location.href = '../../html/login.html' </script>");
	}

	String sessionID = session.getAttribute("sessionID").toString();
	String sessionName = session.getAttribute("sessionName").toString();
	

%>
<link href='./lib/main.css' rel='stylesheet' />
<script type="text/javascript" src="./fullcalendar-2.9.1/lib/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.0/jquery-ui.min.js"></script>
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
    	navLinks: false,
      	editable: false,
      	hiddenDays: [0,6],
      	dayMaxEvents: true, // allow "more" link when too many events
      	
     
      <%
    	sheetMethod method = new sheetMethod();
		ArrayList<MSC_Bean> MSCList = new ArrayList<MSC_Bean>();
		MSCList = method.getMSCList();
 		
		SimpleDateFormat format = new SimpleDateFormat("HH");
		Date time = new Date();
		int nowTime = Integer.parseInt(format.format(time));
      %>
      
      eventOrder: 'level',
      events: [ 	  
      <%
      	for(MSC_Bean li : MSCList){
      		String id = li.getNo()+ " " + li.getID();
         	 %> 
         	    	  {
         	    		  groupId: '<%=li.getName()%>',
         	    		  level: <%=li.getLevel()%>,
         	    		  <%if(li.getLevel().equals("1")){
         	    			  %>className: "layout-1",
         	    			  
       	    			 <%} else if(li.getLevel().equals("2")){
           	    			 %>className: "layout-2",
           	    			 
         	    		  <%} else if(li.getLevel().equals("3")){
         	    			 %>className: "layout-3",
         	    		  <%
         	    		  	} else if(li.getLevel().equals("4")){
         	    		  	%>className: "layout-4",
         	    		  	
         	    		  <%} else if(li.getLevel().equals("5")){
         	    			 %>className: "layout-5",
         	    			 
         	    		  <%} else if(li.getLevel().equals("6")){
         	    			 %>className: "layout-6",
         	    		  <%}%>
         	    		  
         	    		  id : '<%=id%>',
         	    		  title: '<%=li.getName()%>\n오전: <%=li.getAMplace()%> \n오후: <%=li.getPMplace()%>',
         	    		  start: '<%=li.getDate()%>',
         	    		  backgroundColor: 'white',
         	    		  textColor: 'black',
         	    		  
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
        		} else{
        			window.location.reload()
        		}
        	}	// end if
      }	//end eventClick
      	

       });
    calendar.render();
   
  });
  
  	// ui 바뀐것들
	window.onload = function (){
		fnMove();
	}
	function fnMove(){
	    var offset = $(".fc .fc-col-header-cell.fc-day-today").offset();
	    $('#calendar').animate({scrollLeft : offset.left}, 200);
	}	
	
     //다음주 버튼 누르면 월요일로 가게 할 함수
	function nextMove(){
	    var offset = $(".fc .fc-col-header-cell.fc-day.fc-day-mon").offset();
	    $('#calendar').animate({scrollLeft : offset.left}, 200);
	}
     
	 //지난주 버튼 누르면 금요일로 가게 할 함수
	function preMove(){
	    var offset = $(".fc .fc-col-header-cell.fc-day.fc-day-fri").offset();
	    $('#calendar').animate({scrollLeft : offset.left}, 200);
	}
     
	$(function(){
		$('.fc-next-button.fc-button.fc-button-primary').click(function(){
			nextMove();
		}); 
	});
	
	$(function(){
		$('.fc-prev-button.fc-button.fc-button-primary').click(function(){
			preMove();
		}); 
	});

	$(function(){
		$('.fc-day-mon').click(function(){
		     var date = $(".fc-day-mon").attr("data-date");
		     var day_data = document.getElementById("date");
		     day_data.value = date;
		     document.Dayform.submit();
		    
		});
		$('.fc-day-tue').click(function(){
		     var date = $(".fc-day-tue").attr("data-date");
		     var day_data = document.getElementById("date");
		     day_data.value = date;
		     document.Dayform.submit();
		});
		$('.fc-day-wed').click(function(){
		     var date = $(".fc-day-wed").attr("data-date");
		     var day_data = document.getElementById("date");
		     day_data.value = date;
		     document.Dayform.submit();
		});
		$('.fc-day-thu').click(function(){
		     var date = $(".fc-day-thu").attr("data-date");
		     var day_data = document.getElementById("date");
		     day_data.value = date;
		     document.Dayform.submit();	
		});
		$('.fc-day-fri').click(function(){
		     var date = $(".fc-day-fri").attr("data-date");
		     var day_data = document.getElementById("date");
		     day_data.value = date;
		     document.Dayform.submit();
		});
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

.fc .fc-daygrid-event-harness{
	margin-bottom:15px;
}
.fc-popover.fc-more-popover{
	top: 10% !important;
	left: 30% !important;
}

.layout-1{
	border-color: red;
}
.layout-2{
	
	border-color: orange;
}
.layout-3{
	
	border-color: brown;
}
.layout-4{
	
	border-color: green;
}
.layout-5{

	border-color: black;
}
.layout-6{
	margin-top:20px;
	border-color: purple;
}


.fc-daygrid-event {
	white-space: pre;
}

.fc .fc-col-header-cell.fc-day-today {
	background-color:#b2c8f080;
	background-color: var(- -fc-today-bg-color, rgba(120, 223, 202, 0.46));
}

.fc .fc-daygrid-day.fc-day-today {
	background-color:#b2c8f080;
	background-color: var(- -fc-today-bg-color, rgba(120, 223, 202, 0.46));
}

.fc .fc-toolbar{
 	display: inline;
    justify-content: space-between;
    align-items: center;
    margin-right:10px;
    top: 0;
    left: 0;
    position: sticky;
}

.fc-direction-ltr{
	direction: lrt;
	text-align: center;
}

#calendar {
	padding: 5px;
	max-width: 1100px;
	margin: 0 auto;
	display:flex;
}
@media(max-width:320px){
	
	.container-fluid{
		padding: 0;
	}
	.card-header:first-child{
		padding: 0;
	}
	
	#calendar{
		overflow: auto;
		height:788px;
		display:flex;
		clear: both;
	}
	
	.fc-scrollgrid-sync-table{
		width:788px !important;
	}
	.fc-col-header{
	width:788px !important;
	}
	.fc .fc-scrollgrid-liquid
	{
	width:788px;
	
	}
	.fc-dayGridWeek-view{
		width:788px !important;
		overflow:scoll;
	}
	
	.fc .fc-button-group > .fc-button {
    position: relative;
    flex: 1 1 auto;
    background-color: #858796;
    }
}

@media(max-width:360px) and (min-width:321px){
	
		.container-fluid{
		padding: 0;
	}
	.card-header:first-child{
		padding: 0;
	}
	
	#calendar{
		overflow: auto;
		height:800px;
		display:flex;
		clear: both;
	}
	
	.fc-scrollgrid-sync-table{
		width:880px !important;
	}
	.fc-col-header{
	width:880px !important;
	}
	.fc .fc-scrollgrid-liquid
	{
	width:880px;
	
	}
	.fc-dayGridWeek-view{
		width:880px !important;
		overflow:scoll;
	}
	
	.fc .fc-button-group > .fc-button {
    position: relative;
    flex: 1 1 auto;
    background-color: #858796;
    }
}
@media(max-width:380px) and (min-width:361px){
		.container-fluid{
		padding: 0;
	}
	.card-header:first-child{
		padding: 0;
	}
	
	#calendar{
		overflow: auto;
		height:800px;
		display:flex;
		clear: both;
	}
	
	.fc-scrollgrid-sync-table{
		width:910px !important;
	}
	.fc-col-header{
	width:910px !important;
	}
	.fc .fc-scrollgrid-liquid
	{
	width:910px;
	
	}
	.fc-dayGridWeek-view{
		width:910px !important;
		overflow:scoll;
	}
	
	.fc .fc-button-group > .fc-button {
    position: relative;
    flex: 1 1 auto;
    background-color: #858796;
    }
}

@media(max-width:800px){
.container-fluid{
	padding: 0;
}
.card-header:first-child{
	padding: 0;
}

#calendar{
	overflow: auto;
	height:800px;
	display:flex;
	clear: both;
}

.fc-dayGridWeek-view{
	width:1000px;
	overflow:scoll;
}

.fc .fc-button-group > .fc-button {
    position: relative;
    flex: 1 1 auto;
    background-color: #858796;
    }
}

#fc-day-mon #fc-event-main-frame #fc-event-title #fc-sticky{
	top:400px;
}






</style>

</head>

<body id="page-top">
  <!-- Page Wrapper -->
  <div id="wrapper">

    <!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion toggled" id="accordionSidebar">

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
	      	<a class="nav-link" onclick="fnMove()" href="../manager_schedule/manager_schedule.jsp">
	        
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
     <div class="card-body"style="float: right;">
      		<a href="JavaScript:window.location.reload()" class="btn btn-primary" >+</a>
      	</div>
      	
		<div id='calendar'></div>
		<form id = "Dayform" name ="Dayform" method="post" action="manager_schedule_add.jsp">
			<input id="date" type="hidden" name = "date" value="" />
		</form>
		
		
		<form method="post" id="jsvarform" name ="jsvarform" action="manager_schedule_update.jsp">
			<input id="number" type="hidden" name = "num" value="" />
			<input id="setDate" type="hidden" name = "date" value="" />
			<input id="setAm" type="hidden" name = "amPlace" value="" />
			<input id="setPm" type="hidden" name = "pmPlace" value="" />
		</form>
		
 		
      </div>
     </div>
      <!-- End of Main Content -->
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
