import java.io.IOException;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class GetResult extends Servlet {
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) 
    		throws ServletException, IOException {
		Map<String, String> parameters = request.getParameterMap();
		Set<String> keys = parameters.keySet();
		for(String key : keys){
			request.getSession().setAttribute(key, request.getParameter(key));
		}
		super.forward(request, response, "getResult.jsp");
    }
}
