package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import frontController.FrontCommand;

public class GetUsernamePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public GetUsernamePassword() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.getWriter().append(request.getParameter("command"));

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		FrontCommand command = FrontCommand.getCommand(request, response);

		if (command != null) {
			command.init(getServletContext(), "GDF", request, response);
			command.dispatch();

		} else {
			System.out.println("CommandNotFound");
		}
	}

}
