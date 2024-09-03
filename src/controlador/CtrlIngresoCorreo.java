package controlador;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.util.Random;
import javax.swing.JOptionPane;
import modelo.EnviarCorreo;
import modelo.LoginDao;
import vista.login;
import vista.recuperacionClave;

/**
 *
 * @author Steven
 */
public class CtrlIngresoCorreo implements ActionListener {

    private recuperacionClave vista;

    private String correo;

    public CtrlIngresoCorreo(recuperacionClave vista) {
        this.vista = vista;
        vista.setLocationRelativeTo(null);
        vista.setVisible(true);
        addListener();
    }

    private void addListener() {
        vista.getjTxtMailRecu().addActionListener(this);
        vista.getjBtnEnviaCorreo().addActionListener(this);

        vista.getjLblIniSesion().addMouseListener(new MouseAdapter() {

            public void mouseClicked(MouseEvent e) {
                login login = new login();
                vista.dispose();
                new LoginController(login);
            }
        });
    }

    @Override
    public void actionPerformed(ActionEvent e) {

        if (e.getSource() == vista.getjTxtMailRecu()) {
            vista.getjTxtMailRecu().requestFocus();
        }

        if (e.getSource() == vista.getjBtnEnviaCorreo()) {
            generarEmail();
        }
    }

    private void generarEmail() {
        correo = vista.getjTxtMailRecu().getText().trim();

        if (correo.equals("")) {
            JOptionPane.showMessageDialog(null, "El correo es requerido");
            vista.getjTxtMailRecu().requestFocus();
            return;
        }

        LoginDao ld = new LoginDao();

        //if(!ld.validarUsuario(correo.toUpperCase())){
        if (1 != 1) {
            JOptionPane.showMessageDialog(null, "El correo no existe en nuestros registros");
            return;
        }

        int caracteres = (int) (Math.random() * 30);
        String clave = "";

        for (int i = 0; i < caracteres; i++) {
            int ascii = (int) Math.floor(Math.random() * (200 - 97) + 97);
            clave += (char) ascii;
        }

        String titulo = "Recuperacion de contraseña";
        String contenido = "Esta es tu nueva clave " + clave;

        boolean enviado = EnviarCorreo.enviarCorreo(correo, titulo, contenido);

        if (enviado)
            ld.actualizarClave(correo.toUpperCase(), clave);

        JOptionPane.showMessageDialog(null,
                enviado ? "Se ha enviado el correo" : "No se pudo enviar el correo");

        if (enviado) {
            login login = new login();
            vista.dispose();
            new LoginController(login);
        }

    }
}
