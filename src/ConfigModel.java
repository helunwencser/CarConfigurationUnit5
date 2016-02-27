import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class ConfigModel extends Servlet{
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) 
    		throws ServletException, IOException {
		request.getSession().setAttribute("model", request.getParameter("model"));
		super.forward(request, response, "configModel.jsp");
    }
}
