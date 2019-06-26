package pe.autonoma.entity;


//Entidades de la BaseDeDatos de la biblioteca
public class Biblioteca {
	private Integer codlib;
	private String nomlib;
	private Integer cantlib;
	private String autor;
	
	public Biblioteca(){
	}

	public Integer getCodlib() {
		return codlib;
	}

	public void setCodlib(Integer codlib) {
		this.codlib = codlib;
	}

	public String getNomlib() {
		return nomlib;
	}

	public void setNomlib(String nomlib) {
		this.nomlib = nomlib;
	}

	public Integer getCantlib() {
		return cantlib;
	}

	public void setCantlib(Integer cantlib) {
		this.cantlib = cantlib;
	}

	public String getAutor() {
		return autor;
	}

	public void setAutor(String autor) {
		this.autor = autor;
	}
	
}
