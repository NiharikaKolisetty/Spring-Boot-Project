package com.jfsd.microservices.service;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jfsd.microservices.model.AddDepartment;
import com.jfsd.microservices.model.AddLeaveType;
import com.jfsd.microservices.model.AddManager;
import com.jfsd.microservices.model.Admin;
import com.jfsd.microservices.model.EmployeeLeaveForm;
import com.jfsd.microservices.repository.AddDepartmentRepository;
import com.jfsd.microservices.repository.AddLeaveTypeRepository;
import com.jfsd.microservices.repository.AdminRepository;
import com.jfsd.microservices.repository.EmployeeLeaveFormRepository;
import com.jfsd.microservices.repository.ManagerRepository;

import jakarta.transaction.Transactional;

@Service
public class AdminServiceImpl implements AdminService{

	@Autowired
	private AdminRepository adminRepository;
	
	@Autowired 
	private AddDepartmentRepository addDepartmentRepository;
	
	@Autowired
	private AddLeaveTypeRepository addLeaveTypeRepository;
	
	@Autowired
	private ManagerRepository managerRepository;
	
	@Autowired
	private EmployeeLeaveFormRepository employeeLeaveFormRepository;
	
	
	@Override
	public Admin checkadminlogin(String username, String password) {
		// TODO Auto-generated method stub
		return adminRepository.checkadminlogin(username, password);
	}
	
	@Override
	public AddDepartment addDepartment(String departmentname, String departmentshortform, Date createdDate, String code) {
        AddDepartment department = new AddDepartment();
        department.setDepartmentname(departmentname);
        department.setDepartmentshortform(departmentshortform);
        department.setCreatedDate(createdDate);
        department.setCode(code);

        return addDepartmentRepository.save(department);
    }

	@Override
	public List<AddDepartment> getAllDepartments() {
	    return addDepartmentRepository.findAll();
	}


	@Override
	public AddLeaveType addLeaveType(String leavetype, String description, Date createdDate) {
	    AddLeaveType leavetype1 = new AddLeaveType();
	    leavetype1.setCreatedDate(createdDate);
	    leavetype1.setDescription(description);
	    leavetype1.setLeavetype(leavetype); 

	    return addLeaveTypeRepository.save(leavetype1);
	}

	@Override
	public List<AddLeaveType> getAllLeaveTypes() {
		return addLeaveTypeRepository.findAll();
	}

	@Override
	public void deleteDepartmentByCode(String code) {
		// TODO Auto-generated method stub
		
		AddDepartment department = addDepartmentRepository.findByCode(code);

	    if (department != null) {
	        // If the department exists, delete it
	        addDepartmentRepository.delete(department);
	    }
		
	}
	
	@Override
	public void deleteLeaveTypeById(Long leaveid) {
	    // Find the leave type by its ID
	    AddLeaveType leaveType = addLeaveTypeRepository.findById(leaveid).orElse(null);

	    if (leaveType != null) {
	        // If the leave type exists, delete it
	        addLeaveTypeRepository.delete(leaveType);
	    }
	}
	
	@Override
    public AddDepartment getDepartmentById(Long id) {
		 Optional<AddDepartment> department = addDepartmentRepository.findById(id);
		 if (department.isPresent()) {
	            return department.get();
	        } else {
	            return null; 
	        }
    }
	

	@Override
	public AddManager addManager(String managerid, String username, String password) {
		// TODO Auto-generated method stub
		AddManager manager = new AddManager();
		manager.setManagerid(managerid);
		manager.setUsername(username);
		manager.setPassword(password);
		
		return managerRepository.save(manager);
	}

	
	@Override
	public AddManager checkmanagerlogin(String username, String password) {
		// TODO Auto-generated method stub
		return managerRepository.checkmanagerlogin(username, password);
	}

	@Override
	public List<AddManager> getAllManagers() {
		// TODO Auto-generated method stub
		return managerRepository.findAll();
	}

	@Override
	public List<EmployeeLeaveForm> getApprovedLeaves() {
		// TODO Auto-generated method stub
		 return employeeLeaveFormRepository.findByApprovedTrue();
	}

	@Override
	public List<EmployeeLeaveForm> getRejectedLeaves() {
		// TODO Auto-generated method stub
		return employeeLeaveFormRepository.findByRejectedTrue();
	}

	@Override
	public List<EmployeeLeaveForm> getCanceledLeaves() {
		// TODO Auto-generated method stub
		return employeeLeaveFormRepository.findByCanceledTrue();
	}

	@Override
	public List<EmployeeLeaveForm> getAllLeaves() {
		// TODO Auto-generated method stub
		return employeeLeaveFormRepository.findAll();
	}

	@Override
	public long countApprovedLeaves() {
		// TODO Auto-generated method stub
		return employeeLeaveFormRepository.countByApproved();
	}

	@Override
	public long countRejectedLeaves() {
		// TODO Auto-generated method stub
		return employeeLeaveFormRepository.countByRejected();
	}

	@Override
	public long countCanceledLeaves() {
		// TODO Auto-generated method stub
		return employeeLeaveFormRepository.countByCanceled();
	}

	@Override
	public long countManagers() {
		// TODO Auto-generated method stub
		return adminRepository.countByManagers();
	}

	@Override
	public long countDepartments() {
		// TODO Auto-generated method stub
		return adminRepository.countByDepartments();
	}

	@Override
	public long countLeaveTypes() {
		// TODO Auto-generated method stub
		return adminRepository.countByLeaveTypes();
	}

	@Override
	public AddDepartment findByCode(String code) {
		// TODO Auto-generated method stub
		return addDepartmentRepository.findByCode(code);
	}

	@Override
	public AddDepartment updateDepartment(AddDepartment updatedDepartment) {
		// Fetch the existing department by code
        AddDepartment existingDepartment = addDepartmentRepository.findByCode(updatedDepartment.getCode());

        if (existingDepartment != null) {
            // Update the properties of the existing department with the values from the updated department
            existingDepartment.setDepartmentname(updatedDepartment.getDepartmentname());
            existingDepartment.setDepartmentshortform(updatedDepartment.getDepartmentshortform());
            

            // Save the updated department to the repository
            addDepartmentRepository.save(existingDepartment);

            return existingDepartment; // Return the updated department
        } else {
           
            return null;
        }
	}

	

	
	
}
