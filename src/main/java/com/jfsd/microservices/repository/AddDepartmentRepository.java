package com.jfsd.microservices.repository;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.jfsd.microservices.model.AddDepartment;

@Repository
public interface AddDepartmentRepository extends JpaRepository<AddDepartment, Long> {
    List<AddDepartment> findAll(); 
    
    AddDepartment findByCode(String code);
}
