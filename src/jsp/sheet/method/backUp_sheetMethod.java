package jsp.sheet.method;

import java.io.IOException;
import java.net.URL;
import java.security.GeneralSecurityException;
import java.util.List;

import com.google.gdata.client.spreadsheet.SpreadsheetService;
import com.google.gdata.data.sites.CreationActivityEntry;
import com.google.gdata.data.spreadsheet.SpreadsheetEntry;
import com.google.gdata.data.spreadsheet.SpreadsheetFeed;
import com.google.gdata.data.spreadsheet.WorksheetEntry;
import com.google.gdata.model.gd.CreateId;
import com.google.gdata.util.ServiceException;

public class backUp_sheetMethod {

	sheetMethod method = new  sheetMethod();
	
	public backUp_sheetMethod() {
	}
	
	// 백업 시트 불러오기
	public void backUpaccess() throws GeneralSecurityException, IOException, ServiceException {
		SpreadsheetService service = method.sheet.getService();
		List<SpreadsheetEntry> spreadsheets;
		SpreadsheetFeed feed = service.getFeed(
				new URL("https://spreadsheets.google.com/feeds/spreadsheets/private/full"), SpreadsheetFeed.class);
		spreadsheets = feed.getEntries();

		method.sheet.setSpreadsheets(spreadsheets);
		method.sheet.setFeed(feed);
		SpreadsheetEntry entry;
		for (int i = 0; i < method.sheet.getSpreadsheets().size(); i++) {
			entry = method.sheet.getSpreadsheets().get(i);	// 접근가능 모든파일중 filename찾기
			if (entry.getTitle().getPlainText().equals(method.sheet.getBackupFile())) {	//filename 일치 확인
				method.sheet.setEntry(entry);	// suresoft-pms파일 저장
				
				break;
			}
		}
//		List<WorksheetEntry> worksheets = method.sheet.getEntry().getWorksheets(); // 시트 타이틀
//		CreationActivityEntry
//		method.sheet.setWorksheets(worksheets);	// 시트타이틀 저장
//		URL workFeedUrl = entry.getWorksheetFeedUrl();
//	      WorksheetEntry e = new WorksheetEntry();
//	      WorksheetFeed workFeed = service.getFeed(workFeedUrl, WorksheetFeed.class);
//	      TextConstruct con=new PlainTextConstruct("추가시트2");
//	      e.setTitle(con);
//	      e.setColCount(1000);
//	      e.setRowCount(1000);
//	      workFeed.insert(e);
	}
//	
//	public void 
}
