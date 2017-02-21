package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;

import frontController.FrontCommand;
import frontController.UnknownCommand;

/**
 * Servlet implementation class GetDepartureFlight
 */
public class GetDepartureFlight extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String RDATE = "rDate";
	private static final String DDATE = "dDate";
	private static final String PASSENGERS = "passengers";
	
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public GetDepartureFlight() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.getWriter().append(request.getParameter("command"));
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		FrontCommand command = getCommand(request);
		System.out.println(request.getParameter(RDATE));
		System.out.println(request.getParameter(PASSENGERS));
		request.getSession().setAttribute(PASSENGERS, request.getParameter(PASSENGERS));

		request.getSession().setAttribute(DDATE, request.getParameter(DDATE));
		request.getSession().setAttribute(RDATE, request.getParameter(RDATE));
		if (command != null) {
			command.init(getServletContext(), "GDF", request, response);
			command.dispatch();
		}
		else {
			System.out.println("CommandNotFound");
		}
	}

	private FrontCommand getCommand(HttpServletRequest request) {
		FrontCommand result = null;
		try {
			return (FrontCommand) getCommandClass(request).newInstance();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	private Class getCommandClass(HttpServletRequest request) {
		Class result;
		final String commandClassName = "frontController." + (String) request.getParameter("command") + "Command";
		try {
			result = Class.forName(commandClassName);
		} catch (ClassNotFoundException e) {
			result = UnknownCommand.class;
		}
		return result;
	}

}
