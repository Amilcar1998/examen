
package modelo;

import conexion.Conexion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Chmod
 */
public class DaoJugador extends Conexion{
    
    //Listar nacionalidad
    public List<Equipo> listarEquipo() throws Exception{
        ResultSet rs;
        List<Equipo> lista = new ArrayList<>();
        try {
            this.conectar();
            String sql = "SELECT * FROM equipo";
            PreparedStatement pst = this.getCon().prepareStatement(sql);
            //Ejecutar query
            rs = pst.executeQuery();
            while(rs.next()){
                Equipo e = new Equipo();
                e.setCodigoEquipo(rs.getInt(1));
                e.setEquipo(rs.getString(2));
                lista.add(e);
            }
        } catch (Exception e) {
            throw e;
        } finally{
            this.desconectar();
        }
        return lista;
    }
    
    //Listar Jugador
    public List<Jugador> listarJugador() throws Exception{
        ResultSet rs;
        List<Jugador> lista = new ArrayList<>();
        try {
            this.conectar();
            String sql = "SELECT * FROM jugador j INNER JOIN equipo e ON j.codigoEquipo=e.codigoEquipo";
            PreparedStatement pst = this.getCon().prepareStatement(sql);
            //Ejecutar query
            rs = pst.executeQuery();
            while(rs.next()){
                Jugador j = new Jugador();
                Equipo e = new Equipo();
                j.setCodigoJugador(rs.getInt(1));
                j.setNombre(rs.getString(2));
                j.setEdad(rs.getInt(3));
                j.setSalario(rs.getDouble(4));
                e.setCodigoEquipo(rs.getInt(5));
                e.setEquipo(rs.getString(7));
                j.setEquipo(e);
                lista.add(j);
            }
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
        return lista;
    }
    
    //Insertar Jugador
    public void insertarJugador(Jugador j) throws Exception{
        try {
            this.conectar();
            String sql = "INSERT INTO jugador VALUES(?,?,?,?,?)";
            PreparedStatement pst = this.getCon().prepareStatement(sql);
            pst.setInt(1, j.getCodigoJugador());
            pst.setString(2, j.getNombre());
            pst.setInt(3, j.getEdad());
            pst.setDouble(4, j.getSalario());
            pst.setInt(5, j.getEquipo().getCodigoEquipo());
            //Ejecutar query
            pst.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally{
            this.desconectar();
        }
    }
    
    //Modificar Jugador
    public void modificarJugador(Jugador j) throws Exception{
        try {
            this.conectar();
            String sql = "UPDATE jugador SET nombre=?, edad=?, salario=?, codigoEquipo=? WHERE codigoJugador=?";
            PreparedStatement pst = this.getCon().prepareStatement(sql);            
            pst.setString(1, j.getNombre());
            pst.setInt(2, j.getEdad());
            pst.setDouble(3, j.getSalario());
            pst.setInt(4, j.getEquipo().getCodigoEquipo());
            pst.setInt(5, j.getCodigoJugador());
            //Ejecutar query
            pst.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally{
            this.desconectar();
        }
    }
    
    //Eliminar jugador
    public void eliminarJugador(Jugador j) throws Exception{
        try {
            this.conectar();
            String sql = "DELETE FROM jugador WHERE codigoJugador=?";
            PreparedStatement pst = this.getCon().prepareStatement(sql);
            pst.setInt(1, j.getCodigoJugador());
            //Ejecutar query
            pst.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
    }
}
