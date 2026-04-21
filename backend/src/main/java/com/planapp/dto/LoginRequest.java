package com.planapp.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Email;

public class LoginRequest {

    @NotBlank(message = "El correo no puede estar vacío")
    @Email(message = "Debe ser un formato de correo válido") // Agregamos esto para extra seguridad
    private String email; // ¡Cambiado de username a email!

    @NotBlank(message = "La contraseña no puede estar vacía")
    private String password;

    public LoginRequest() {
    }

    public LoginRequest(String email, String password) {
        this.email = email;
        this.password = password;
    }

    // Getters y Setters actualizados para "email"
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