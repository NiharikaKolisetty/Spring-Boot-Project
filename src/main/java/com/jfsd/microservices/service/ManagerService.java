package com.jfsd.microservices.service;

import java.util.List;

import com.jfsd.microservices.model.EmployeeLeaveForm;

public interface ManagerService {
	List<EmployeeLeaveForm> getPendingLeaveRequests();

	EmployeeLeaveForm getLeaveRequestById(Long requestId);

	void updateLeaveRequest(EmployeeLeaveForm leaveRequest);
}
