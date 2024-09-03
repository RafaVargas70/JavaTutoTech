/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import javax.swing.JOptionPane;
import modelo.LoginDao;
import vista.frmMenuPrincipal;
import vista.login;
import vista.recuperacionClave;

/**
 *
 * @author lenovo
 */
public class LoginController implements ActionListener {
    
    private login vista;
    private LoginDao loginDao;
    
    private String usuario;
    private String clave;
    
    public LoginController(login vista){
        this.vista = vista;
        vista.setLocationRelativeTo(null);
        vista.setVisible(true);
        addListener();
    }
    
    private void addListener(){
        vista.getjTxtMail().addActionListener(this);
        vista.getjTxtPass().addActionListener(this);
        vista.getjBtnInicia().addActionListener(this);
        
        vista.getLblRecupera().addMouseListener(new MouseAdapter() {
            
            public void mouseClicked(MouseEvent e){
                recuperacionClave recupera = new recuperacionClave();
                vista.dispose();
                new CtrlIngresoCorreo(recupera);
            }
        });
    }

    @Override
    public void actionPerformed(ActionEvent e) {

        if(e.getSource() == vista.getjTxtMail())
            vista.getjTxtPass().requestFocus();
        
        if(e.getSource() == vista.getjTxtPass())
            vista.getjTxtPass().requestFocus();
        
        if(e.getSource() == vista.getjBtnInicia()){
            usuario = vista.getjTxtMail().getText().trim().toUpperCase();
            clave =  vista.getjTxtPass().getText().trim();
            
            if(usuario.equals("")){
                JOptionPane.showMessageDialog(null, "El usuario es requerido");
                vista.getjTxtMail().requestFocus();
            }else if(clave.equals("")){
                JOptionPane.showMessageDialog(null, "La clave es requerida");
                vista.getjTxtPass().requestFocus();
            }else{
             validaAcceso();
            }
        }
    }
    
    private void validaAcceso(){
        loginDao = new LoginDao();
        
        if(loginDao.validarCredenciales(usuario, clave)){
        //if(true){
            frmMenuPrincipal form = new frmMenuPrincipal();
            vista.dispose();
            new ctrlMenuPrincipal(form).abrirApp();
        }else{
            JOptionPane.showMessageDialog(null, "Usuario o contraseña no valido");
        }
    }
    
}
