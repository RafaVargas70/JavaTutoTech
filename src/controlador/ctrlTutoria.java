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
        vista.jtbTutoria.addMouseListener(this);
        vista.btnAgregar.addMouseListener(this);
        vista.btnEliminar.addMouseListener(this);
        vista.btnActualizar.addMouseListener(this);
        vista.btnBuscarimg.addMouseListener(this);
        vista.btnLimpiar.addMouseListener(this);
    }
    @Override
    public void mouseClicked(MouseEvent e) {
        if(e.getSource()== vista.btnAgregar) {
            modelo.setNombreTutoria(vista.txtNombre.getText());
            modelo.setDescripcionTutoria(vista.txtDescripcion.getText());
            
            modelo.GuardarTuto();
            modelo.Mostrar(vista.jtbTutoria);
        }
        
        if (e.getSource() == vista.btnEliminar) {
            modelo.Eliminar(vista.jtbTutoria);
            modelo.Mostrar(vista.jtbTutoria);
        }
        
        if (e.getSource() == vista.jtbTutoria ) {
            modelo.cargarDatosTabla(vista);
        }
        
        if (e.getSource() == vista.btnActualizar ) {
            modelo.setNombreTutoria(vista.txtNombre.getText());
            modelo.setDescripcionTutoria(vista.txtDescripcion.getText());
            
            modelo.Actualizar(vista.jtbTutoria);
            modelo.Mostrar(vista.jtbTutoria);
        }
        
        if (e.getSource() == vista.btnLimpiar ) {
            modelo.LimpiarDatos(vista);
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
