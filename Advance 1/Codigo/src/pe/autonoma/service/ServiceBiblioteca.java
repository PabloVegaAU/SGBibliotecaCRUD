package pe.autonoma.service;
import java.util.List;
import pe.autonoma.entity.Biblioteca;

//Interfaz de la Biblioteca
public interface ServiceBiblioteca {
public List<Biblioteca> bibliotecaQry();
	
	public void bibliotecaIns(Biblioteca biblioteca);
	
	public Biblioteca bibliotecaFnd(Integer codlib);
	
	public void bibliotecaUpd(Biblioteca biblioteca);
	
	public void bibliotecaDel(Integer codlib);
	
	public String getMensaje();
}
