package com.mtm.party.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

public class FileUtils {

	/**
	 * 文件复制
	 * @param source
	 * @param dest
	 * @throws IOException
	 */
	public static void copyFileUsingFileStreams(File source, File dest)throws IOException {    
		
			InputStream input = null;    
			OutputStream output = null;    
			try {
			       input = new FileInputStream(source);
			       output = new FileOutputStream(dest);        
			       byte[] buf = new byte[1024];        
			       int bytesRead;        
			       while ((bytesRead = input.read(buf)) != -1) {
			           output.write(buf, 0, bytesRead);
			       }
			} finally {
			    input.close();
			    output.close();
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
