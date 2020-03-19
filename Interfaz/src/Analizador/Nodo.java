/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Analizador;

import java.io.FileWriter;
import java.io.PrintWriter;

/**
 *
 * @author HP
 */
public class Nodo {
    public String nodo;
    
    public Nodo(){
        this.nodo = "";
    }
    
    public void agregarNodo(String n){
        this.nodo += "\n"+n;
    }
    
    public void crearArchivo(){
        String grafo = "digraph G{"+ this.nodo +"\n}";
        
        FileWriter fichero = null;
        PrintWriter pw = null;
        try {
            fichero = new FileWriter("src/Analizador/generado.txt");
            pw = new PrintWriter(fichero);
            pw.print(grafo);
        } catch (Exception e) {
            //e.printStackTrace();
        } finally {
            try {
                if (null != fichero) {
                    fichero.close();
                }
            } catch (Exception e2) {
                //e2.printStackTrace();
            }
        }
    }
}
