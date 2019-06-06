package User;


import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class HashGeneratorUtils {
	private HashGeneratorUtils() {
		
	}
	
	public static String generateSHA256(File file) throws HashGenerationException {
		return hashFile(file, "SHA-256");
	}
	
	
	private static String hashFile(File file, String algorithm)
			throws HashGenerationException {
		try (FileInputStream inputStream = new FileInputStream(file)) {
			MessageDigest digest = MessageDigest.getInstance(algorithm);
			
			byte[] bytesBuffer = new byte[1024];
			int bytesRead = -1;
			
			while ((bytesRead = inputStream.read(bytesBuffer)) != -1) {
				digest.update(bytesBuffer, 0, bytesRead);
			}
			
			byte[] hashedBytes = digest.digest();
			
			return convertByteArrayToHexString(hashedBytes);
		} catch (NoSuchAlgorithmException | IOException ex) {
			throw new HashGenerationException(
					"Could not generate hash from file", ex);
		}		
	}
	
	private static String convertByteArrayToHexString(byte[] arrayBytes) {
		StringBuffer stringBuffer = new StringBuffer();
		for (int i = 0; i < arrayBytes.length; i++) {
			stringBuffer.append(Integer.toString((arrayBytes[i] & 0xff) + 0x100, 16)
					.substring(1));
		}		
		return stringBuffer.toString();
	}
}
