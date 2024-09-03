/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import Modelo.ClaseConexion;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author lenovo
 */
public class LoginDao {
    
    
    public boolean validarCredenciales(String usuario, String clave){
        try{
            Connection con = ClaseConexion.getConexion();
            
            Statement st = con.createStatement();
            String sql = "select * from tbUsuario where upper(correoUsuario) = ".concat(usuario)
                    .concat(" and contrasenaUsuario = ").concat(clave);
            ResultSet rs = st.executeQuery(sql);
            
            return rs.next();
            
        }catch(Exception e){
            e.printStackTrace();
            return false;
        }
    }
    
    public boolean validarUsuario(String usuario){
        try{
            Connection con = ClaseConexion.getConexion();
            
            Statement st = con.createStatement();
            String sql = "select * from tbUsuario where upper(correoUsuario) = ".concat(usuario);
            ResultSet rs = st.executeQuery(sql);
            
            return rs.next();
            
        }catch(Exception e){
            e.printStackTrace();
            return false;
        }
    }
    
    public int actualizarClave(String correo, String clave){
        try{
            Connection con = ClaseConexion.getConexion();
            
            Statement st = con.createStatement();
            String sql = "update tbUsuario set contrasenaUsuario = ".concat(clave)
                    .concat(" where upper(correoUsuario)").concat(correo);
            return st.executeUpdate(sql);
            
        }catch(Exception e){
            e.printStackTrace();
            return 0;
        }
    }
}
