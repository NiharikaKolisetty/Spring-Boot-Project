package com.jfsd.microservices.service;

import java.util.List;

import org.springframework.data.repository.query.Param;

import com.jfsd.microservices.model.Employee;
import com.jfsd.microservices.model.EmployeeLeaveForm;

public interface EmployeeService {
	
	public void registerEmployee(Employee employee);
	
	Employee checkemplogin(String username, String password);
	
	public void saveEmployeeLeave(EmployeeLeaveForm employeeLeaveForm);
	
	List<EmployeeLeaveForm> getLeaveHisByUsername(String username);
	
	public void cancelLeaveRequest(Long requestId);
	
	Long countApprovedLeavesForUser(String username);
	
    Long countCanceledLeaves(String username);
    
    Long countRejectedLeaves(String username);
}
