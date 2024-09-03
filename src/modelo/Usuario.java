package Modelo;

public class Usuario {
    private String nombre;
    private int edad;
    private String correo;
    private String contrasena;
    private String rol;

    // Constructor, getters y setters
    public Usuario(String nombre, int edad, String correo, String contrasena, String rol) {
        this.nombre = nombre;
        this.edad = edad;
        this.correo = correo;
        this.contrasena = contrasena;
        this.rol = rol;
    }

    // Getters y setters
    // ...
}