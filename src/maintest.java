import java.io.IOException;
import java.security.GeneralSecurityException;
import jsp.sheet.method.*;
import com.google.gdata.util.ServiceException;

public class maintest {

	public static void main(String[] args) throws GeneralSecurityException, IOException, ServiceException {
		// TODO Auto-generated method stub
		sheetMethod test = new sheetMethod();
		test.connect();
		test.access();
		test.update();
	}
}
