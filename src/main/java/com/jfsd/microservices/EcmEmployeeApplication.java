package com.jfsd.microservices;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan(basePackages = {"com.jfsd.microservices"})
public class EcmEmployeeApplication {

	public static void main(String[] args) {
		SpringApplication.run(EcmEmployeeApplication.class, args);
		System.out.println("Spring Boot Project");
	}

}
