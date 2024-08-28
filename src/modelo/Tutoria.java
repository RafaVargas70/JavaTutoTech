package modelo;

import com.sun.jdi.connect.spi.Connection;


import java.sql.*;
import java.util.UUID;



public class Tutoria {
    //parametros
    private String uuidTutoria;
    private String nombreTutoria;
    private String descripcionTutoria;
    
    
    
    //getters y setters
    public String getUuidTutoria() {
        return uuidTutoria;
    }

    public void setUuidTutoria(String uuidTutoria) {
        this.uuidTutoria = uuidTutoria;
    }

    public String getNombreTutoria() {
        return nombreTutoria;
    }

    public void setNombreTutoria(String nombreTutoria) {
        this.nombreTutoria = nombreTutoria;
    }

    public String getDescripcionTutoria() {
        return descripcionTutoria;
    }

    public void setDescripcionTutoria(String descripcionTutoria) {
        this.descripcionTutoria = descripcionTutoria;
    }
    
    //METODOS///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    //GUARDAR------------------------------------------------------------------------------------------------------------------
    public void GuardarTuto(){
        Connection conexion = ClaseConexion.getConexion();
        
        try{
            PreparedStatement addTutoria = conexion.prepareStatement("INSERT INTO tbTutoria(idTutoria, nombreTutoria, descripcionTutoria) VALUES (?, ?, ?)");
            addTutoria.setString(1, UUID.randomUUID().toString());
            addTutoria.setString(2, getNombreTutoria());
            addTutoria.setString(3, getDescripcionTutoria());

            //Ejecutar la consulta
            addTutoria.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("este es el error en el modelo:metodo guardar " + ex);
        }
    }
}
