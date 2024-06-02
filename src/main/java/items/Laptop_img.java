package items;

public class Laptop_img {
	
	private int lap_img_ID;
	private int lapID;
	private String lap_img_path;
	
	public int getLap_img_ID() {
		return lap_img_ID;
	}
	public void setLap_img_ID(int lap_img_ID) {
		this.lap_img_ID = lap_img_ID;
	}
	public int getLapID() {
		return lapID;
	}
	public void setLapID(int lapID) {
		this.lapID = lapID;
	}
	public String getLap_img_path() {
		return lap_img_path;
	}
	public Laptop_img(int lap_img_ID, int lapID, String lap_img_path) {
		super();
		this.lap_img_ID = lap_img_ID;
		this.lapID = lapID;
		this.lap_img_path = lap_img_path;
	}
	public void setLap_img_path(String lap_img_path) {
		this.lap_img_path = lap_img_path;
	}
	
}
