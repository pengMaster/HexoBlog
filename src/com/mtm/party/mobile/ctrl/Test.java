package com.mtm.party.mobile.ctrl;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

public class Test {
	
	public static void main(String[] args) {
		
		try {
			copyDir("D:\\workTime\\work_soft\\tomcat\\tomcat\\blogImg","D:\\workTime\\work_soft\\tomcat\\tomcat\\blogImg\\blogImg");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	public static void copyDir(String sourcePath, String newPath) throws IOException {
        File file = new File(sourcePath);
        String[] filePath = file.list();
        
        if (!(new File(newPath)).exists()) {
            (new File(newPath)).mkdir();
        }
        
        for (int i = 0; i < filePath.length; i++) {
            if ((new File(sourcePath + file.separator + filePath[i])).isDirectory()) {
                copyDir(sourcePath  + file.separator  + filePath[i], newPath  + file.separator + filePath[i]);
            }
            
            if (new File(sourcePath  + file.separator + filePath[i]).isFile()) {
                copyFile(sourcePath + file.separator + filePath[i], newPath + file.separator + filePath[i]);
            }
            
        }
    }
	
	public static void copyFile(String oldPath, String newPath) throws IOException {
		File oldFile = new File(oldPath);
		File file = new File(newPath);
		FileInputStream in = null;
		FileOutputStream out = null;
		try {
			in = new FileInputStream(oldFile);
			out = new FileOutputStream(file);
			byte[] buffer = new byte[2097152];
			int readByte = 0;
			while ((readByte = in.read(buffer)) != -1) {
				out.write(buffer, 0, readByte);
			}

		} finally {
			in.close();
			out.close();
		}
	}
}
