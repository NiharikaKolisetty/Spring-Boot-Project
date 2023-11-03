package com.jfsd.microservices.repository;

import java.util.List;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;


import com.jfsd.microservices.model.AddManager;



@Repository
public interface ManagerRepository extends JpaRepository<AddManager, String> {
	
	@Query("select m from AddManager m where m.username=?1 and m.password=?2")
	public AddManager checkmanagerlogin(String username,String password);
	
	List<AddManager> findAll(); 

}
