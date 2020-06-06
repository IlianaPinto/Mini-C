/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Analizador;

/**
 *
 * @author HP
 */
public class Variable {

    public String tipo;
    public String id;
    public String ambito;
    public int offset;

    public Variable(String tipo, String id, String ambito) {
        this.tipo = tipo;
        this.id = id;
        this.ambito = ambito;
    }
    
    public Variable(String tipo, String id, String ambito, int offset) {
        this.tipo = tipo;
        this.id = id;
        this.ambito = ambito;
        this.offset = offset;
    }

    public int getOffset() {
        return offset;
    }

    public void setOffset(int offset) {
        this.offset = offset;
    }

    public String getTipo() {
        return tipo;
    }

    public String getId() {
        return id;
    }
    
    public String getAmbito(){
        return ambito;
    }
    public void setTipo(String tipo){
        this.tipo = tipo;
    }
    
    public void setId(String id){
        this.id = id;
    }
    
    public void setAmbito(String ambito){
        this.ambito = ambito;
    }
}
