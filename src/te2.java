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
import com.google.gdata.data.spreadsheet.Worksheet;
import com.google.gdata.data.spreadsheet.WorksheetEntry;
//import com.google.gdata.data.spreadsheet.
import com.google.gdata.util.ServiceException;
//import sun.rmi.rmic.iiop.ClassPathLoader;

import java.io.File;
import java.io.IOException;
import java.net.URL;
import java.security.GeneralSecurityException;
import java.util.Arrays;
import java.util.List;

public class te2 {
    public static void main(String[] args) throws GeneralSecurityException, IOException, ServiceException {
        ClassLoader classloader = Thread.currentThread().getContextClassLoader();
        URL url = classloader.getResource("p12key.p12");
        final File file = new File(url.getFile());

        HttpTransport HTTP_TRANSPORT = new NetHttpTransport();
        JsonFactory JSON_FACTORY = new JacksonFactory();

        Credential credential = new GoogleCredential.Builder().setTransport(HTTP_TRANSPORT)
                .setJsonFactory(JSON_FACTORY)
                .setServiceAccountId("test-689@pmsproject-282602.iam.gserviceaccount.com") // ���� ���� ���� ����� ����
                .setTokenServerEncodedUrl("https://accounts.google.com/o/oauth2/token")
                .setServiceAccountScopes(Arrays.asList("https://www.googleapis.com/auth/drive", "https://spreadsheets.google.com/feeds", "https://docs.google.com/feeds"))
                .setServiceAccountPrivateKeyFromP12File(file).build();

        // ������ v1���� v3���� �־��µ� ��� �� ���̿����ؼ� ���� �˾ƺ������ߴ�
        SpreadsheetService service = new SpreadsheetService("MySpreadsheetIntegration-v1");
        service.setOAuth2Credentials(credential); // �̰� �Ϸ��� ���� ������ �ڵ� �ѰŴ�. �̰� ������ �ٽ�
        SpreadsheetFeed feed = service.getFeed(new URL("https://spreadsheets.google.com/feeds/spreadsheets/private/full"), SpreadsheetFeed.class);

        List<SpreadsheetEntry> spreadsheets = feed.getEntries();
        for (SpreadsheetEntry s : spreadsheets) {
            System.out.println(s.getTitle().getPlainText());
        }
        
        if(spreadsheets.get(0) != null)
        
        //���� ��������
        for(int i=0; i< spreadsheets.size(); i++) 
        {
            SpreadsheetEntry entry = spreadsheets.get(i);
            if(entry.getTitle().getPlainText().equals("pms_test")) // ���� Ÿ��Ʋ
            {
                List<WorksheetEntry> worksheets = entry.getWorksheets(); // ��Ʈ Ÿ��Ʋ
                for(int k=0;k< worksheets.size();k++)
                {
                     WorksheetEntry worksheet = worksheets.get(k); //pms_test���� k��° ��Ʈ ��������
                     /*System.out.println(worksheet.getTitle().getPlainText());
                     
                     URL cellFeedUrl = worksheet.getCellFeedUrl();
                     CellFeed cellFeed = service.getFeed(cellFeedUrl, CellFeed.class);
                     for (CellEntry cell : cellFeed.getEntries()) 
                     {
                         System.out.println("getPlainText : "+cell.getTitle().getPlainText()); // value�� ��ġ
                         System.out.println("getValue : "+cell.getCell().getValue()); // value�� ����
                     }*/
                     if(worksheet.getTitle().getPlainText().equals("#�η�")) {
                    	 URL cellFeedUrl = worksheet.getCellFeedUrl();
                         CellFeed cellFeed = service.getFeed(cellFeedUrl, CellFeed.class);
                         int num =1;
                         for (CellEntry cell : cellFeed.getEntries()) 
                         {
                            //System.out.println("getPlainText : "+cell.getTitle().getPlainText()); // value�� ��ġ
                           //��Ʈ ���� update
                        	 /*if(cell.getTitle().getPlainText().equals("F2")) {
                            	cell.changeInputValueLocal("������");
                            	cell.update();
                            }*/
                        	System.out.printf(cell.getCell().getValue()+"|"); // value�� ����
                            if(num==11) {
                            	System.out.printf("\n");}
                            num++;
                         }
                     }
                }
            }
        }
        
    }
}