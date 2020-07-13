package jsp.sheet.method;

import java.io.File;
import java.io.IOException;
import java.net.URL;
import java.security.GeneralSecurityException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import com.google.api.client.auth.oauth2.Credential;
import com.google.api.client.googleapis.auth.oauth2.GoogleCredential;
import com.google.api.client.http.HttpTransport;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.JsonFactory;
import com.google.api.client.json.jackson2.JacksonFactory;
import com.google.gdata.client.spreadsheet.SpreadsheetService;
import com.google.gdata.data.spreadsheet.CellEntry;
import com.google.gdata.data.spreadsheet.CellFeed;
import com.google.gdata.data.spreadsheet.ListEntry;
import com.google.gdata.data.spreadsheet.ListFeed;
import com.google.gdata.data.spreadsheet.SpreadsheetEntry;
import com.google.gdata.data.spreadsheet.SpreadsheetFeed;
import com.google.gdata.data.spreadsheet.WorksheetEntry;
import com.google.gdata.util.ServiceException;

import jsp.Bean.model.BoardBean;
import jsp.Bean.model.MemberBean;

public class sheetMethod {
	sheetBean sheet = new sheetBean();
	MemberBean member = new MemberBean();
	
	
	public MemberBean getMember() {
		return member;
	}

	// 싱글톤 패턴
	public sheetMethod() {
	
	}

	// 연결
	public void connect() throws GeneralSecurityException, IOException, ServiceException {
		SpreadsheetService service;
		ClassLoader classloader = Thread.currentThread().getContextClassLoader();
		URL url = classloader.getResource("service.p12");
		final File file = new File(url.getFile());

		HttpTransport HTTP_TRANSPORT = new NetHttpTransport();
		JsonFactory JSON_FACTORY = new JacksonFactory();

		Credential credential = new GoogleCredential.Builder().setTransport(HTTP_TRANSPORT).setJsonFactory(JSON_FACTORY)
				.setServiceAccountId("ymyou-1@e-tensor-282602.iam.gserviceaccount.com") // 서비스 계정 생성 당시의 정보
				.setTokenServerEncodedUrl("https://accounts.google.com/o/oauth2/token")
				.setServiceAccountScopes(Arrays.asList("https://www.googleapis.com/auth/drive",
						"https://spreadsheets.google.com/feeds", "https://docs.google.com/feeds"))
				.setServiceAccountPrivateKeyFromP12File(file).build();

		// 버전이 v1부터 v3까지 있었는데 사실 그 차이에대해선 아직 알아보지못했다
		service = new SpreadsheetService("MySpreadsheetIntegration-v1");
		service.setOAuth2Credentials(credential); // 이거 하려고 위에 저렇게 코딩 한거다. 이게 인증의 핵심
		sheet.setService(service);
	}

	// 시트 불러오기
	public void access() throws GeneralSecurityException, IOException, ServiceException {
		SpreadsheetService service = sheet.getService();
		List<SpreadsheetEntry> spreadsheets;
		SpreadsheetFeed feed = service.getFeed(
				new URL("https://spreadsheets.google.com/feeds/spreadsheets/private/full"), SpreadsheetFeed.class);
		spreadsheets = feed.getEntries();

		sheet.setSpreadsheets(spreadsheets);
		sheet.setFeed(feed);

		for (int i = 0; i < sheet.getSpreadsheets().size(); i++) {
			SpreadsheetEntry entry = sheet.getSpreadsheets().get(i);	// 접근가능 모든파일중 filename찾기
			if (entry.getTitle().getPlainText().equals(sheet.getFileName())) {	//filename 일치 확인
				sheet.setEntry(entry);	// suresoft-pms파일 저장
				break;
			}
		}
		List<WorksheetEntry> worksheets = sheet.getEntry().getWorksheets(); // 시트 타이틀
		sheet.setWorksheets(worksheets);	// 시트타이틀 저장
	}

	// WorkSheet 찾기
	public void findSheet(String sheetName) {
		for (int k = 0; k < sheet.getWorksheets().size(); k++) {
    		WorksheetEntry worksheet = sheet.getWorksheets().get(k);
    		if (worksheet.getTitle().getPlainText().equals(sheetName)) {
    			sheet.setWorksheet(worksheet);
    			break;
    		}
    	}
	}

	// 로그인 체크
	public int loginCheck(String id, String pw) throws GeneralSecurityException, IOException, ServiceException
    {
		
		int check = 0;
		connect();
		access();
    	findSheet("#인력");
    	
    	URL listFeedUrl = sheet.getWorksheet().getListFeedUrl();
    	ListFeed listFeed = sheet.getService().getFeed(listFeedUrl, ListFeed.class);
    	List<ListEntry> list = listFeed.getEntries();	// 모든 행 가져오기
  
    	for(int a = 0; a < list.size(); a++)	{
    		ListEntry li = list.get(a);	// 첫 번째 행 데이터 부터 가져옴
    		
    		if(li.getCustomElements().getValue("id").equals(id)) {
    			if(li.getCustomElements().getValue("pw").equals(pw)) {
    				check = 1;
    				break;
    			} else
    				check = 0;
    				break;
    			
    		} else 
    			check = 0;
    	}
    	return check;
    }
	
	
	// 세션 ID를 받아 회원정보 bean 클래스에 저장
	public void saveUser_info(String id)throws GeneralSecurityException, IOException, ServiceException {
		connect();
		access();
    	findSheet("#인력");
    	URL listFeedUrl = sheet.getWorksheet().getListFeedUrl();
    	ListFeed listFeed = sheet.getService().getFeed(listFeedUrl, ListFeed.class);
    	List<ListEntry> list = listFeed.getEntries();	// 모든 행 가져오기
    	//List userInfo = new ArrayList()
    	for(int a = 0; a < list.size(); a++) {
    		ListEntry li = list.get(a);
    		
    		if(li.getCustomElements().getValue("id").equals(id)) {
    			System.out.println("34");
    			member.setID(id);
    			member.setNAME(li.getCustomElements().getValue("이름"));
    			member.setNO(li.getCustomElements().getValue("no"));
    			member.setPART(li.getCustomElements().getValue("소속"));
    			member.setTEAM(li.getCustomElements().getValue("팀"));
    			member.setGMAIL(li.getCustomElements().getValue("gmail"));
    			member.setRANK(li.getCustomElements().getValue("직급"));
    			member.setMOBILE(li.getCustomElements().getValue("mobile"));
    			member.setADDRESS(li.getCustomElements().getValue("주소"));
    			//member.setNOTE(li.getCustomElements().getValue("이름"));
    			//member.setPASSWORD(li.getCustomElements().getValue(""));
    			
    			break;
    			
    		}
    	}
		
    }
	
