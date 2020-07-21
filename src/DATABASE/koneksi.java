/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package DATABASE;

import com.mysql.jdbc.jdbc2.optional.MysqlDataSource;
import java.sql.Connection;
import java.sql.SQLException;
import javax.swing.JOptionPane;

/**
 *
 * @author Harun Ar
 */
public class koneksi {
    
    private static Connection koneksi;
    
    public static Connection koneksiDatabase(){
    if(koneksi==null){
        MysqlDataSource dataSource = new MysqlDataSource();
        dataSource.setURL("jdbc:mysql://localhost/tokobukudesk");
        dataSource.setUser("root");
        dataSource.setPassword("");
        try{
            koneksi = dataSource.getConnection();
        }catch(SQLException e){
            JOptionPane.showMessageDialog(null, "Error Koneksi :" + e.getMessage());
        }
    }    
    return koneksi;
    }
}
