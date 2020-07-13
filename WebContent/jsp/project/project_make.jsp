<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Sure FVMS - Project</title>

  <!-- Custom fonts for this template-->
  <link href="../../vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="../../https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="../../css/sb-admin-2.min.css" rel="stylesheet">

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

    

      <!-- Heading -->
    

    
	<!-- Divider -->
			<hr class="sidebar-divider my-0">

			<!-- Nav Item - summary -->
		    <li class="nav-item">
	          <a class="nav-link" href="../summary/summary.jsp">
	          <i class="fas fa-fw fa-table"></i>
	          <span>요약정보</span></a>
	     	</li>
      
       		<!-- Nav Item - project -->
      		<li class="nav-item active">
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
                <span class="mr-2 d-none d-lg-inline text-gray-600 small">홍길동</span>
                <img class="img-profile rounded-circle" src="https://source.unsplash.com/QAB-WJcbgJk/60x60">
              </a>
              <!-- Dropdown - User Information -->
              <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                <a class="dropdown-item" href="#">
                  <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                  Profile
                </a>
                <a class="dropdown-item" href="#">
                  <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                  Settings
                </a>
                <a class="dropdown-item" href="#">
                  <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                  Activity Log
                </a>
                <div class="dropdown-divider"></div>
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

<!--프로젝트 생성 테이블 시작 *********************************************************** -->
          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">프로젝트 생성</h6>
            </div>
            <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>팀</th>
                      <th>프로젝트 코드</th>
                      <th>프로젝트 명</th>
                      <th>상태</th>
                      <th>실</th>
                      <th>고객사</th>
                      <th>고객부서</th>
                      <th>M/N</th>
						<th>프로젝트계약금액</th> 
						<th>상반기수주</th>  
						<th>상반기예상매출</th> 
						<th>상반기매출 </th>
						<th>하반기수주 </th>
						<th>하반기예상매출 </th>
						<th>하반기매출 </th>
						<th>착수</th> 
						<th>종료</th> 
						<th>고객담당자</th> 
						<th>근무지</th> 
						<th>업무</th> 
						<th>PM</th> 
						<th>투입 명단</th> 
						<th>2020(상)평가유형</th> 
						<th>채용수요</th> 
						<th>외주수요</th>  
                    </tr>
                  </thead>    
                  <tbody>
                  	<tr>
                  		<th>
                      	<select id="team" name="team">
                      		<option value="바디힐스">팀</option>
                      		<option value="기능안전">기능안전</option>
                      		<option value="자율주행">자율주행</option>
                      		<option value="제어로직">제어로직</option>
                      		<option value="샤시힐스">샤시힐스</option>
                      	</select>
                      	</th>

                      	<th>
                      	<select id="PROJECT_CODE" name="PROJECT_CODE">
                      		<option value="1">프로젝트 코드</option>
                      		<option value="2">2</option>
                      		<option value="3">3</option>
                      		<option value="4">4</option>
                      		<option value="5">5</option>
                      	</select>
                      	</th>
                      	
                      	<th>
                      	<select id="PROJECT_NAME" name="PROJECT_NAME">
                      		<option value="프로젝트 명">프로젝트 명</option>
                      		<option value="기능안전">기능안전</option>
                      		<option value="자율주행">자율주행</option>
                      		<option value="제어로직">제어로직</option>
                      		<option value="샤시힐스">샤시힐스</option>
                      	</select>
                      	</th>
                      	
                      	<th>
                      	<select id="STATE" name="STATE">
                      		<option value="상태">상태</option>
                      		<option value="예산확보">1.예산확보</option>
                      		<option value="고객의사">2.고객의사</option>
                      		<option value="제안단계">3.제안단계</option>
                      		<option value="업체선정">4.업체선정</option>
                      		<option value="진행예정">5.진행예정</option>
                      		<option value="진행중">6.진행중</option>
                      		<option value="종료">7.종료</option>
                      		<option value="Dropped">8.Dropped</option>
                      	</select>
                      	</th>
                      	
                      	<th>
                      	<select id="PART" name="PART">
                      		<option value="실">실</option>
                      		<option value="VT">VT</option>	
                      	</select>
                      	</th>
                      	
                      	<th>
                      	<select id="CLIENT" name="CLIENT">
                      		<option value="고객사">고객사</option>
                      		<option value="VT">VT</option>	
                      	</select>
                      	</th>
                      	
                      	<th>
                      	<select id="CLINET_PART" name="CLINET_PART">
                      		<option value="고객부서">고객부서</option>
                      		<option value="VT">VT</option>	
                      	</select>
                      	</th>
                      	
                      	<th>
                      	<select id="PART" name="PART">
                      		<option value="실">실</option>
                      		<option value="VT">VT</option>	
                      	</select>
                      	</th>
                      	
                      	<th>
                      	<select id="PART" name="PART">
                      		<option value="실">실</option>
                      		<option value="VT">VT</option>	
                      	</select>
                      	</th>
                      	
                      	
                  	</tr>
                  
                  </tbody> 
                </table>       
              </div>
              		 팀 TAEM
					프로젝트 코드 PROJECT_CODE
					프로젝트 명 PROJECT_NAME
					상태 STATE
					실 PART
					고객사 CLIENT
					고객부서 CLINET_PART
					M/N MODEL_NUMBER
					프로젝트계약금액 PROJECT_DESOPIT
					상반기수주 FH_ORDER 
					상반기예상매출 FH_SALES_PROJECTIONS
					상반기매출 FH_SALES
					하반기수주 SH_ORDER
					하반기예상매출 SH_SALES_PROJECTIONS
					하반기매출 SH_SALES
					착수 PROJECT_START
					종료 PROJECT_END
					고객담당자 CLIENT_PTB
					근무지 WORK_PLACE
					업무 WORK
					PM PROJECT_MANAGER
					투입 명단 WORKER_LIST
					2020(상)평가유형 ASSESSMENT_TYPE
					채용수요 EMPLOY_DEMAND
					외주수요 OUTSOURCE_DEMAND
            </div>
              <div class="card-body" style="margin: 0 auto;">
                	<input id="COMPLETE" type="submit" name="COMPLETE" value="완료"  class="btn btn-primary">
       				<input id="CANCEL" type="reset" name="CANCEL" value="취소"  class="btn btn-primary">
              </div>
          </div>
        </div>
        <!-- /.container-fluid -->
<!--프로젝트 조회 테이블 끝        *********************************************************** -->

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
