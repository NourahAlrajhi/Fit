
import java.sql.*;
import javax.swing.JOptionPane;



public class JCONNECTION {
     public static Connection cn;
    public static Statement st;
    public static Connection conDB(){
   
        try{
           Class.forName("com.mysql.jdbc.Driver");
           cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Fit?zeroDateTimeBehavior=CONVERT_TO_NULL","root","");
           st = cn.createStatement();
           JOptionPane.showMessageDialog(null,"Connected");
          // System.out.println("Connected");
           return cn;
        }catch(Exception e){
            JOptionPane.showMessageDialog(null,e);
            return null;
        }
    }
}
