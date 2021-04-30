package es.uco.pw.business.user;

import es.uco.pw.business.anuncio.Anuncio.Tags;

public class User {
	String nombre = "";
	String apellidos="";
	String email = "";
	String password="";
	int edad = -1;
	String tag;
	int attemps=3;
	
	
	public User (String nombre,String apellidos, String email,String password, int edad,String[] tag, int attempts) {
		this.nombre = nombre;
		this.apellidos = apellidos;
		this.email = email;
		this.password = password;		
		this.edad = edad;
		this.setTag(tag);
		this.attemps = attempts;
	}
	
	public User (String nombre,String apellidos,String email,String password,int edad,String tag, int attemps) {
		this.nombre = nombre;
		this.apellidos = apellidos;
		this.email = email;
		this.password = password;
		this.edad = edad;
		this.setTag(tag);
		this.attemps = attemps;	
	}

	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getApellidos() {
		return apellidos;
	}
	public void setApellidos(String apellidos) {
		this.apellidos = apellidos;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getEdad() {
		return edad;
	}
	public void setEdad(int edad) {
		this.edad = edad;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getTag() {
		
		return tag;
	}
	public void setTag(String[] aux) {
		String total="";
		
		for(int i=0;i<aux.length;i++) {
			for(Tags t : Tags.values())
			{
				if(t.name().equals(aux[i]))
					total += t.name() + " ";	
			}
		}
		this.tag=total;
	}
	public void setTag(String aux) {
		this.tag=aux;
	}
	
	public void setAttemps(int attemps) {
		this.attemps = attemps;
	}
	public int getAttemps() {
		return attemps;
	}
	
	public String toString() {
		return "Nombre: " + this.getNombre() + "; Apellidos: " + this.getApellidos() +"; Email: " + this.getEmail() + "; edad: " + Integer.toString(this.getEdad()) + "; Tags: " + this.getTag();
	}
	
}