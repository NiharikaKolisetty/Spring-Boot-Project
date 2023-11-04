package com.jfsd.microservices.controller;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jfsd.microservices.model.AddDepartment;
import com.jfsd.microservices.model.AddLeaveType;
import com.jfsd.microservices.model.AddManager;
import com.jfsd.microservices.model.Admin;
import com.jfsd.microservices.model.EmployeeLeaveForm;
import com.jfsd.microservices.service.AdminService;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("admin")
public class AdminController {
	
	 @Autowired 
	 private AdminService adminService;
	 
	
	
	   @GetMapping("/")
	   @ResponseBody
	   public String admin()
	   {
		   return "Admin Microservice";
	   }
	   
	   @GetMapping("adminnav")
	   public ModelAndView adminnav() {
		   ModelAndView mav = new ModelAndView();
		   mav.setViewName("adminnav");
		   return mav;
	   }
	   
	   @GetMapping("adminlogin")
	   public ModelAndView adminlogin() {
		   ModelAndView mav = new ModelAndView();
		   mav.setViewName("adminlogin");
		   return mav;
	   }
	   
	   @GetMapping("admindash")
	   public ModelAndView admindash() {
		   ModelAndView mav = new ModelAndView("admindash");
		   Long countApprovedLeaves = adminService.countApprovedLeaves();
		   Long countRejectedLeaves = adminService.countRejectedLeaves();
		   Long countCanceledLeaves = adminService.countCanceledLeaves();
		   Long noofmanagers = adminService.countManagers();
		   Long countDepartments = adminService.countDepartments();
		   Long countLeaveTypes = adminService.countLeaveTypes();
		   mav.addObject("countApprovedLeaves", countApprovedLeaves);
		   mav.addObject("countRejectedLeaves", countRejectedLeaves);
		   mav.addObject("countCanceledLeaves", countCanceledLeaves);
		   mav.addObject("noofmanagers", noofmanagers);
		   mav.addObject("countDepartments", countDepartments);
		   mav.addObject("countLeaveTypes", countLeaveTypes);
		   return mav;
	   }
	   
	   @GetMapping("adminmanagersec")
	   public ModelAndView adminmanagersec() {
		   ModelAndView mav = new ModelAndView("adminmanagersec");
		   List<AddManager> managers = adminService.getAllManagers();
	        mav.addObject("managers", managers);
		   return mav;
	   }
	   
	   @GetMapping("admindeptsec")
	   public ModelAndView admindeptsec() {
		   ModelAndView mav = new ModelAndView("admindeptsec");
	        List<AddDepartment> departments = adminService.getAllDepartments();
	        mav.addObject("departments", departments);
	        return mav;
		  
	   }
	   
	   @GetMapping("adminleavetypesec")
	   public ModelAndView adminleavetypesec() {
	       ModelAndView mav = new ModelAndView("adminleavetypesec");
	       List<AddLeaveType> leavetypes = adminService.getAllLeaveTypes();
	       mav.addObject("leavetypes", leavetypes);
	       return mav;
	   }
	   
	   @GetMapping("adminapproved")
	   public ModelAndView adminapproved() {
		   ModelAndView mav = new ModelAndView("adminapproved");
		   List<EmployeeLeaveForm> approvedLeaves = adminService.getApprovedLeaves();
		   mav.addObject("approvedLeaves", approvedLeaves);
		   return mav;
	   }
	   
	   @GetMapping("adminrejected")
	   public ModelAndView adminrejected() {
		   ModelAndView mav = new ModelAndView("adminrejected");
		   List<EmployeeLeaveForm> rejectedLeaves = adminService.getRejectedLeaves();
		   mav.addObject("rejectedLeaves", rejectedLeaves);
		   return mav;
	   }
	   
	   @GetMapping("admincanceled")
	   public ModelAndView adminpending() {
		   ModelAndView mav = new ModelAndView("admincanceled");
		   List<EmployeeLeaveForm> canceledLeaves = adminService.getCanceledLeaves();
		   mav.addObject("canceledLeaves", canceledLeaves);
		   return mav;
	   }
	   
	   @GetMapping("adminleavehis")
	   public ModelAndView adminleavehis() {
		   ModelAndView mav = new ModelAndView("adminleavehis");
		   List<EmployeeLeaveForm> leaveHistory = adminService.getAllLeaves();
		   mav.addObject("leaveHistory", leaveHistory);
		   return mav;
	   }
	   
//	   @GetMapping("adminadddept")
//	   public ModelAndView adminadddept() {
//		   ModelAndView mav = new ModelAndView();
//		   mav.setViewName("adminadddept");
//		   return mav;
//	   }
	   
	   @GetMapping("adminaddemp")
	   public ModelAndView adminaddemp() {
		   ModelAndView mav = new ModelAndView();
		   mav.setViewName("adminaddemp");
		   return mav;
	   }
	   
	   @GetMapping("adminaddmanager")
	   public ModelAndView adminaddmanager() {
		   ModelAndView mav = new ModelAndView();
		   mav.setViewName("adminaddmanager");
		   return mav;
	   }
	   
