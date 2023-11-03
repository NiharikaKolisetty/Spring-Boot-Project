package com.jfsd.microservices.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.jfsd.microservices.model.AddLeaveType;

@Repository
public interface AddLeaveTypeRepository extends JpaRepository<AddLeaveType, Long>{
	List<AddLeaveType> findAll();
}
