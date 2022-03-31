package models;

public class Address {
	
	private String street;
	private String city;

	public Address() {
		street="Не е зададен";
		city="Не е зададен";
	}

	public String getStreet() {
		return street;
	}

	public void setStreet(String street) {
		this.street = street;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}
}
