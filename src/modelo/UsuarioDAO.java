package Modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class UsuarioDAO {

    // Método para registrar un usuario
    public boolean registrarUsuario(String idUsuario, String nombre, int edad, String correo, String contrasena, String foto, int idRole) {
    Connection conexion = ClaseConexion.getConexion(); // Obtiene la conexión a la base de datos
    String sql = "INSERT INTO tbUsuario (idUsuario, nombreUsuario, edadUsuario, correoUsuario, contrasenaUsuario, fotoUsuario, idRole) VALUES (?, ?, ?, ?, ?, ?, ?)";

    try (PreparedStatement pstmt = conexion.prepareStatement(sql)) {
        pstmt.setString(1, idUsuario);
        pstmt.setString(2, nombre);
        pstmt.setInt(3, edad);
        pstmt.setString(4, correo);
        pstmt.setString(5, contrasena);
        pstmt.setString(6, foto);
        pstmt.setInt(7, idRole);

        int filasAfectadas = pstmt.executeUpdate();
        return filasAfectadas > 0; // Retorna true si se registró con éxito
    } catch (SQLException e) {
        System.out.println("Error al registrar el usuario: " + e.getMessage());
        return false;
    } finally {
        try {
            if (conexion != null && !conexion.isClosed()) {
                conexion.close(); // Cierra la conexión
            }
        } catch (SQLException ex) {
            System.out.println("Error al cerrar la conexión: " + ex.getMessage());
        }
    } 
    
    }  
}


