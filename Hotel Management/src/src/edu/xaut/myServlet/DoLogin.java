package src.edu.xaut.myServlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lyq.bean.login;


import src.edu.xaut.sql.loginSql;

/**
 * Servlet implementation class DoUserLog
 */
@WebServlet("/DoLogin")
public class DoLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DoLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		try {
			request.setCharacterEncoding("UTF-8");
			String ID=request.getParameter("ID");
			String name=request.getParameter("name");
			String password=request.getParameter("password");
			loginSql uis = new loginSql();
			boolean flag = uis.search(ID,name,password);
			if(flag == true) {
				login login=new com.lyq.bean.login();
				login.setID(ID);
				login.setName(name);
				login.setPassword(password);
				request.getSession().setAttribute("login",login);
				response.sendRedirect("roomshow.jsp");
				return;
			}
			else {
				response.sendRedirect("failure.jsp");
				return;
			}
	}catch(Exception e){
		e.printStackTrace();
		}
	}

}
