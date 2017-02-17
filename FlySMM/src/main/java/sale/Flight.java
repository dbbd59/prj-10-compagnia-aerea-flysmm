package sale;

import java.io.Serializable;
import java.sql.Time;
import java.util.Date;
import booking.Book;
public class Flight {
	
	private Aircraft aircraft;
	private String idFlight;
	private Date departureDate;
	private Time departureTime;
	private Airport departureAirport;
	private Date arrivalDate;
	private Time arrivalTime;
	private Airport arrivalAirport;
  
	public Flight() {
	}

	public Flight(Aircraft aircraft, Time arrivalTime, Time departureTime, String idFlight, Date departureDate,
			Airport departureAirport, Date arrivalDate, Airport arrivalAirport) {
		this.aircraft = aircraft;
		this.idFlight = idFlight;
		this.departureDate = departureDate;
		this.departureAirport = departureAirport;
		this.arrivalDate = arrivalDate;
		this.arrivalAirport = arrivalAirport;
		this.departureTime = departureTime;
		this.arrivalTime = arrivalTime;
	}

	public Time getDepartureTime() {
		return departureTime;
	}

	public void setDepartureTime(Time departureTime) {
		this.departureTime = departureTime;
	}

	public Time getArrivalTime() {
		return arrivalTime;
	}

	public void setArrivalTime(Time arrivalTime) {
		this.arrivalTime = arrivalTime;
	}

	public Flight(String idFlight, Airport departureAirport, Airport arrivalAirport) {
		super();
		this.idFlight = idFlight;
		this.departureAirport = departureAirport;
		this.arrivalAirport = arrivalAirport;
	}

	public Aircraft getAircraft() {
		return aircraft;
	}

	public String getIdFlight() {
		return idFlight;
	}

	public Date getDepartureDate() {
		return departureDate;
	}

	public Airport getDepartureAirport() {
		return departureAirport;
	}

	public Date getArrivalDate() {
		return arrivalDate;
	}

	public Airport getArrivalAirport() {
		return arrivalAirport;
	}

	public void setAircraft(Aircraft aircraft) {
		this.aircraft = aircraft;

	public void setIdFlight(String idFlight) {
		this.idFlight = idFlight;
	}

	public void setDepartureDate(Date departureDate) {
		this.departureDate = departureDate;
	}

	public void setDepartureAirport(Airport departureAirport) {
		this.departureAirport = departureAirport;
	}

	public void setArrivalDate(Date arrivalDate) {
		this.arrivalDate = arrivalDate;
	}

	public void setArrivalAirport(Airport arrivalAirport) {
		this.arrivalAirport = arrivalAirport;
	}

}