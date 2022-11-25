package project;
import java.sql.*;

public class connection_provider {
    public static Connection getCon(){
    
        try{
        
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/healthy_food","root","123456");
            System.out.println("Connection success.");
            return con;
        }
        catch(Exception e){
        
            System.out.println(e);
            System.out.println("Connection failed.");
            return null;
        }
    }
}
