package com.jfsd.microservices.model;



import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Lob;
import jakarta.persistence.Table;

@Entity
@Table(name="EMP_REG_TABLE")
public class Employee {
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long empid;
	private String username;
	private String gender;
	private String dob;
	private String department;
	private double salary;
	private String email;
	private String password;
	private String contact;
//	@Lob
//    private byte[] data;
//	private String base64ImageData;
	public Long getEmpid() {
		return empid;
	}
	public void setEmpid(Long empid) {
		this.empid = empid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getDob() {
		return dob;
	}
	public void setDob(String dob) {
		this.dob = dob;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public double getSalary() {
		return salary;
	}
	public void setSalary(double salary) {
		this.salary = salary;
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
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
//	public byte[] getData() {
//		return data;
//	}
//	public void setData(byte[] data) {
//		this.data = data;
//	}
//	public String getBase64ImageData() {
//		return base64ImageData;
//	}
//	public void setBase64ImageData(String base64ImageData) {
//		this.base64ImageData = base64ImageData;
//	}
	
	

}
