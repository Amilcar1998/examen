
package modelo;

/**
 *
 * @author Dennis
 */
public class Equipo {
    private int codigoEquipo;
    private String equipo;

    public Equipo() {
    }

    public Equipo(int codigoEquipo, String equipo) {
        this.codigoEquipo = codigoEquipo;
        this.equipo = equipo;
    }

    public String getEquipo() {
        return equipo;
    }

    public void setEquipo(String equipo) {
        this.equipo = equipo;
    }

    public int getCodigoEquipo() {
        return codigoEquipo;
    }

    public void setCodigoEquipo(int codigoEquipo) {
        this.codigoEquipo = codigoEquipo;
    }
    
    
}
