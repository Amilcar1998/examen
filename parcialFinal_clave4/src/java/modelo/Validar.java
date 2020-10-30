
package modelo;

import conexion.Conexion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author Chmod
 */
public class Validar extends Conexion{
      //validar usuario
     public int validarUsuario(Usuario u)throws Exception{
        int nivel=0;
        ResultSet rs;
         try {
            this.conectar();
            String sql = "SELECT nivel FROM usuarios WHERE username=? AND clave=?";
            PreparedStatement pst = this.getCon().prepareStatement(sql);
            pst.setString(1, u.getUsername());
            pst.setString(2, u.getClave());
            rs = pst.executeQuery();
            while(rs.next()){
                nivel = rs.getInt(1);
            }
         } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
        return nivel;
     }
}
