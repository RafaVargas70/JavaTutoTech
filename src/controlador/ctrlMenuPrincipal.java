package controlador;

import java.awt.Panel;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import javax.swing.JFrame;
import javax.swing.JOptionPane;
import modelo.Tutoria;
import vista.frmMenuPrincipal;
import vista.jpAddTutoria;

public class ctrlMenuPrincipal implements MouseListener{
    
    //mandar a llamar las capas
    private frmMenuPrincipal vista;
    private jpAddTutoria panel;
    private Tutoria modelo;

    public ctrlMenuPrincipal(frmMenuPrincipal menu) {
        vista = menu;
    }
    
    //constructor
    public ctrlMenuPrincipal(frmMenuPrincipal Vista, jpAddTutoria Panel, Tutoria Modelo){
        this.vista = Vista;
        this.panel = Panel;
        this.modelo = Modelo;
        
        vista.btnIrTutoria.addMouseListener(this);
        panel.btnAgregar.addMouseListener(this);
        modelo.Mostrar(panel.jtbTutoria);
        panel.btnEliminar.addMouseListener(this);
    }
    
    public void abrirApp(){
        vista.setTitle("Dashboard");
        vista.setLocationRelativeTo(null);
        vista.setVisible(true);
        vista.setExtendedState(JFrame.NORMAL);
    }

    @Override
    public void mouseClicked(MouseEvent e) {
        //para que se vea el panel
        if(e.getSource() == vista.btnIrTutoria){
            jpAddTutoria objAddTuto = new jpAddTutoria();
            
            vista.jpContenedor.removeAll();
            vista.jpContenedor.add(objAddTuto);
            vista.jpContenedor.revalidate();
            vista.jpContenedor.repaint();
        }
        
        
        if(e.getSource() == panel.btnAgregar){
            modelo.setNombreTutoria(panel.txtNombre.getText());
            modelo.setDescripcionTutoria(panel.txtDescripcion.getText());
            
            
            modelo.GuardarTuto();
        }
        
        if(e.getSource() == panel.btnEliminar){
            modelo.Eliminar(panel.jtbTutoria);
            modelo.Mostrar(panel.jtbTutoria);

            
            
            
                   
            //validaciones---------------------------------------------------------------------------------------
            if(panel.txtNombre.getText().isEmpty() || panel.txtDescripcion.getText().isEmpty()){
                //esto es un alert
                JOptionPane.showMessageDialog(vista, "Llene todos los campos");
            }
        }
    }

    @Override
    public void mousePressed(MouseEvent e) {
    }

    @Override
    public void mouseReleased(MouseEvent e) {
    }

    @Override
    public void mouseEntered(MouseEvent e) {
    }

    @Override
    public void mouseExited(MouseEvent e) {
    }
    
    
    
}
