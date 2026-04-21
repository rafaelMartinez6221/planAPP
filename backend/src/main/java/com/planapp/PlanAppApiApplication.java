package com.planapp;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class PlanAppApiApplication { // ¡Le agregamos "Api" aquí!

    public static void main(String[] args) {
        // ¡Encendiendo el motor de PlanAPP!
        SpringApplication.run(PlanAppApiApplication.class, args); // ¡Y aquí también!
    }

}