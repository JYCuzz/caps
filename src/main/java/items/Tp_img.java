package items;

public class Tp_img {
	
	private int tp_img_ID;
	private int tpID;
	private String tp_img_path;
	
	public int getTp_img_ID() {
		return tp_img_ID;
	}
	public void setTp_img_ID(int tp_img_ID) {
		this.tp_img_ID = tp_img_ID;
	}
	public int getTpID() {
		return tpID;
	}
	public void setTpID(int tpID) {
		this.tpID = tpID;
	}
	public String getTp_img_path() {
		return tp_img_path;
	}
	public void setTp_img_path(String tp_img_path) {
		this.tp_img_path = tp_img_path;
	}
	public Tp_img(int tp_img_ID, int tpID, String tp_img_path) {
		super();
		this.tp_img_ID = tp_img_ID;
		this.tpID = tpID;
		this.tp_img_path = tp_img_path;
	}
	
}
