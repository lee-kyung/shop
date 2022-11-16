package kr.co.shop.vo;

public class GumaeVO {
   private int id,su,bae_id,chong,sudan,bank,card,gigan,phone,state;
   private String pcode,userid,writeday;
   
   private String jumuncode;
   
   // 1개 이상의 정보를 구분자로 분리해서 저장하기 => su(각 상품마다의 다른 개수), chong(각 상품마다의 개수를 포함한 총 가격)
   private String su_imsi, chong_imsi;
   
   // wish와 cart에서 온 것 구분하는 필드
   private int gchk;
   
   // product 테이블의 필드 (mypagemapper _ myjumun)
   private String pimg, title;
   
   // 상품평 사용 여부의 판단 
   private int hugi;
   

public int getHugi() {
	return hugi;
}
public void setHugi(int hugi) {
	this.hugi = hugi;
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
public int getGchk() {
	return gchk;
}
public void setGchk(int gchk) {
	this.gchk = gchk;
}
public String getSu_imsi() {
	return su_imsi;
}
public void setSu_imsi(String su_imsi) {
	this.su_imsi = su_imsi;
}
public String getChong_imsi() {
	return chong_imsi;
}
public void setChong_imsi(String chong_imsi) {
	this.chong_imsi = chong_imsi;
}
public String getJumuncode() {
	return jumuncode;
}
public void setJumuncode(String jumuncode) {
	this.jumuncode = jumuncode;
}
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
   
   
}
