package sale;

import java.io.Serializable;

import promotion.Promotion;

public class Price implements Serializable {
	private Flight flight;
	private Seat seats;
	private Promotion promo;
	private float amount;

	public Price() {
		super();
	}

	public Price(Flight flight, Seat seat, Promotion promo, float amount) {
		this.flight = flight;
		this.seats = seat;
		this.promo = promo;
		this.amount = amount;
	}

	public Flight getFlight() {
		return flight;
	}

	public void setFlight(Flight flight) {
		this.flight = flight;
	}

	public Seat getSeats() {
		return seats;
	}

	public void setSeats(Seat seat) {
		this.seats = seat;
	}

	public Promotion getPromo() {
		return promo;
	}

	public void setPromo(Promotion promo) {
		this.promo = promo;
	}

	public float getAmount() {
		return amount;
	}

	public void setAmount(float amount) {
		this.amount = amount;
	}

}
