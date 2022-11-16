package kr.co.shop.util;

public class Util {

	public static String getState(int state)
    {
    	String str=null;
    	switch(state)
    	{
    	  case 0: str= "결제완료"; break;
    	  case 1: str= "취소신청"; break;
    	  case 2: str= "취소"; break;
    	  case 3: str= "배송중 "; break;
    	  case 4: str= "배송완료"; break;
    	  case 5: str= "반품신청"; break;
    	  case 6: str= "반품완료"; break;
    	  case 7: str= "교환신청"; break;
    	  default: str= "교환완료";
    	}
    	return str;
    }
}
