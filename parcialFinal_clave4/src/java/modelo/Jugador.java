
package modelo;

/**
 *
 * @author Dennis
 */
public class Jugador {
    private int codigoJugador;
    private String nombre;
    private int edad;
    private Double salario;
    private Equipo equipo;

    public Jugador() {
    }

    public Jugador(int codigoJugador, String nombre, int edad, Double salario, Equipo equipo) {
        this.codigoJugador = codigoJugador;
        this.nombre = nombre;
        this.edad = edad;
        this.salario = salario;
        this.equipo = equipo;
    }

    public Equipo getEquipo() {
        return equipo;
    }

    public void setEquipo(Equipo equipo) {
        this.equipo = equipo;
    }

    public int getCodigoJugador() {
        return codigoJugador;
    }

    public void setCodigoJugador(int codigoJugador) {
        this.codigoJugador = codigoJugador;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public Double getSalario() {
        return salario;
    }

    public void setSalario(Double salario) {
        this.salario = salario;
    }
    
    
}
