package com.jfsd.microservices.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.jfsd.microservices.model.Employee;


@Repository
public interface EmployeeRepository extends JpaRepository<Employee, Long>{
	
	@Query("select e from Employee e where e.username=?1 and e.password=?2")
	 Employee checkemplogin(String username, String password);
}
