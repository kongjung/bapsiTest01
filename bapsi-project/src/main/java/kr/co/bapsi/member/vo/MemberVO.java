package kr.co.bapsi.member.vo;

import java.util.List;

public class MemberVO {

	private int no;
	private String email;
	private String password;
	private String name;
	private String nickname;
	private String tel;
	private String age;
	private String comments;
	private String type;
	private int point;
	private String regDate;
	private List<Integer> noList;
	public MemberVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public List<Integer> getNoList() {
		return noList;
	}
	public void setNoList(List<Integer> noList) {
		this.noList = noList;
	}
	public MemberVO(int no, String email, String password, String name, String nickname, String tel, String age,
			String comments, String type, int point, String regDate, List<Integer> noList) {
		super();
		this.no = no;
		this.email = email;
		this.password = password;
		this.name = name;
		this.nickname = nickname;
		this.tel = tel;
		this.age = age;
		this.comments = comments;
		this.type = type;
		this.point = point;
		this.regDate = regDate;
		this.noList = noList;
	}
	@Override
	public String toString() {
		return "MemberVO [no=" + no + ", email=" + email + ", password=" + password + ", name=" + name + ", nickname="
				+ nickname + ", tel=" + tel + ", age=" + age + ", comments=" + comments + ", type=" + type + ", point="
				+ point + ", regDate=" + regDate + ", noList=" + noList + "]";
	}
		
}
