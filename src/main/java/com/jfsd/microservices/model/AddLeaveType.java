package com.jfsd.microservices.model;

import java.util.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;


@Entity
@Table(name="ADD_LEAVE_TYPE")
public class AddLeaveType {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long leaveid;
	
	private String leavetype;
	
	@Column(length = 200)
	private String description;
	
	private Date createdDate;

	public Long getLeaveid() {
		return leaveid;
	}

	public void setLeaveid(Long leaveid) {
		this.leaveid = leaveid;
	}

	public String getLeavetype() {
		return leavetype;
	}

	public void setLeavetype(String leavetype) {
		this.leavetype = leavetype;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	

}
