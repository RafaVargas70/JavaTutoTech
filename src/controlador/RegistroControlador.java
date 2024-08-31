package controlador;

import modelo.UsuarioModelo;
import vista.frmRegistro;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class RegistroControlador {
    private final frmRegistro vista;
    private final UsuarioModelo modelo;

    public RegistroControlador(frmRegistro vista, UsuarioModelo modelo) {
        this.vista = vista;
        this.modelo = modelo;
        this.vista.getBtnRegistrarme().addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                registrarUsuario();
            }
        });
        this.vista.getBtnIrALogin().addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                // Lógica para redirigir al formulario de login
            }
        });
    }

    private void registrarUsuario() {
        String nombre = vista.getTxtNombre().getText();
        String correo = vista.getTxtCorreo().getText();
        String contrasena = vista.getTxtContraseña().getText();
        String rol = vista.getjRadioButton1().isSelected() ? "tutor" : "tutorado";
        // Validar los campos
        if (nombre.isEmpty() || correo.isEmpty() || contrasena.isEmpty()) {
            // Mostrar mensaje de error
            return;
        }
        // Llamar al modelo para registrar el usuario
        boolean registrado = modelo.registrarUsuario(nombre, correo, contrasena, rol);
        if (registrado) {
            // Mostrar mensaje de éxito
        } else {
            // Mostrar mensaje de error
        }
    }
}