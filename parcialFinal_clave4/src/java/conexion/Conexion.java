
package conexion;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author Chmod
 */
public class Conexion {
      private Connection con;
    
    public void conectar() throws Exception{
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/ramirezlopezhernandez";
            String user = "root";
            String password = "";
            con = DriverManager.getConnection(url, user, password);
        } catch (Exception e) {
            throw e;
        }
    }
    
    public void desconectar() throws Exception{
        try {
            if(con!=null){
                if(con.isClosed()==false){
                    con.close();
                }
            }
        } catch (Exception e) {
            throw e;
        }
    }

    public Connection getCon() {
        return con;
    }

    public void setCon(Connection con) {
        this.con = con;
    }
    
    
}
