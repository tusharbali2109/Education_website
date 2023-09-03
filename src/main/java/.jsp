import java.io.IOException;
import java.sql.*;
import java.sql.DriverManager;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/Edufordservlet")
public class Edufordservlet extends HttpServlet {
  private static final long serialVersionUID = 1L;

  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    
    String nm=request.getParameter("name");
    String em=request.getParameter("contact-no");
    String ps=request.getParameter("email");
    String db=request.getParameter("subject");
    String co=request.getParameter("message");
    try
    {
      Class.forName("com.mysql.cj.jdbc.Driver");
      Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/Tushar","root","Tusharbali@21");
      String s="Insert into Firstbase values(?,?,?,?,?)";
      PreparedStatement p=cn.prepareStatement(s);
      
      p.setString(1, nm);
      p.setString(2, em);
      p.setString(3, ps);
      p.setString(4, db);
      p.setString(5, co);
      
      int i=p.executeUpdate();
          if(i>0)
          {
            RequestDispatcher rd=request.getRequestDispatcher("about.html");
            rd.forward(request, response);
          }
          else
          {
            RequestDispatcher rd=request.getRequestDispatcher("contact.html");
            rd.forward(request, response);
          }
      
    }
    catch(Exception e)
    {
      e.printStackTrace();
    }
    
  }

}