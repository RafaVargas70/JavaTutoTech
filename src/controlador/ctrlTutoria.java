package controlador;

import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import javax.swing.JOptionPane;
import modelo.Tutoria;
import vista.jpAddTutoria;



public class ctrlTutoria implements MouseListener{
    
    //llamar otras capas
    private Tutoria modelo;
    private jpAddTutoria vista;
    
    //constructor
    public ctrlTutoria(Tutoria modelo, jpAddTutoria vista){
        this.modelo = modelo;
        this.vista = vista;
        
        modelo.Mostrar(vista.jtbTutoria);
        
        vista.btnAgregar.addMouseListener(this);
    }
    @Override
    public void mouseClicked(MouseEvent e) {
        
      //  if(e.getSource()== vista.btnAgregar){
            
            

      // }
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
