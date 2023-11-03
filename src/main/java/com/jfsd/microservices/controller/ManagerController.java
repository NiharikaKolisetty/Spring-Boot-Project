package com.jfsd.microservices.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jfsd.microservices.model.AddManager;
import com.jfsd.microservices.model.Admin;
import com.jfsd.microservices.model.EmployeeLeaveForm;
import com.jfsd.microservices.service.AdminService;
import com.jfsd.microservices.service.ManagerService;

import jakarta.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("manager")
public class ManagerController {
	
	@Autowired 
	 private AdminService adminService;
	
	 @Autowired
	private ManagerService managerService;
	 
	
	   @GetMapping("/")
	   @ResponseBody
	   public String admin()
	   {
		   return "Manager Microservice";
	   }
	   
	   @GetMapping("managerlogin")
	   public ModelAndView managerlogin() {
		   ModelAndView mav = new ModelAndView();
		   mav.setViewName("managerlogin");
		   return mav;
	   }
	   
	   @GetMapping("managernav")
	   public ModelAndView managernav() {
		   ModelAndView mav = new ModelAndView();
		   mav.setViewName("managernav");
		   return mav;
	   }
	   
	   @PostMapping("checkmanagerlogin")
	   public ModelAndView checkmanagerlogin(HttpServletRequest request) {
	       ModelAndView mv = new ModelAndView();

	       String username = request.getParameter("username");
	       String password = request.getParameter("password");

	       AddManager m = adminService.checkmanagerlogin(username, password);

	       if (m != null) {
	           // Login successful, redirect to managerdash
	    	   mv.setViewName("redirect:/manager/managerdash");
	       } else {
	           // Login failed, redirect back to the managerlogin page with an error message
	           mv.setViewName("managerlogin");
	           mv.addObject("errorMessage", "Login Failed. Incorrect username or password.");
	       }

	       return mv;
	   }

	   
	   @GetMapping("managerdash")
	   public ModelAndView managerdash() {
		   ModelAndView mav = new ModelAndView("managerdash");
		   List<EmployeeLeaveForm> pendingLeaveRequests = managerService.getPendingLeaveRequests();
	        mav.addObject("pendingLeaveRequests", pendingLeaveRequests);

	        return mav;
	   }
	   
	   @GetMapping("approveLeaveRequest")
	   public ModelAndView approveLeaveRequest(@RequestParam Long requestId) {
	       EmployeeLeaveForm leaveRequest = managerService.getLeaveRequestById(requestId);
	       if (leaveRequest != null) {
	           leaveRequest.setApproved(true);
	           leaveRequest.setStatus("Approved");
	           managerService.updateLeaveRequest(leaveRequest);
	       }
	       return new ModelAndView("redirect:/manager/managerdash");
	   }
	   
	   @GetMapping("rejectLeaveRequest")
	   public ModelAndView rejectLeaveRequest(@RequestParam Long requestId) {
	       EmployeeLeaveForm leaveRequest = managerService.getLeaveRequestById(requestId);
	       if (leaveRequest != null) {
	           leaveRequest.setRejected(true);
	           leaveRequest.setStatus("Rejected");
	           managerService.updateLeaveRequest(leaveRequest);
	       }
	       return new ModelAndView("redirect:/manager/managerdash");
	   }


	  
}
