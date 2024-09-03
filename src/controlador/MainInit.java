/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import vista.login;

/**
 *
 * @author lenovo
 */
public class MainInit {
    
    public static void main(String[] args) {
        try {
            login vista = new login();
            
            //instanciar el controlador y pasar un parametro llamdo vista, que es nuestra interfaz grafica
            new LoginController(vista);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
