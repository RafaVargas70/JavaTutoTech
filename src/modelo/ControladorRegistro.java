package Modelo;

import java.util.UUID;

public class ControladorRegistro {
    private UsuarioDAO usuarioDAO;

    public ControladorRegistro() {
        usuarioDAO = new UsuarioDAO();
    }

    // Método para registrar un nuevo usuario
    public boolean registrarUsuario(String nombre, int edad, String correo, String contrasena, String foto) {
        // Validaciones
        if (nombre.isEmpty() || correo.isEmpty() || contrasena.isEmpty() || edad <= 0) {
            System.out.println("Por favor complete todos los campos correctamente.");
            return false;
        }

        // Generar un ID único para el usuario
        String idUsuario = UUID.randomUUID().toString(); // Genera un ID único

        // Asumimos que todos los usuarios son de tipo "usuario" para este ejemplo
        int idRole = 1; // Define el rol (1 podría ser 'usuario', 2 podría ser 'admin')

        // Llamar al método de registro en UsuarioDAO
        return usuarioDAO.registrarUsuario(idUsuario, nombre, edad, correo, contrasena, foto, idRole);
    }
}