	// 보고서 작성
	public int saveReport (String title, String writeDate,
			 String weekPlan, String weekPro, String nextPlan, String user_id, 
			 String name, String rank, String team) throws GeneralSecurityException, IOException, ServiceException {
		connect();
		access();
    	findSheet("주간보고서");
    	
        // 주간보고서
         URL listFeedUrl = sheet.getWorksheet().getListFeedUrl();
         ListFeed listFeed = sheet.getService().getFeed(listFeedUrl, ListFeed.class);
         List<ListEntry> list = listFeed.getEntries(); //전체 데이터 리스트로 저장
         ListEntry li = new ListEntry(); //새로운 데이터 저장할  리스트

         if (title != null && writeDate != null) {
        	//방법2
             li.getCustomElements().setValueLocal("no", Integer.toString(list.size() + 1));
             li.getCustomElements().setValueLocal("제목", title);
             li.getCustomElements().setValueLocal("작성일", writeDate);
             li.getCustomElements().setValueLocal("금주계획", weekPlan);
             li.getCustomElements().setValueLocal("금주진행", weekPro);
             li.getCustomElements().setValueLocal("차주계획", nextPlan);
             li.getCustomElements().setValueLocal("id", user_id);
             li.getCustomElements().setValueLocal("이름", name);
             li.getCustomElements().setValueLocal("직급", rank);
             li.getCustomElements().setValueLocal("팀", team);
             listFeed.insert(li);
             
             return 1;

         } else return 0;
	}
	
	// 주간보고서 리스트 목록 가져오기
	public ArrayList<BoardBean> getBoardList()throws GeneralSecurityException, IOException, ServiceException{
		
		ArrayList<BoardBean> boardList = new ArrayList<BoardBean>();
		connect();
		access();
    	findSheet("주간보고서");
    	
        // 주간보고서
        URL listFeedUrl = sheet.getWorksheet().getListFeedUrl();
        ListFeed listFeed = sheet.getService().getFeed(listFeedUrl, ListFeed.class);
        List<ListEntry> list = listFeed.getEntries(); //전체 데이터 리스트로 저장
        
        
        for(int i=0; i < list.size(); i++) {
        	ListEntry li = list.get(i);
        	BoardBean board = new BoardBean();
        	board.setNo(li.getCustomElements().getValue("no"));
        	board.setId(li.getCustomElements().getValue("id"));
        	board.setName(li.getCustomElements().getValue("이름"));
        	board.setRank(li.getCustomElements().getValue("직급"));
        	board.setTeam(li.getCustomElements().getValue("팀"));
        	board.setTitle(li.getCustomElements().getValue("제목"));
        	board.setDate(li.getCustomElements().getValue("작성일"));
        	board.setWeekPlan(li.getCustomElements().getValue("금주계획"));
        	board.setWeekPro(li.getCustomElements().getValue("금주진행"));
        	board.setNextPlan(li.getCustomElements().getValue("차주계획"));
        	boardList.add(board);
        }
        
		
		return boardList;
		
	}
	
	// 넘버별 주간보고서 데이터 가져오기
	public BoardBean getBoard(String NO)throws GeneralSecurityException, IOException, ServiceException{
		connect();
		access();
		findSheet("주간보고서");
		// 주간보고서
        URL listFeedUrl = sheet.getWorksheet().getListFeedUrl();
        ListFeed listFeed = sheet.getService().getFeed(listFeedUrl, ListFeed.class);
        List<ListEntry> list = listFeed.getEntries(); //전체 데이터 리스트로 저장
        BoardBean board = new BoardBean();
		for(int i = 0; i < list.size(); i++) {
			ListEntry li = list.get(i);
			if(li.getCustomElements().getValue("no").equals(NO)) {
				
	        	board.setNo(li.getCustomElements().getValue("no"));
	        	board.setId(li.getCustomElements().getValue("id"));
	        	board.setName(li.getCustomElements().getValue("이름"));
	        	board.setRank(li.getCustomElements().getValue("직급"));
	        	board.setTeam(li.getCustomElements().getValue("팀"));
	        	board.setTitle(li.getCustomElements().getValue("제목"));
	        	board.setDate(li.getCustomElements().getValue("작성일"));
	        	board.setWeekPlan(li.getCustomElements().getValue("금주계획"));
	        	board.setWeekPro(li.getCustomElements().getValue("금주진행"));
	        	board.setNextPlan(li.getCustomElements().getValue("차주계획"));
				break;
			}
		}
		
		return board;
	}
	

}	// end
