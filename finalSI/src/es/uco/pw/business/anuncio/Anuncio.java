package es.uco.pw.business.anuncio;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 
 * @author Jose Manuel Porras, Juan Valverde
 * clase Anuncio
 *
 */
public class Anuncio {
	
	public enum Tags
	{
		Actualidad,
		Alimentacion,
		Deportes,
		Diversion,
		Moda,
		Musica,
		Tecnologia;
	};
	
	public enum Tipo {
		General,
		Tematico,
		Individualizado,
		Flash,
	};

	public enum Fase {
		editado, 
		en_espera,
		publicado,
		archivado,
	};

	private int id;
	private String titulo;
	private String propietario;	
	private String destinatario;
	private String cuerpo;
	private Tipo tipo;
	private Fase fase;
	private Tags tag;
	private String fecha_comienzo;
	private String fecha_fin;

	//Inicializar
	public Anuncio() {
		this.destinatario=null;
		this.tag=null;
		this.fecha_comienzo=null;
		this.fecha_fin=null;
	}
	
	public Anuncio(int id, String tit, String prop, String dest, String cuerpo, String fase, String tipo, String tag, String fcom, String ffin) 
	{
		this.id=id;
		this.titulo=tit;
		this.propietario=prop;
		this.destinatario=dest;
		this.cuerpo=cuerpo;
		this.fecha_comienzo=fcom;
		this.fecha_fin=ffin;
		this.setTipo(tipo);
		this.setFase(fase);
		this.setTag(tag);
	}
	
	public void AnuncioGeneral(int id)
	{
		this.setId(id);
		this.setFase(Fase.publicado.name());
		this.setTipo(Tipo.General.name());
	}
	
	public void AnuncioTematico(int id)
	{
		this.setId(id);
		this.setFase(Fase.publicado.name());
		this.setTipo(Tipo.Tematico.name());
	}
	
	public void AnuncioIndividualizado(int id, String destinatario)
	{
		this.setId(id);
		this.setFase(Fase.publicado.name());
		this.setDestinatario(destinatario);
		this.setTipo(Tipo.Individualizado.name());
	}
	
	public void AnuncioFlash(int id)
	{
		this.setId(id);
		this.setFase(Fase.editado.name());
		this.setTipo(Tipo.Flash.name());
	}
	
	//Operaciones generales
	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitulo() {
		return this.titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}
	
	public String getPropietario() {
		return this.propietario;
	}

	public void setPropietario(String propietario) {
		this.propietario = propietario;
	}
	
	public String getDestinatario() {
		return this.destinatario;
	}

	public void setDestinatario(String destinatario) {
		this.destinatario = destinatario;
	}
	
	public String getCuerpo() {
		return this.cuerpo;
	}
	
	 public void setCuerpo(String cuerpo) {
		this.cuerpo = cuerpo;
	}
	
	public String getTipo() {
		return this.tipo.toString();
	}
	
	 public void setTipo(String aux) {
		 if(aux!=null)
		 {
			for(Tipo t : Tipo.values())
			{
				if(t.name().equals(aux))
					this.tipo=t;	
			} 
		 }
	}
	
	public String getFase() {
		return this.fase.toString();
	}
	
	 public void setFase(String aux) {
		 if(aux!=null)
		 {
			for(Fase f : Fase.values())
			{
			if(f.name().equals(aux))
				this.fase=f;
			} 
		 }
	}
	
	public String getTag() {
		return tag.toString();
	}
	
	 public void setTag(String aux) {
		 if(aux!=null)
		 {
			 for(Tags t : Tags.values())
			{
				if(t.name().equals(aux))
					this.tag=t;	
			}
		 }	 
	}
	
	public String getFechaComienzo() {
		return this.fecha_comienzo;
	}
	
	 public void setFechaComienzo(String fecha) {
		this.fecha_comienzo = fecha;
	}
	
	public String getFechaFin() {
		return this.fecha_fin;
	}
	
	public void setFechaFin(String fecha) {
		this.fecha_fin = fecha;
	}
	 
	public boolean comprobarTags(String tema) {
		for(Tags t : Tags.values())
		{
			if(t.name().equals(tema))
				return true;
		}
		return false;
	}
	
	public static boolean comprobarTags(String tags, String tema)
	{
		String temas[] = tags.split(" ");
		
		for(int i=0;i<temas.length;i++)
		{
			if(temas[i].equals(tema))
				return true;
		}
		return false;
	}
	
	public static boolean comprobarFechas(String comienzo, String fina)
	{
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		
		Date fecha = new Date();
		Date com = null;
		Date fin = null;
		try {
			com = dateFormat.parse(comienzo);
			fin = dateFormat.parse(fina);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		if(com.before(fecha) && fin.after(fecha))
			return true;
		else
			return false;
	}

	public String toString() {
		
		String info = "Id: " + this.id + " Titulo: " + this.titulo + " Propietario: " + this.propietario;
		
		if(this.destinatario != null)
			info += " Destinatarios: " + this.destinatario;
		
		if(this.getTag() != null)
			info += " Tematica: " + this.getTag();
		
		if(this.fecha_comienzo != null)
			info += " Fecha comienzo: " + this.fecha_comienzo + " Fecha fin: " + this.fecha_fin;
		
		info += " Cuerpo:\n" + this.cuerpo + "\n";
		
		return info;
	}
	
}
