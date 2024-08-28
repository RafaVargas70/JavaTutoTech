package controlador;

import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import vista.frmMenuPrincipal;
import vista.jpAddTutoria;

public class ctrlMenuPrincipal implements MouseListener{
    
    //mandar a llamar las capas
    frmMenuPrincipal vista;
    
    //constructor
    public ctrlMenuPrincipal(frmMenuPrincipal Vista){
        this.vista = Vista;
        
        vista.btnIrTutoria.addMouseListener(this);
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
