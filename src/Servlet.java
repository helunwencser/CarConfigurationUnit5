import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public abstract class Servlet extends HttpServlet{
	
	public void forward(HttpServletRequest request, HttpServletResponse response, String jsppage) 
			throws ServletException, IOException{
		request.getRequestDispatcher(jsppage).forward(request, response);
	}
	
    public void doPost(HttpServletRequest request, HttpServletResponse response) 
    		throws ServletException, IOException {
    	this.doPost(request, response);
    }
}
