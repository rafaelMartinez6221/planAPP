package com.planapp.model;

import jakarta.persistence.*;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;

@Entity
@Table(name = "usuarios")
public class Usuario {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotBlank
    @Column(nullable = false) // Le quitamos el "unique" porque muchas personas pueden tener el mismo nombre
    private String name;

    @NotBlank
    @Email
    @Column(unique = true, nullable = false) // El correo sí debe ser único siempre
    private String email;

    @NotBlank
    @Column(nullable = false)
    private String password;

    // ¡Empresa eliminada por completo!

    public Usuario() {
    }

    // Constructor actualizado solo con los datos de PlanAPP
    public Usuario(String name, String email, String password) {
        this.name = name;
        this.email = email;
        this.password = password;
    }

    // --- GETTERS Y SETTERS ---

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}