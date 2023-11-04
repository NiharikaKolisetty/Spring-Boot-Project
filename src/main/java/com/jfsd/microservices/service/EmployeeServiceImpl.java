	package com.jfsd.microservices.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.jfsd.microservices.model.Employee;
import com.jfsd.microservices.model.EmployeeLeaveForm;
import com.jfsd.microservices.repository.EmployeeLeaveFormRepository;
import com.jfsd.microservices.repository.EmployeeRepository;


@Service
public class EmployeeServiceImpl implements EmployeeService{
	
	@Autowired
	private JavaMailSender javaMailSender;
	
	@Autowired
	private EmployeeRepository employeeRepository;
	
	@Autowired
	private EmployeeLeaveFormRepository employeeLeaveFormRepository;

	@Override
	public void registerEmployee(Employee employee) {
		// TODO Auto-generated method stub
		employeeRepository.save(employee);
	}

	@Override
	public Employee checkemplogin(String username, String password) {
		// TODO Auto-generated method stub
		 return employeeRepository.checkemplogin(username, password);
	}

	@Override
	public void saveEmployeeLeave(EmployeeLeaveForm employeeLeaveForm) {
		// TODO Auto-generated method stub
		employeeLeaveFormRepository.save(employeeLeaveForm);
		
	}

	 @Override
	    public List<EmployeeLeaveForm> getLeaveHisByUsername(String username) {
	        return employeeLeaveFormRepository.findByUsername(username);
	    }

	@Override
	public void cancelLeaveRequest(Long requestId) {
		// TODO Auto-generated method stub
		Optional<EmployeeLeaveForm> leaveRequest = employeeLeaveFormRepository.findById(requestId);
        leaveRequest.ifPresent(request -> {
            request.setCanceled(true);
            employeeLeaveFormRepository.save(request);
        });
	}

	@Override
	public Long countApprovedLeavesForUser(String username) {
		// TODO Auto-generated method stub
		return employeeLeaveFormRepository.countApprovedLeaves(username);
	}

	@Override
	public Long countCanceledLeaves(String username) {
		// TODO Auto-generated method stub
		return employeeLeaveFormRepository.countCanceledLeaves(username);
	}

	@Override
	public Long countRejectedLeaves(String username) {
		// TODO Auto-generated method stub
		return employeeLeaveFormRepository.countRejectedLeaves(username);
	}

	@Override
	public void sendEmail(String to, String subject, String text) {
		// TODO Auto-generated method stub
		 SimpleMailMessage message = new SimpleMailMessage();
	        message.setTo(to);
	        message.setSubject(subject);
	        message.setText(text);

	        javaMailSender.send(message);
		
	}

//	@Override
//	public Employee getEmployeeProfile(Long empid) {
//		// Retrieve the employee's profile from the repository by ID
//	    Optional<Employee> optionalEmployee = employeeRepository.findById(empid);
//
//	    if (optionalEmployee.isPresent()) {
//	        Employee employee = optionalEmployee.get();
//	        // You may need to convert the image data to Base64 here as well, as shown in the controller
//	        return employee;
//	    } else {
//	        return null;
//	    }
//	}

	

	
	
}
