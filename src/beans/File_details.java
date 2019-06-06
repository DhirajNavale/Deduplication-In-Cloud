package beans;

public class File_details {

	int id;
	long filelength;
	String username,Filename,Fileid,Filepath;
	Long uploadtime;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public long getFilelength() {
		return filelength;
	}
	public void setFilelength(long filelength) {
		this.filelength = filelength;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getFilename() {
		return Filename;
	}
	public void setFilename(String filename) {
		Filename = filename;
	}
	public String getFileid() {
		return Fileid;
	}
	public void setFileid(String fileid) {
		Fileid = fileid;
	}
	public String getFilepath() {
		return Filepath;
	}
	public void setFilepath(String filepath) {
		Filepath = filepath;
	}
	public Long getUploadtime() {
		return uploadtime;
	}
	public void setUploadtime(Long time) {
		this.uploadtime = time;
	}
	
	
}
