import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class GetModelList extends Servlet {
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) 
    		throws ServletException, IOException {
		super.forward(request, response, "getModel.jsp");
    }
}
