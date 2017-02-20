package frontController;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;

import org.hibernate.Session;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import customer.Customer;
import sale.Address;
import sale.Flight;
import servlets.HibernateProxyTypeAdapter;
import servlets.SessionFactorySingleton;

public class NewCustomerCommand extends FrontCommand {

	@Override
	public void dispatch() throws ServletException, IOException {
		if (caller.equals("GDF")) {
			// String id = request.getParameter("id");
			// long pollo = Long.valueOf(id).longValue();
			String name = request.getParameter("name");
			String surname = request.getParameter("surname");
			String email = request.getParameter("email");
			String via = request.getParameter("street");
			String ncivic = request.getParameter("Street_number");
			String capTemp =request.getParameter("cap");
			int cap = Integer.valueOf(capTemp).intValue();
			String city = request.getParameter("city");
			String country = request.getParameter("country");
			String psw = request.getParameter("password");
			String tel = request.getParameter("phoneNumber");
			String dataN = request.getParameter("dateOfBirth");
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date startDate;
			try {
				startDate = sdf.parse(dataN);
				Address address = new Address(1,via,ncivic,cap,city,country);
				writeAddress(address);
				Customer c = new Customer(1, name, surname, address, email, psw, tel, startDate);				
				writeCustomer(c);
				RequestDispatcher dispatcher = context.getRequestDispatcher("/loginPage.html");
				dispatcher.forward(request, response);

			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
	}

	public static void writeCustomer(Customer c) {
		Session session = SessionFactorySingleton.getSessionFactory().getCurrentSession();
		session.getTransaction().begin();
		session.save(c);
		session.getTransaction().commit();
	}
	public static void writeAddress(Address c) {
		Session session = SessionFactorySingleton.getSessionFactory().getCurrentSession();
		session.getTransaction().begin();
		session.save(c);
		session.getTransaction().commit();
	}
}