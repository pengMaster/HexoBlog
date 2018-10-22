package com.mtm.party.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Properties;

public class StringUtils {
	
	public static   String   getDataString (Date date,String format){
		
		try {
			SimpleDateFormat formatter = new SimpleDateFormat(format);//yyyyMMddHHmmss
			return formatter.format(date);
		} catch (Exception e) {			
			e.printStackTrace();
		}
		return "";
	}
	
	public static String generateRefID() {
		Date now = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		Properties prop = new Properties(System.getProperties());
		String userName = prop.getProperty("user.name");
		String refId = "ST_" + userName + "_" + sdf.format(now);
		return refId;
	}
	
	/**
	 * 根据type转换名字
	 * @param type
	 * @return
	 */
	public static String getTypeName(String type){
		
		String typeName = "";
		if (null==type || "".equals(type) || "null".equals(typeName)) {
			return "";
		}
		int parseInt = Integer.parseInt(type);
	
		switch (parseInt) {
		case 1:
			typeName = "前端";
			break;
		case 2:
			typeName = "后台";
			break;
		case 3:
			typeName = "安卓";
			break;
		case 4:
			typeName = "小程序";
			break;
		default:
			break;
		}
		return typeName;
	}
	/**
	 * 根据日期截取其中月日
	 * @param date
	 * @return
	 * @throws ParseException 
	 */
	public static String getMonthDay(String date) throws ParseException{
		
		if (null==date || "".equals(date) || "null".equals(date)) {
			return "";
		}
		 SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	     Date dates = simpleDateFormat.parse(date);
	     String month = dates.getMonth()<10?"0"+dates.getMonth():dates.getMonth()+"";
	     String day = dates.getDay()<10?"0"+dates.getDay():dates.getDay()+"";
	     return month + "-" +day;
		
	}

}
