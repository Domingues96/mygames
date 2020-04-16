/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.*;

/**
 *
 * @author domin
 */
public class ConectorModule {

    public static Connection conect() {
        java.sql.Connection conn = null;
        String driver = "com.mysql.jdbc.Driver";

        String url = "jdbc:mysql://localhost:3306/mygames";

        String user = "root";
        String passwd = "";

        try {
            Class.forName(driver);
            conn = DriverManager.getConnection(url, user, passwd);
            return conn;
        } catch (Exception e) {
            //System.out.println(e);
            return null;
        }

    }
}
