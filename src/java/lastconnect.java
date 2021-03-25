import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(urlPatterns = {"/lastconnect"})
public class lastconnect extends HttpServlet {
    private static final long serialVersionUID = 1L;

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
       PrintWriter out=response.getWriter();
        
        HttpSession session=request.getSession(false);
        if(session!=null){
             
            String email=(String)session.getAttribute("email");
            
            try{
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/lucthrm?zeroDateTimeBehavior=convertToNull","root","");
                Statement st = (Statement) con.createStatement();
                ResultSet rs = (ResultSet) st.executeQuery("SELECT * FROM users WHERE email='"+email+"'" );
                if(rs.next()){
                    
                    response.sendRedirect("dashboard.jsp");
                }
                else{
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Username & Password dont match');");
                    out.println("location='index.jsp';");
                    out.println("</script>");
                    }
                }
                catch(Exception e){
                    out.println(e);
                }
        }
        else{
            response.sendRedirect("index.jsp");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
