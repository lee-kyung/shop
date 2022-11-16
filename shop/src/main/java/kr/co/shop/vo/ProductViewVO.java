package kr.co.shop.vo;

public class ProductViewVO {

	// 구매 테이블											// 통신사
	private int id,su,bae_id,chong,sudan,bank,card,gigan,phone,state;
	private String pcode,userid,writeday;
	   
	private String jumuncode;
	
	// 배송테이블
	private int price;
	private String pimg, title;
	
	// 상품테이블
	private int chuga;	// 배송지 전화
	private String name, hphone, juso, juso_etc;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getSu() {
		return su;
	}
	public void setSu(int su) {
		this.su = su;
	}
	public int getBae_id() {
		return bae_id;
	}
	public void setBae_id(int bae_id) {
		this.bae_id = bae_id;
	}
	public int getChong() {
		return chong;
	}
	public void setChong(int chong) {
		this.chong = chong;
	}
	public int getSudan() {
		return sudan;
	}
	public void setSudan(int sudan) {
		this.sudan = sudan;
	}
	public int getBank() {
		return bank;
	}
	public void setBank(int bank) {
		this.bank = bank;
	}
	public int getCard() {
		return card;
	}
	public void setCard(int card) {
		this.card = card;
	}
	public int getGigan() {
		return gigan;
	}
	public void setGigan(int gigan) {
		this.gigan = gigan;
	}
	public int getPhone() {
		return phone;
	}
	public void setPhone(int phone) {
		this.phone = phone;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public String getPcode() {
		return pcode;
	}
	public void setPcode(String pcode) {
		this.pcode = pcode;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getWriteday() {
		return writeday;
	}
	public void setWriteday(String writeday) {
		this.writeday = writeday;
	}
	public String getJumuncode() {
		return jumuncode;
	}
	public void setJumuncode(String jumuncode) {
		this.jumuncode = jumuncode;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getPimg() {
		return pimg;
	}
	public void setPimg(String pimg) {
		this.pimg = pimg;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getChuga() {
		return chuga;
	}
	public void setChuga(int chuga) {
		this.chuga = chuga;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getHphone() {
		return hphone;
	}
	public void setHphone(String hphone) {
		this.hphone = hphone;
	}
	public String getJuso() {
		return juso;
	}
	public void setJuso(String juso) {
		this.juso = juso;
	}
	public String getJuso_etc() {
		return juso_etc;
	}
	public void setJuso_etc(String juso_etc) {
		this.juso_etc = juso_etc;
	}
	
	
}
