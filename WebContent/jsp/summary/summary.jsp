<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "java.io.PrintWriter"
    import = "jsp.sheet.method.*"
    import = "jsp.Bean.model.*"
    
    %>
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

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
 content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Sure FVMS - Summary</title>

<!-- Custom fonts for this template-->
<link href="../../vendor/fontawesome-free/css/all.min.css" rel="stylesheet"type="text/css">
<link href="../../https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

<!-- Custom styles for this template-->
<link href="../../css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body id="page-top">

 <!-- Page Wrapper -->
 <div id="wrapper">

  <!-- Sidebar -->
  <ul
   class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
   id="accordionSidebar">

   <!-- Sidebar - Brand -->
   <a
    class="sidebar-brand d-flex align-items-center justify-content-center"
    href="summary.jsp">
    <div class="sidebar-brand-icon rotate-n-15">
     <i class="fas fa-laugh-wink"></i>
    </div>
    <div class="sidebar-brand-text mx-3">Sure FVMS</div>
   </a>

   <!-- Divider -->
   <hr class="sidebar-divider my-0">

   <!-- Nav Item - summary -->
      <li class="nav-item active">
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
       <li class="nav-item">
         <a class="nav-link" href="../schedule/schedule.jsp">
         <i class="fas fa-fw fa-calendar"></i>
         <span>스케줄</span></a>
       </li>
       
        <!-- Nav Item - manager schedule -->
	      <li class="nav-item">
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
    <nav
     class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

     <!-- Sidebar Toggle (Topbar) -->
     <button id="sidebarToggleTop"
      class="btn btn-link d-md-none rounded-circle mr-3">
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

  
    <div class="container-fluid">
     
      <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
         <h6 class="m-0 font-weight-bold text-primary">프로젝트 현황</h6>
        </div>
            <div class="card-body"> 
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" style="white-space: nowrap;">
                  <thead>
                   <tr>
                    	<td colspan="3" style="border:0px;"></td>
                    	<td colspan="5" bgcolor="skyblue" style="text-align:center;">상세내역</td>
                    </tr>  
                    <tr bgcolor="skyblue" style="text-align:center;">
	                    <th>구분</th>
	                    <th>상태</th>
	                    <th>Total</th>
	                    <th>샤시힐스</th>
	                    <th>바디힐스</th>
	                    <th>제어로직</th>
	                    <th>기능안전</th>
	                    <th>자율주행</th>
                    </tr>
                  </thead>  
                  
                  <tbody>
                    <tr>
                    	<td rowspan="3" style="text-align:center;">불확실</td>
                    	<td style="text-align:center;">1. 예산확보</td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    </tr>
                    <tr style="text-align:center;">
                    	<td>2. 고객의사</td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    </tr>
                     <tr style="text-align:center;">
                    	<td>3. 제안단계</td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    </tr>
                     <tr style="text-align:center;">
                    	<td rowspan="2">유력</td>
                    	<td>4. 업체선정</td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    </tr>
                     <tr style="text-align:center;">
                    	<td>5. 진행예정</td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    </tr>
                    <tr style="text-align:center;">
                    	<td>진행</td>
                    	<td>6. 진행중</td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    </tr>
                    <tr style="text-align:center;">
                    	<td rowspan="2">종료</td>
                    	<td>7. 종료</td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    </tr>
                    <tr style="text-align:center;">
                    	<td>8. Dropped</td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    </tr>
                    <tr>
                    	<td colspan="2" style="border:0px; bgcolor:#fff;"></td>
                    	<td bgcolor="yellow"></td>
                    	<td bgcolor="yellow"></td>
                    	<td bgcolor="yellow"></td>
                    	<td bgcolor="yellow"></td>
                    	<td bgcolor="yellow"></td>
                    	<td bgcolor="yellow"></td>
                    </tr>  
                    </tbody>                           
                </table>
              </div>   
              </div>     
         </div>
     
      <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
         <h6 class="m-0 font-weight-bold text-primary">수주 & 매출</h6>
        </div>
            <div class="card-body"> 
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" style="white-space: nowrap;">
                  <thead>
                   <tr>
                    	<td colspan="3" style="border:0px;"></td>
                    	<td colspan="5" bgcolor="skyblue" style="text-align:center;">상세내역(단위: 백만)</td>
                    </tr>  
                    <tr bgcolor="skyblue" style="text-align:center;">
	                    <th>구분</th>
	                    <th>항목</th>
	                    <th>Total</th>
	                    <th>샤시힐스</th>
	                    <th>바디힐스</th>
	                    <th>제어로직</th>
	                    <th>기능안전</th>
	                    <th>자율주행</th>
                    </tr>
                  </thead>  
                  
                  <tbody>
                    <tr>
                    	<td rowspan="10" style="text-align:center;">상반기</td>
                    	<td style="text-align:center;">목표 수주</td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    </tr>
                    <tr style="text-align:center;">
                    	<td>예상 수주</td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    </tr>
                     <tr style="text-align:center;">
                    	<td>예상 수주%</td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    </tr>
                     <tr style="text-align:center;">
                    	<td>수주</td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    </tr>
                     <tr style="text-align:center;">
                    	<td>수주 달성률</td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    </tr>
                     <tr style="text-align:center;">
                    	<td>목표 매출</td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    </tr>
                     <tr style="text-align:center;">
                    	<td>예상 매츨</td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    </tr>
                     <tr style="text-align:center;">
                    	<td>예상 매출%</td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    </tr>
                     <tr style="text-align:center;">
                    	<td>현재 매출</td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    </tr>
                     <tr style="text-align:center;">
                    	<td>매출 달성률</td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    </tr>
                     <tr style="text-align:center;">
                    	<td rowspan="6">하반기</td>
                    	<td>목표수주</td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    </tr>
                     <tr style="text-align:center;">
                    	<td>수주</td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    </tr>
                     <tr style="text-align:center;">
                    	<td>예상 매출</td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    </tr>
                     <tr style="text-align:center;">
                    	<td>현재 매출</td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    </tr>
                     <tr style="text-align:center;">
                    	<td>잔여 매출</td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    </tr>
                     <tr style="text-align:center;">
                    	<td>달성률</td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    </tr>
                    <tr style="text-align:center;">
                    	<td rowspan="7">연간</td>
                    	<td>목표수주</td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    </tr>
                     <tr style="text-align:center;">
                    	<td>수주</td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    </tr>
                    <tr style="text-align:center;">
                    	<td>수주 달성률</td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    </tr>
                     <tr style="text-align:center;">
                    	<td>예상 매출</td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    </tr>
                     <tr style="text-align:center;">
                    	<td>현재 매출</td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    </tr>
                     <tr style="text-align:center;">
                    	<td>잔여 매출</td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    </tr>
                     <tr style="text-align:center;">
                    	<td>매출 달성률</td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    </tr>
                    </tbody>                           
                </table>
              </div>   
              </div>     
         </div>

     <!-- Content Row -->
     <div class="row">

      <div class="col-xl-8 col-lg-7">

       <!-- Area Chart -->
       <div class="card shadow mb-4">
        <div class="card-header py-3">
         <h6 class="m-0 font-weight-bold text-primary">Area Chart</h6>
        </div>
        <div class="card-body">
         <div class="chart-area">
          <canvas id="myAreaChart"></canvas>
         </div>
         <hr>
         Styling for the area chart can be found in the
         <code>/js/demo/chart-area-demo.js</code>
         file.
        </div>
       </div>

       <!-- Bar Chart -->
       <div class="card shadow mb-4">
        <div class="card-header py-3">
         <h6 class="m-0 font-weight-bold text-primary">Bar Chart</h6>
        </div>
        <div class="card-body">
         <div class="chart-bar">
          <canvas id="myBarChart"></canvas>
         </div>
         <hr>
         Styling for the bar chart can be found in the
         <code>/js/demo/chart-bar-demo.js</code>
         file.
        </div>
       </div>

      </div>

      <!-- Donut Chart -->
      <div class="col-xl-4 col-lg-5">
       <div class="card shadow mb-4">
        <!-- Card Header - Dropdown -->
        <div class="card-header py-3">
         <h6 class="m-0 font-weight-bold text-primary">Donut Chart</h6>
        </div>
        <!-- Card Body -->
        <div class="card-body">
         <div class="chart-pie pt-4">
          <canvas id="myPieChart"></canvas>
         </div>
         <hr>
         Styling for the donut chart can be found in the
         <code>/js/demo/chart-pie-demo.js</code>
         file.
        </div>
       </div>
      </div>
     </div>

    </div>
    <!-- /.container-fluid -->

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
  <!-- End of Content Wrapper -->

 </div>
 <!-- End of Page Wrapper -->

 <!-- Scroll to Top Button-->
 <a class="scroll-to-top rounded" href="#page-top"> <i
  class="fas fa-angle-up"></i>
 </a>

 <!-- Logout Modal-->
 <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
  aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
   <div class="modal-content">
    <div class="modal-header">
     <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
     <button class="close" type="button" data-dismiss="modal"
      aria-label="Close">
      <span aria-hidden="true">×</span>
     </button>
    </div>
    <div class="modal-body">Select "Logout" below if you are ready
     to end your current session.</div>
    <div class="modal-footer">
     <button class="btn btn-secondary" type="button"
      data-dismiss="modal">Cancel</button>
     <a class="btn btn-primary" href="../html/login.html">Logout</a>
    </div>
   </div>
  </div>
 </div>

	<!-- Logout Modal-->
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">Select "Logout" below if you are ready
					to end your current session.</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">Cancel</button>
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