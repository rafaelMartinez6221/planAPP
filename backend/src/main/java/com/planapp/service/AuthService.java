package com.planapp.service;

import com.planapp.dto.AuthResponse;
import com.planapp.dto.LoginRequest;
import com.planapp.dto.RegisterRequest;
import com.planapp.dto.UsuarioDTO;
import com.planapp.model.Usuario;
import com.planapp.repository.UsuarioRepository;
import com.planapp.util.JwtUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AuthService {

    @Autowired
    private UsuarioRepository usuarioRepository;

    @Autowired
    private JwtUtil jwtUtil;

    public AuthResponse login(LoginRequest request) {
        // 1. Buscamos al usuario por su EMAIL (lo que ingresa en tu app de Flutter)
        Usuario usuario = usuarioRepository.findByEmail(request.getEmail())
                .orElseThrow(() -> new RuntimeException("Usuario no encontrado"));

        // 2. Verificamos la contraseña
        if (!usuario.getPassword().equals(request.getPassword())) {
            throw new RuntimeException("Contraseña incorrecta");
        }

        // 3. Generamos el token usando el EMAIL como identificador
        String token = jwtUtil.generateToken(usuario.getEmail());

        // 4. Preparamos los datos limpios para devolver a Flutter
        UsuarioDTO usuarioDTO = new UsuarioDTO(
                usuario.getId(),
                usuario.getName(),
                usuario.getEmail()
        );

        return new AuthResponse(token, usuarioDTO);
    }

    public AuthResponse register(RegisterRequest request) {
        System.out.println("=== INICIO REGISTRO ===");
        System.out.println("Name: " + request.getName());
        System.out.println("Email: " + request.getEmail());

        // Solo verificamos que el correo no esté repetido
        if (usuarioRepository.existsByEmail(request.getEmail())) {
            System.out.println("ERROR: Email ya registrado");
            throw new RuntimeException("El email ya está registrado");
        }

        System.out.println("Creando nuevo usuario...");
        Usuario usuario = new Usuario(
                request.getName(),
                request.getEmail(),
                request.getPassword()
        );

        System.out.println("Guardando usuario en BD...");
        usuario = usuarioRepository.save(usuario);
        System.out.println("Usuario guardado con ID: " + usuario.getId());

        System.out.println("Generando token JWT...");
        String token = jwtUtil.generateToken(usuario.getEmail());
        System.out.println("Token generado exitosamente");

        UsuarioDTO usuarioDTO = new UsuarioDTO(
                usuario.getId(),
                usuario.getName(),
                usuario.getEmail()
        );

        System.out.println("=== REGISTRO EXITOSO ===");
        return new AuthResponse(token, usuarioDTO);
    }
}