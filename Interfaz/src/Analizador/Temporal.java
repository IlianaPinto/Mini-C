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
public class Temporal {
    public int t;
    public String activado;
    public boolean vivo;

    public Temporal(int t, String activado, boolean vivo) {
        this.t = t;
        this.activado = activado;
        this.vivo = vivo;
    }    

    public int getT() {
        return t;
    }

    public void setT(int t) {
        this.t = t;
    }

    public String getActivado() {
        return activado;
    }

    public void setActivado(String activado) {
        this.activado = activado;
    }

    public boolean isVivo() {
        return vivo;
    }

    public void setVivo(boolean vivo) {
        this.vivo = vivo;
    }
    
    
}
