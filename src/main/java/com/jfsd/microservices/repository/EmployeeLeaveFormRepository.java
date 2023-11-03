package com.jfsd.microservices.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.jfsd.microservices.model.EmployeeLeaveForm;

@Repository
public interface EmployeeLeaveFormRepository extends JpaRepository<EmployeeLeaveForm, Long>{

	List<EmployeeLeaveForm> findByUsername(String username);
	
	List<EmployeeLeaveForm> findByCanceledFalse();
	
	@Query(value = "SELECT COUNT(*) FROM LEAVE_FORM_DATA WHERE approved = true AND username = :username", nativeQuery = true)
	Long countApprovedLeaves(@Param("username") String username);

	@Query(value = "SELECT COUNT(*) FROM LEAVE_FORM_DATA WHERE canceled = true AND username = :username", nativeQuery = true)
	Long countCanceledLeaves(@Param("username") String username);
	
	@Query(value = "SELECT COUNT(*) FROM LEAVE_FORM_DATA WHERE rejected = true AND username = :username", nativeQuery = true)
	Long countRejectedLeaves(@Param("username") String username);

	List<EmployeeLeaveForm> findByApprovedTrue();
	
	List<EmployeeLeaveForm> findByRejectedTrue();

	List<EmployeeLeaveForm> findByCanceledTrue();
	
	List<EmployeeLeaveForm> findAll();
	
	@Query(value = "SELECT COUNT(*) FROM LEAVE_FORM_DATA WHERE approved = true", nativeQuery = true)
	Long countByApproved();
	
	@Query(value = "SELECT COUNT(*) FROM LEAVE_FORM_DATA WHERE rejected = true", nativeQuery = true)
	Long countByRejected();
	
	@Query(value = "SELECT COUNT(*) FROM LEAVE_FORM_DATA WHERE canceled = true", nativeQuery = true)
	Long countByCanceled();

}