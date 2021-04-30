package es.uco.pw.display.javaBean;
import es.uco.pw.business.anuncio.Anuncio.Tags;

public class CustomerBean implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	private String emailUser = "";
	private String passwordUser="";
	private String nameUser = "";
	private int attemptsUser = 3;

	public String getEmailUser() {
		return emailUser;
	}

	public void setEmailUser(String emailUser) {
		this.emailUser = emailUser;
	}
	
	public String getPasswordUser() {
		return passwordUser;
	}

	public void setPasswordUser(String passwordUser) {
		this.passwordUser = passwordUser;
	}
	
	public String getnameUser() {
		return nameUser;
	}

	public void setNameUser(String nameUser) {
		this.nameUser = nameUser;
	}

	public int getAttemptsUser() {
		return attemptsUser;
	}

	public void setAttemptsUser(int attemptsUser) {
		this.attemptsUser = attemptsUser;
	}
}
