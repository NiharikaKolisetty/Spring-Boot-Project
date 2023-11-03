package com.jfsd.microservices.model;

import java.util.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="ADD_DEPARTMENT_TABLE")
public class AddDepartment {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	@Column(unique = true)
	private String departmentname;
	@Column(unique = true)
    private String departmentshortform;
    private Date createdDate;
    @Column(unique = true)
    private String code;
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getDepartmentname() {
		return departmentname;
	}

	public void setDepartmentname(String departmentname) {
		this.departmentname = departmentname;
	}

	public String getDepartmentshortform() {
		return departmentshortform;
	}

	public void setDepartmentshortform(String departmentshortform) {
		this.departmentshortform = departmentshortform;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String toString() {
		return "AddDepartment [departmentname, =" + departmentname + ", departmentshortform=" + departmentshortform + ",code=" + code + ",createdDate=" + createdDate + "]";
	}

}
