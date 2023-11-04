package com.jfsd.microservices.controller;



import java.io.IOException;
import java.util.Base64;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.jfsd.microservices.model.AddDepartment;
import com.jfsd.microservices.model.AddLeaveType;
import com.jfsd.microservices.model.Employee;
import com.jfsd.microservices.model.EmployeeLeaveForm;
import com.jfsd.microservices.repository.EmployeeRepository;
import com.jfsd.microservices.service.AdminService;
import com.jfsd.microservices.service.EmployeeService;

import jakarta.servlet.http.HttpServletRequest;


@Controller
@RequestMapping("employee")
public class EmployeeController {
	
	
	
	
	 @Autowired 
	 private AdminService adminService;
	 
	 @Autowired 
	 private EmployeeService employeeService;
	 
	   @GetMapping("/")
	   @ResponseBody
	   public String employee()
	   {
		   return "Employee Microservice";
	   }
	   
	   @GetMapping("empreg")
		public ModelAndView register() {
		   ModelAndView mav = new ModelAndView("empreg");
		    List<AddDepartment> departments = adminService.getAllDepartments();
		    mav.addObject("departments", departments);
		    return mav;
		}
	   
	   @GetMapping("emplogin")
		public ModelAndView login() {
			ModelAndView mav= new ModelAndView();
			mav.setViewName("emplogin");
			return mav;
		}
	   
	   @GetMapping("empnav")
		public ModelAndView empnav() {
			ModelAndView mav= new ModelAndView();
			mav.setViewName("empnav");
			return mav;
		}
	   
	   @GetMapping("empdashboard")
	   public ModelAndView empdashboard(HttpServletRequest request) {
	       ModelAndView mav = new ModelAndView("empdashboard");
	       String loggedInUsername = (String) request.getSession().getAttribute("loggedInUsername");
	       Long approvedLeavesCount = employeeService.countApprovedLeavesForUser(loggedInUsername);
	       Long canceledLeavesCount = employeeService.countCanceledLeaves(loggedInUsername);
	       Long rejectedLeavesCount = employeeService.countRejectedLeaves(loggedInUsername);
	       mav.addObject("loggedInUsername", loggedInUsername);
	       mav.addObject("approvedLeavesCount", approvedLeavesCount);
	       mav.addObject("canceledLeavesCount", canceledLeavesCount);
	       mav.addObject("rejectedLeavesCount", rejectedLeavesCount);
	       return mav;
	   }

	   @GetMapping("empleaveform")
		public ModelAndView empleaveform() {
		   ModelAndView mav = new ModelAndView("empleaveform");
	       List<AddLeaveType> leavetypes = adminService.getAllLeaveTypes();
	       mav.addObject("leavetypes", leavetypes);
	       return mav;
		}
	   
	   @GetMapping("emphistory")
	   public ModelAndView emphistory(HttpServletRequest request) {
	       ModelAndView mav = new ModelAndView("emphistory");

	       String loggedInUsername = (String) request.getSession().getAttribute("loggedInUsername");

	       if (loggedInUsername != null) {
	           mav.addObject("loggedInUsername", loggedInUsername);

	           // Assuming you have a method to retrieve leave history by username
	           List<EmployeeLeaveForm> leaveRequests = employeeService.getLeaveHisByUsername(loggedInUsername);
	           for (EmployeeLeaveForm leaveRequest : leaveRequests) {
	               if (leaveRequest.isCanceled()) {
	                   leaveRequest.setStatus("canceled");
	               } else if(leaveRequest.isApproved()){
	                   leaveRequest.setStatus("approved");
	               } else if(leaveRequest.isRejected()){
	                   leaveRequest.setStatus("rejected");
	               }
	               else {
	            	   leaveRequest.setStatus("pending");
	               }
	           }
	           mav.addObject("leaveRequests", leaveRequests);

	       } else {
	           // Handle the case when there is no authenticated user
	           mav.addObject("error", "You are not logged in.");
	       }

	       return mav;
	   }
   
