package com.jfsd.microservices.service;

import java.util.Date;
import java.util.List;

import com.jfsd.microservices.model.AddDepartment;
import com.jfsd.microservices.model.AddLeaveType;
import com.jfsd.microservices.model.AddManager;
import com.jfsd.microservices.model.Admin;
import com.jfsd.microservices.model.EmployeeLeaveForm;


public interface AdminService {
	
	 public Admin checkadminlogin(String username,String password);
	 
	 public AddDepartment addDepartment(String departmentname, String departmentshortform, Date createdDate, String code);
	 
	 public List<AddDepartment> getAllDepartments();
	 
	 public List<AddManager> getAllManagers();
	 
	 public AddLeaveType addLeaveType(String leavetype,String description,Date createdDate);
	 
	 public List<AddLeaveType> getAllLeaveTypes();
	 
	 void deleteDepartmentByCode(String code);

	 void deleteLeaveTypeById(Long leaveid);
	 
	 public AddDepartment getDepartmentById(Long id);

	 
	 
	 public AddManager addManager(String managerid, String username, String password);
	 
	 public AddManager checkmanagerlogin(String username, String password);
	 
	 public List<EmployeeLeaveForm> getApprovedLeaves();
	 
	 public List<EmployeeLeaveForm> getRejectedLeaves();
	 
	 public List<EmployeeLeaveForm> getCanceledLeaves();
	 
	 public List<EmployeeLeaveForm> getAllLeaves();
	 
	 public long countApprovedLeaves();
	 
	 public long countRejectedLeaves();
	 
	 public long countCanceledLeaves();
	 
	 public long countManagers();
	 
	 public long countDepartments();
	 
	 public long countLeaveTypes();

	 public AddDepartment findByCode(String code);
	 
	 public AddDepartment updateDepartment(AddDepartment updatedDepartment);

}
