<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "java.io.PrintWriter"
    import = "jsp.sheet.method.*"
    %>
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
		session.setMaxInactiveInterval(15*60);
		String date = request.getParameter("date");
		System.out.println(date);
		
		
	
%>

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
	
</head>
<style>
	.loading{
		position:fixed;
		text-align: center;
		width:100%;
		height:100%;
		top:0;
		left:0;
		font-size:12px;
		background-color: #4e73df6b;
  	  	background-image: linear-gradient(181deg,#3d5482 16%,#6023b654 106%);
  	  	background-size: cover;
        z-index:1000;
        color:#ffffffc4;
	}
	.loading #load{
		position:fixed;
		top:50%;
		left: 50%;
		transform:translate(-50%, -50%);
	}
	@media(max-width:800px){
		.container-fluid{
			padding: 0;
		}
		.card-header:first-child{
			padding: 0;
		}
}
</style>
<script src="https://code.jquery.com/jquery-2.2.4.js"></script>
<script type="text/javascript">
<!-- 로딩화면 -->
	window.onbeforeunload = function () { $('.loading').show(); }  //현재 페이지에서 다른 페이지로 넘어갈 때 표시해주는 기능
	$(window).load(function () {          //페이지가 로드 되면 로딩 화면을 없애주는 것
	    $('.loading').hide();
	});
</script>
<body id="page-top">

  <!-- Page Wrapper -->
  <div id="wrapper">
  	 <!--  로딩화면  시작  -->
				  <div class="loading">
				  <div id="load">
				<i class="fas fa-spinner fa-10x fa-spin"></i>
				  </div>
				  </div>
			<!--  로딩화면  끝  -->

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
                  <h6 class="m-0 font-weight-bold text-primary" style="padding-left: 17px;">일정추가</h6>
                </div>
                <div class="card-body">
  		<div class="table-responsive"> 
  
	<form method = "post" action = "MSC_AddPro.jsp">
   		<table style="white-space: nowrap; overflow:hidden;width:100%;">
     <tr>
      <td class="m-0 text-primary" align="center">날짜 </td>
      <td style="padding: 15px 0;"><input type="date" id="nowDate" name="DATE" value = <%=date%> style=width:100%; maxlength="50"></td>
     </tr>
     <tr height="1" bgcolor="#fff"><td colspan="2"></td></tr>
      <tr height="1" bgcolor="#82B5DF"><td colspan="2"></td></tr>
     <tr>
      <td class="m-0 text-primary" align="center" style="white-space: nowrap;">오전장소 </td>
      <td style="padding-left: 10px;padding-top: 15px;padding-bottom: 15px;">
      	<input type="radio" name="AMradio" value="슈어소프트(본사,삼성)"><label>슈어소프트(본사,삼성)</label></br>
    	<input type="radio" name="AMradio" value="슈어소프트(남양사무실)"><label>슈어소프트(남양사무실)</label></br>
    	<input type="radio" name="AMradio" value="HMC(남양연구소)"><label>HMC(남양연구소)</label></br>
    	<input type="radio" name="AMradio" value="오트론(삼성)"><label>오트론(삼성)</label></br>
    	<input type="radio" name="AMradio" value="모비스(의왕)"><label>모비스(의왕)</label></br>
    	<input type="radio" name="AMradio" value="모비스(마북)"><label>모비스(마북)</label></br>
    	<input type="radio" name="AMradio" value="엠엔소프트(용산)"><label>엠엔소프트(용산)</label></br>
    	<input type="radio" name="AMradio" value="트랜시스(남양)"><label>트랜시스(남양)</label></br>
    	<input type="radio" name="AMradio" value="기타"><label>기타</label><input type="text" name="AMother" placeholder="Write In">
      </td>
     </tr>
      <tr height="1" bgcolor="#fff"><td colspan="2"></td></tr>
       <tr height="1" bgcolor="#82B5DF"><td colspan="2"></td></tr>
     <tr>
      <td class="m-0 text-primary" align="center" style="white-space: nowrap;">오후장소</td>
		<td style="padding-left: 10px;padding-top: 15px;padding-bottom: 15px;">
	      	<input type="radio" name="PMradio" value="슈어소프트(본사,삼성)"><label>슈어소프트(본사,삼성)</label></br>
    	<input type="radio" name="PMradio" value="슈어소프트(남양사무실)"><label>슈어소프트(남양사무실)</label></br>
    	<input type="radio" name="PMradio" value="HMC(남양연구소)"><label>HMC(남양연구소)</label></br>
    	<input type="radio" name="PMradio" value="오트론(삼성)"><label>오트론(삼성)</label></br>
    	<input type="radio" name="PMradio" value="모비스(의왕)"><label>모비스(의왕)</label></br>
    	<input type="radio" name="PMradio" value="모비스(마북)"><label>모비스(마북)</label></br>
    	<input type="radio" name="PMradio" value="엠엔소프트(용산)"><label>엠엔소프트(용산)</label></br>
    	<input type="radio" name="PMradio" value="트랜시스(남양)"><label>트랜시스(남양)</label></br>
    	<input type="radio" name="PMradio" value="기타"><label>기타</label><input type="text" name="PMother" placeholder="Write In">
      </td>
     </tr>
     <tr height="1" bgcolor="#fff"><td colspan="2"></td></tr>
     </table>
     <div class="card-body" style="margin: 0 auto; display:table;" >
   <input id="COMPLETE" type="submit" name="COMPLETE" value="등록"  class="btn btn-primary" style="margin-right: 5px;">
       <a href="manager_schedule.jsp" class="btn btn-primary">취소</a>
       </div>
</form>
 	    </div>
 	    </div>

    <!-- /.container-fluid -->

      </div>
      <!-- End of Main Content -->


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
    <div class="modal-body">Select "Logout" below if you are ready  to end your current session.</div>
    <div class="modal-footer">
     <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
    <form method = "post" action = "../LogoutPro.jsp">
     	  <input type="submit" class="btn btn-primary" value="Logout" />
     </form>
   
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
