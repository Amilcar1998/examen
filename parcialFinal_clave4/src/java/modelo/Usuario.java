
package modelo;

/**
 *
 * @author Dennis
 */
public class Usuario {
    private int codigoUsuario;
    private String username;
    private String clave;
    private int nivel;

    public Usuario() {
    }

    public Usuario(int codigoUsuario, String username, String clave, int nivel) {
        this.codigoUsuario = codigoUsuario;
        this.username = username;
        this.clave = clave;
        this.nivel = nivel;
    }

    public int getNivel() {
        return nivel;
    }

    public void setNivel(int nivel) {
        this.nivel = nivel;
    }

    public int getCodigoUsuario() {
        return codigoUsuario;
    }

    public void setCodigoUsuario(int codigoUsuario) {
        this.codigoUsuario = codigoUsuario;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getClave() {
        return clave;
    }

    public void setClave(String clave) {
        this.clave = clave;
    }
    
    
}
