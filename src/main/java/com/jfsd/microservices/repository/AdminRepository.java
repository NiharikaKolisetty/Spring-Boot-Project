package com.jfsd.microservices.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.jfsd.microservices.model.Admin;

@Repository
public interface AdminRepository extends JpaRepository<Admin, Integer> {
	
	@Query("select a from Admin a where a.username=?1 and a.password=?2")
	public Admin checkadminlogin(String username,String password);
	
	
	@Query(value = "SELECT COUNT(*) FROM manager_creds", nativeQuery = true)
	Long countByManagers();
	
	@Query(value = "SELECT COUNT(*) FROM add_department_table", nativeQuery = true)
	Long countByDepartments();
	
	@Query(value = "SELECT COUNT(*) FROM add_leave_type", nativeQuery = true)
	Long countByLeaveTypes();
}
