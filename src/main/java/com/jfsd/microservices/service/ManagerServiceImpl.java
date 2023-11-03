package com.jfsd.microservices.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jfsd.microservices.model.EmployeeLeaveForm;
import com.jfsd.microservices.repository.EmployeeLeaveFormRepository;

@Service
public class ManagerServiceImpl implements ManagerService{

	@Autowired
	EmployeeLeaveFormRepository employeeLeaveFormRepository;
	
	@Override
	public List<EmployeeLeaveForm> getPendingLeaveRequests() {
		// TODO Auto-generated method stub
		 return employeeLeaveFormRepository.findByCanceledFalse();
	}

	@Override
	public EmployeeLeaveForm getLeaveRequestById(Long requestId) {
		// TODO Auto-generated method stub
		return employeeLeaveFormRepository.findById(requestId).orElse(null);
	}

	@Override
	public void updateLeaveRequest(EmployeeLeaveForm leaveRequest) {
	    // Perform validation if needed
	    employeeLeaveFormRepository.save(leaveRequest);
	}

}
