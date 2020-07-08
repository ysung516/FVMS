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
import com.google.gdata.data.spreadsheet.SpreadsheetEntry;
import com.google.gdata.data.spreadsheet.SpreadsheetFeed;
import com.google.gdata.data.spreadsheet.WorksheetEntry;
import com.google.gdata.util.ServiceException;

public class sheetMethod {
	
	SpreadsheetService service;
	List<SpreadsheetEntry> spreadsheets;
	String FileName = "SureSoft-PMS";
	
	//연결
	public void connect() throws GeneralSecurityException, IOException, ServiceException {
		ClassLoader classloader = Thread.currentThread().getContextClassLoader();
        URL url = classloader.getResource("service.p12");
        final File file = new File(url.getFile());

        HttpTransport HTTP_TRANSPORT = new NetHttpTransport();
        JsonFactory JSON_FACTORY = new JacksonFactory();

        Credential credential = new GoogleCredential.Builder().setTransport(HTTP_TRANSPORT)
                .setJsonFactory(JSON_FACTORY)
                .setServiceAccountId("ymyou-1@e-tensor-282602.iam.gserviceaccount.com") // 서비스 계정 생성 당시의 정보
                .setTokenServerEncodedUrl("https://accounts.google.com/o/oauth2/token")
                .setServiceAccountScopes(Arrays.asList("https://www.googleapis.com/auth/drive", "https://spreadsheets.google.com/feeds", "https://docs.google.com/feeds"))
                .setServiceAccountPrivateKeyFromP12File(file).build();

        // 버전이 v1부터 v3까지 있었는데 사실 그 차이에대해선 아직 알아보지못했다
        service = new SpreadsheetService("MySpreadsheetIntegration-v1");
        service.setOAuth2Credentials(credential); // 이거 하려고 위에 저렇게 코딩 한거다. 이게 인증의 핵심
	}
	
	//시트 불러오기
	public void access() throws GeneralSecurityException, IOException, ServiceException {
		SpreadsheetFeed feed = service.getFeed(new URL("https://spreadsheets.google.com/feeds/spreadsheets/private/full"), SpreadsheetFeed.class);
        spreadsheets = feed.getEntries();
        System.out.println("12");
        for (SpreadsheetEntry s : spreadsheets) {
          System.out.println(s.getTitle().getPlainText());
      }
	}
	
	//업데이트
	public void update() throws GeneralSecurityException, IOException, ServiceException{
		  for(int i=0; i< spreadsheets.size(); i++) 
	        {
	            SpreadsheetEntry entry = spreadsheets.get(i);
	            if(entry.getTitle().getPlainText().equals(FileName)) // 파일 타이틀
	            {
	                List<WorksheetEntry> worksheets = entry.getWorksheets(); // 시트 타이틀
	                for(int k=0;k< worksheets.size();k++)
	                {
	                     WorksheetEntry worksheet = worksheets.get(k); //pms_test에서 k번째 시트 가져오기
	                     /*System.out.println(worksheet.getTitle().getPlainText());
	                     
	                     URL cellFeedUrl = worksheet.getCellFeedUrl();
	                     CellFeed cellFeed = service.getFeed(cellFeedUrl, CellFeed.class);
	                     for (CellEntry cell : cellFeed.getEntries()) 
	                     {
	                         System.out.println("getPlainText : "+cell.getTitle().getPlainText()); // value의 위치
	                         System.out.println("getValue : "+cell.getCell().getValue()); // value의 내용
	                     }*/
	                     if(worksheet.getTitle().getPlainText().equals("#인력")) {
	                    	 URL cellFeedUrl = worksheet.getCellFeedUrl();
	                         CellFeed cellFeed = service.getFeed(cellFeedUrl, CellFeed.class);
	                         int num =1;
	                         for (CellEntry cell : cellFeed.getEntries()) 
	                         {
	                            //System.out.println("getPlainText : "+cell.getTitle().getPlainText()); // value의 위치
	                           //시트 내용 update
	                        	 if(cell.getTitle().getPlainText().equals("F2")) {
	                            	cell.changeInputValueLocal("신혜림");
	                            	cell.update();
	                            }
	                        	System.out.printf(cell.getCell().getValue()+"|"); // value의 내용
	                            if(num==11) {
	                            	System.out.printf("\n");}
	                            num++;
	                         }
	                     }
	                }
	            }
	        }}
}
