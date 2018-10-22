package com.mtm.party.mobile.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class StringUtils {
	
	/**
	 * @描述 java生成流水号 14位时间戳 + 6位随机数
	 * @作者 shaomy
	 * @时间:2017-1-12 上午10:10:41
	 * @参数:@return
	 * @返回值：String
	 */
	public static String getId() {
		String id = "";
		// 获取当前时间戳
		SimpleDateFormat sf = new SimpleDateFormat("yyyyMMddHHmmss");
		String temp = sf.format(new Date());
		// 获取6位随机数
		int random = (int) ((Math.random() + 1) * 100000);
		id = temp + random;
		return id;
	}

}
