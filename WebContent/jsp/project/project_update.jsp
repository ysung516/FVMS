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

  <title>Sure FVMS - Project_Update</title>

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
              <h6 class="m-0 font-weight-bold text-primary">프로젝트 수정</h6>
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
                      <th>M/M</th>
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
                      		<option value="A">A</option>
                      		<option value="B">B</option>
                      		<option value="C">C</option>
                      		<option value="D">D</option>
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
                      		<option value="SMR">SMR</option>	
                      		<option value="오트론">오트론</option>	
                      		<option value="현대자동차">현대자동차</option>	
                      	</select>
                      	</th>
                      	
                      	<th>
                      	<select id="CLINET_PART" name="CLINET_PART">
                      		<option value="고객부서">고객부서</option>
                      		<option value="변속제어개발팀">변속제어팀</option>
                      		<option value="엔진제어개발팀">엔진제어개발팀</option>	
                      	</select>
                      	</th>
                      	
                      	<th>
                      	<select id="MAN_MONTH" name="MAN_MONTH">
                      		<option value="M/M">M/M</option>
                      		<option value="6">6</option>
                      		<option value="20">20</option>		
                      	</select>
                      	</th>
                      	
                      	<th>
                      	<select id="PROJECT_DESOPIT" name="PROJECT_DESOPIT">
                      		<option value="프로젝트계약금액">프로젝트계약금액</option>
                      		<option value="242">242</option>	
                      	</select>
                      	</th>
                      	
                      	<th>
                      	<select id="FH_ORDER " name="FH_ORDER ">
                      		<option value="상반기수주">상반기수주</option>	
                      	</select>
                      	</th>
                      	
                      	<th>
                      	<select id="FH_SALES_PROJECTIONS" name="FH_SALES_PROJECTIONS">
                      		<option value="상반기예상매출">상반기예상매출</option>
                      	</select>
                      	</th>
                      	
                      	<th>
                      	<select id="FH_SALES" name="FH_SALES">
                      		<option value="상반기매출">상반기매출</option>
                      	</select>
                      	</th>
                      	
                      	<th>
                      	<select id="SH_ORDER" name="SH_ORDER">
                      		<option value="하반기수주">하반기수주</option>
                      	</select>
                      	</th>
                      	
                      	<th>
                      	<select id="SH_SALES_PROJECTIONS" name="SH_SALES_PROJECTIONS">
                      		<option value="하반기예상매출">하반기예상매출</option>
                      	</th>
                      	
                      	<th>
                      	<select id="SH_SALES" name="SH_SALES">
                      		<option value="하반기매출">하반기매출</option>
                      	</select>
                      	</th>
                      	
                      	<th>
                      	<select id="PROJECT_START" name="PROJECT_START">
                      		<option value="착수">착수</option>
                      		<option value="2020-07-">2020-07-</option>
                      		<option value="2020-11-">2020-11-</option>	
                      	</select>
                      	</th>
                      	
                      	<th>
                      	<select id="PROJECT_END" name="PROJECT_END">
                      		<option value="종료">종료</option>
                      		<option value="2021-04-">2021-04-</option>	
                      	</select>
                      	</th>
                      	
                      	<th>
                      	<select id="CLIENT_PTB" name="CLIENT_PTB">
                      		<option value="착수">고객담당자</option>
                      		<option value="김">김</option>
                      		<option value="이">이</option>	
                      		<option value="박">박</option>		
                      	</select>
                      	</th>
                      	
                      	<th>
                      	<select id="WORK_PLACE" name="WORK_PLACE">
                      		<option value="근무지">근무지</option>
                      		<option value="본사">본사</option>	
                      		<option value="삼성">삼성</option>
                      	</select>
                      	</th>
                      	
                      	<th>
                      	<select id="WORK" name="WORK">
                      		<option value="업무">업무</option>
                      		<option value="A검증">A검증</option>
                      		<option value="B검증">B검증</option>
                      		<option value="C검증">C검증</option>
                      		<option value="D검증">D검증</option>	
                      	</select>
                      	</th>
                      	
                      	<th>
                      	<select id="PROJECT_MANAGER" name="PROJECT_MANAGER">
                      		<option value="PM">PM</option>
                      		<option value="김김김">김김김</option>
                      		<option value="최최최">최최최</option>
                      		<option value="박박박">박박박</option>	
                      	</select>
                      	</th>
                      	
                      	<th>
                      	<select id="WORKER_LIST" name="WORKER_LIST">
                      		<option value="투입명단">투입명단</option>
                      	</select>
                      	</th>
                      	
                      	<th>
                      	<select id="ASSESSMENT_TYPE" name="ASSESSMENT_TYPE">
                      		<option value="2020(상)평가유형">2020(상)평가유형</option>
                      	</select>
                      	</th>
                      	
                      	<th>
                      	<select id="EMPLOY_DEMAND" name="EMPLOY_DEMAND">
                      		<option value="채용수요">채용수요</option>
                      	</select>
                      	</th>
                      	
                      	<th>
                      	<select id="OUTSOURCE_DEMAND" name="OUTSOURCE_DEMAND">
                      		<option value="외주수요">외주수요</option>
                      	</th>
                  	</tr>                 
                  </tbody> 
                </table>       
              </div>     		
            </div>
              <div class="card-body" style="margin: 0 auto;">
                	<input id="COMPLETE" type="submit" name="COMPLETE" value="완료"  class="btn btn-primary">
       				 <a href="project.jsp" class="btn btn-primary">취소</a>
              </div>
          </div>
        </div>
        **셀 추가 셀 삭제 기능(+,-), 줄 선택 기능(옆에 체크박스, 번호 설정)**
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
