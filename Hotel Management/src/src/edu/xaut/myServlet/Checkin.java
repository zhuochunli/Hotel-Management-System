package src.edu.xaut.myServlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lyq.bean.resident;

import src.edu.xaut.sql.residentSql;
import src.edu.xaut.sql.roomSql;

/**
 * Servlet implementation class Checkin
 */
@WebServlet("/Checkin")
public class Checkin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Checkin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		try {
			request.setCharacterEncoding("UTF-8");
			resident resident = new com.lyq.bean.resident();
			String ID=request.getParameter("ID");
			String name=request.getParameter("name");
			String number=request.getParameter("number");
			String time=request.getParameter("time");
			resident.setID(ID);
			resident.setName(name);
			resident.setNumber(number);
			resident.setTime(time);
			residentSql uis = new residentSql();
			int row = uis.insert(resident);
			roomSql room=new roomSql();
			room.Update(number, "occupied");
			if(row > 0) {
				 request.getSession().setAttribute("r", resident);
		          //request.getRequestDispatcher("booksuccess.jsp").forward(request, response);
				 response.sendRedirect("booksuccess.jsp");
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
