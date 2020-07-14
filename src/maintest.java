import java.io.IOException;
import java.security.GeneralSecurityException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Timer;

import com.google.gdata.util.ServiceException;

import jsp.sheet.method.*;
public class maintest {

	
	public static void main(String[] args) {
		 //TODO Auto-generated method stub
		 //Date to String 변환
        backUp back = new backUp();
        //back.run();
       
        Timer timer = new Timer();
        
        //이 스케줄이 시작될 시간
        Calendar date = Calendar.getInstance();
        date.set(Calendar.DAY_OF_WEEK, Calendar.TUESDAY);
        date.set(Calendar.AM_PM, Calendar.AM);
        date.set(Calendar.HOUR, 10);
        date.set(Calendar.MINUTE, 00);
        date.set(Calendar.SECOND, 00);
        date.set(Calendar.MILLISECOND, 0);
        
        //얼마만큼의 주기로 실행될 지 기간 설정(현재 하루주기)
        timer.scheduleAtFixedRate(back, date.getTime(), 1000 * 60 * 60 * 24);
	}
}