	   @GetMapping("cancelLeaveRequest")
	   public ModelAndView cancelLeaveRequest(@RequestParam Long requestId) {
	       employeeService.cancelLeaveRequest(requestId);
	       ModelAndView mav = new ModelAndView("redirect:/employee/emphistory");
	       mav.addObject("message", "canceled.");
	       return mav;
	   }

	   @GetMapping("empprofile")
		public ModelAndView empprofile() {
			ModelAndView mav= new ModelAndView();
			mav.setViewName("empprofile");
			return mav;
		}

//	   @GetMapping("empprofile")
//	   public ModelAndView empprofile(@RequestParam("empid") Long empid) {
//	       ModelAndView mav = new ModelAndView("empprofile");
//	       mav.addObject("employee", employee);
//	       // Retrieve the employee's profile, including the image data
//	       Employee employee = employeeService.getEmployeeProfile(empid);
//
//	       if (employee != null) {
//	           // You may need to convert the image data to a suitable format
//	           // For example, if the image data is stored as bytes, you can convert it to Base64
//	           byte[] imageData = employee.getData();
//	           if (imageData != null) {
//	               String base64Image = Base64.getEncoder().encodeToString(imageData);
//	               employee.setBase64ImageData(base64Image);
//	           }
//	           
//	       }
//
//	       return mav;
//	   }
//	   
	   @PostMapping("register")
	   public ModelAndView registerEmployee(HttpServletRequest request) {
	       String username = request.getParameter("username");
	       String gender = request.getParameter("gender");
	       String dob = request.getParameter("dob");
	       String department = request.getParameter("department");
	       double salary = Double.parseDouble(request.getParameter("salary"));
	       String email = request.getParameter("email");
	       String password = request.getParameter("password");
	       String contact = request.getParameter("contact");

	       Employee employee = new Employee();
	       employee.setUsername(username);
	       employee.setGender(gender);
	       employee.setDob(dob);
	       employee.setDepartment(department);
	       employee.setSalary(salary);
	       employee.setEmail(email);
	       employee.setPassword(password);
	       employee.setContact(contact);

	       // Register the employee
	       employeeService.registerEmployee(employee);
	       
//	       // Handle image upload
//	       if (!file.isEmpty()) {
//	           try {
//	               // Set the image data to the Employee entity
//	               employee.setData(file.getBytes());
//	           } catch (IOException e) {
//	               e.printStackTrace();
//	               // Handle the exception if necessary
//	           }
//	       }

	       // Send an email to the specified email address
	       String subject = "Employee Registration Confirmation";
	       String text = "Thank you for registering as an employee. Your registration is successful.";
	       employeeService.sendEmail(email, subject, text);

	       ModelAndView modelAndView = new ModelAndView("empreg");
	       modelAndView.addObject("message", "Employee registration successful.");
	       return modelAndView;
	   }
	   
	  

	@PostMapping("checkemplogin")
	   public ModelAndView checkemplogin(String username, String password, HttpServletRequest request) {
	       Employee employee = employeeService.checkemplogin(username, password);
	       ModelAndView mav = new ModelAndView();

	       if (employee != null) {
	           request.getSession().setAttribute("loggedInUsername", username);
	           mav.setViewName("redirect:/employee/empdashboard");
	       } else {
	           mav.setViewName("emplogin");
	           mav.addObject("error", "Invalid username or password");
	       }
	       return mav;
	   }
	   
	   
	   @PostMapping("submitLeaveForm")
	    public ModelAndView submitLeaveForm(@ModelAttribute EmployeeLeaveForm employeeLeaveForm) {
	        employeeService.saveEmployeeLeave(employeeLeaveForm);
	        ModelAndView mav = new ModelAndView("empleaveform");
	        mav.addObject("message", "Leave request submitted successfully");
	        mav.addObject("goback","Go Back");
	        return mav;
	    }
	   
	  
	   
}