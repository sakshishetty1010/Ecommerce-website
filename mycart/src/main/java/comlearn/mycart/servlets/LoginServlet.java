package comlearn.mycart.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.learn.mycart.dao.UserDao;
import com.learn.mycart.entities.User;
import com.learn.mycart.helper.FactoryProvider;

@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		if(email.isEmpty() || password.isEmpty())
			out.println("One of the fields is empty!");
		
		UserDao userdao = new UserDao(FactoryProvider.getFactory());
		User user = userdao.getUserByEmailAndPassword(email, password);
		//System.out.println(user);
		HttpSession httpsession = request.getSession();
		if(user == null) {
			
			httpsession.setAttribute("message", "Invalid details!");
			response.sendRedirect("login.jsp");
			return;
		}
		else {
			out.println("<h1>Welcome"+user.getUserName()+"</h1>");
			
			//login
			httpsession.setAttribute("current-user",user);
			
			if(user.getUserType().equals("admin")) {
				// admin :- admin.jsp
				response.sendRedirect("admin.jsp");
			}
			else if(user.getUserType().equals("normal")) {
				// normal :- normal.jsp
				response.sendRedirect("normal.jsp");
			}
			else if(user.getUserType().equals("seller")) {
				// seller :- seller.jsp
				response.sendRedirect("seller.jsp");
			}
			
			else {
				out.println("Oops, We could not identify the user type!");
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	

}
