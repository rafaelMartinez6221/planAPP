package com.planapp.repository;

import com.planapp.model.Usuario;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface UsuarioRepository extends JpaRepository<Usuario, Long> {

    // Cambiamos 'findByUsername' a 'findByEmail' porque ahora el login es con correo
    Optional<Usuario> findByEmail(String email);

    // Solo necesitamos verificar si el correo ya existe para evitar cuentas duplicadas
    boolean existsByEmail(String email);
}