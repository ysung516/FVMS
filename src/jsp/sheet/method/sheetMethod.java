package jsp.sheet.method;

import java.io.File;
import java.io.IOException;
import java.net.URL;
import java.security.GeneralSecurityException;
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

public class sheetMethod {
	sheetBean sheet = new sheetBean();
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
    	
    	//System.out.println(sheet.getWorksheet().getRowCount());
    	URL listFeedUrl = sheet.getWorksheet().getListFeedUrl();
    	ListFeed listFeed = sheet.getService().getFeed(listFeedUrl, ListFeed.class);
    	List<ListEntry> list = listFeed.getEntries();	// 모든 행 가져오기
  
    	for(int a = 0; a < list.size(); a++)	{
    		ListEntry li = list.get(a);	// 첫 번째 행 데이터 부터 가져옴
    		
    		if(li.getCustomElements().getValue("id").equals(id)) {
    			if(li.getCustomElements().getValue("pw").equals(pw)) {
    				check = 1;
//    				member.setID(id);
//    				member.setPASSWORD(pw);
    				break;
    			} else
    				check = 0;
    				break;
    			
    		} else 
    			check = 0;
    	}
    	return check;
    }
//	// 업데이트
//	public void update() throws GeneralSecurityException, IOException, ServiceException {
//
//		for (int k = 0; k < sheet.getWorksheets().size(); k++) {
//			WorksheetEntry worksheet = sheet.getWorksheets().get(k); // pms_test에서 k번째 시트 가져오기
//			System.out.println(worksheet.getContent());
//			if (worksheet.getTitle().getPlainText().equals("#인력")) {
//				URL cellFeedUrl = worksheet.getCellFeedUrl();
//				CellFeed cellFeed = sheet.getService().getFeed(cellFeedUrl, CellFeed.class);
//				int num = 1;
//				for (CellEntry cell : cellFeed.getEntries()) {
//					if (cell.getTitle().getPlainText().equals("F2")) {
//						cell.changeInputValueLocal("신혜림");
//						cell.update();
//					}
//					System.out.printf(cell.getCell().getValue() + "|"); // value의 내용
//					if (num == 11) {
//						System.out.printf("\n");
//					}
//					num++;
//				}
//				break;
//			}	
	//	} // end for

	//} // end update

}