	   @GetMapping("adminaddleave")
	   public ModelAndView adminaddleave() {
		   ModelAndView mav = new ModelAndView();
		   mav.setViewName("adminaddleave");
		   return mav;
	   }
	   
	   
	   @PostMapping("checkadminlogin") 
	    public ModelAndView checkadminlogin(HttpServletRequest request)
	    { 
	     ModelAndView mv =new ModelAndView(); 
	      
	     String username = request.getParameter("username"); 
	     String password = request.getParameter("password"); 
	      
	     
		Admin a=adminService.checkadminlogin(username, password); 
	     if(a!=null)
	     { 
	    	 mv.setViewName("redirect:/admin/admindash");
	     } 
	     else {
	         mv.setViewName("adminlogin");
	         mv.addObject("errorMessage", "Login Failed. Incorrect username or password.");
	     }
	     return mv; 
	    } 
	   
	   @GetMapping("adminadddept")
	    public ModelAndView adminadddept() {
	        ModelAndView mav = new ModelAndView("adminadddept");
	        mav.addObject("successMessage", null);
	        mav.addObject("errorMessage", null);
	        return mav;
	    }

	   @PostMapping("addDepartment")
	   public ModelAndView addDepartment(HttpServletRequest request) {
	       ModelAndView mav = new ModelAndView("adminadddept");

	       String departmentname = request.getParameter("departmentname");
	       String departmentshortform = request.getParameter("departmentshortform");
	       String code = request.getParameter("code");

	       Date createdDate = new Date();

	       
	       AddDepartment addedDepartment = adminService.addDepartment(departmentname, departmentshortform, createdDate, code);

	       if (addedDepartment != null) {
	           mav.addObject("successMessage", "Department added successfully.");
	           mav.addObject("goBackLink", "admindeptsec");
	          
	       } else {
	           mav.addObject("errorMessage", "Failed to add the department.");
	           
	       }

	       return mav;
	   }

	   @PostMapping("addManager")
	   public ModelAndView addManager(HttpServletRequest request) {
		   
		   ModelAndView mav = new ModelAndView("adminaddmanager");
	       String managerid = request.getParameter("managerid");
	       String username = request.getParameter("username");
	       String password = request.getParameter("password");
	       AddManager addedManager = adminService.addManager(managerid, username, password);
	       if (addedManager != null) {
	           mav.addObject("successMessage", "Manager added successfully.");
	           mav.addObject("goback","Go Back");
	       } else {
	           mav.addObject("errorMessage", "Failed to add the manager.");
	           
	       }
	       return mav;
	   }
	   
	   @PostMapping("addLeaveType")
	   public ModelAndView addLeaveType(HttpServletRequest request) {
	       ModelAndView mav = new ModelAndView("adminaddleave"); // Assuming you want to return to the "adminaddleave" page

	       String leavetype = request.getParameter("leavetype");
	       String description = request.getParameter("description");

	       Date createdDate = new Date();

	       AddLeaveType addedLeaveType = adminService.addLeaveType(leavetype, description, createdDate);

	       if (addedLeaveType != null) {
	           mav.addObject("successMessage", "Leave type added successfully.");
	           mav.addObject("goBackLink", "adminaddleave");
	       } else {
	           mav.addObject("errorMessage", "Failed to add the leave type.");
	       }

	       return mav;
	   }
	   
	   @GetMapping("deleteDepartmentByCode/{code}")
	   public String deleteDepartmentByCode(@PathVariable("code") String code) {
	       adminService.deleteDepartmentByCode(code);
	       return "redirect:/admin/admindeptsec";
	   }
	   
	   @GetMapping("deleteLeaveType/{leaveid}")
	   public String deleteLeaveType(@PathVariable("leaveid") Long leaveid) {
	       adminService.deleteLeaveTypeById(leaveid);
	       return "redirect:/admin/adminleavetypesec";
	   }
	   
	   @GetMapping("updateLeaveType/{leaveid}")
	   public ModelAndView showUpdateLeaveTypeForm(@PathVariable Long leaveid) {
	       ModelAndView mav = new ModelAndView("updateLeaveType"); // Specify the name of your update form JSP
	       AddLeaveType leavetype1 = adminService.findByLeaveid(leaveid);
	       mav.addObject("leavetype1", leavetype1); // Add leavetype1 to the model
	       return mav;
	   }

	   @PostMapping("updateLeaveType")
	   public ModelAndView updateLeaveType(@ModelAttribute AddLeaveType updateLeaveType) {
	       adminService.updateLeaveType(updateLeaveType);
	       ModelAndView mav = new ModelAndView("redirect:/admin/adminleavetypesec");
	       return mav;
	   }
	   
	   
	   
	   @GetMapping("updateDepartment/{code}")
	   public ModelAndView showUpdateDepartmentForm(@PathVariable String code) {
	       ModelAndView mav = new ModelAndView("updateDepartment"); // Specify the name of your update form JSP
	       AddDepartment department = adminService.findByCode(code);
	       mav.addObject("department", department);
	       return mav;
	   }
	   
	   @PostMapping("updateDepartment")
	   public ModelAndView updateDepartment(@ModelAttribute AddDepartment updatedDepartment) {
	       adminService.updateDepartment(updatedDepartment);
	       ModelAndView mav = new ModelAndView("redirect:/admin/admindeptsec"); // Specify the URL to redirect to
	       return mav;
	   }
	   
	   


}
