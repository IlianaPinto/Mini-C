/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Analizador;

import java.util.ArrayList;

/**
 *
 * @author HP
 */
public class Funcion {
    public String tipo;
    public String id;
    public ArrayList<Variable> params;
    
    public Funcion(String tipo, String id){
        this.tipo = tipo;
        this.id = id;
        this.params = new ArrayList();
    }
    
    public void agregar_params(ArrayList<Variable> v){
        this.params = v;
    }
    
    public String getTipo(){
        return this.tipo;
    }
    
    public String getId(){
        return this.id;
    }
    
    public ArrayList<Variable> getParams(){
        return this.params;
    }
}
