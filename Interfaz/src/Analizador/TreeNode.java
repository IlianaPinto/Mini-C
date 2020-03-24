/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Analizador;

import java.io.FileWriter;
import java.io.PrintWriter;
import java.util.ArrayList;

/**
 *
 * @author HP
 */
public class TreeNode {
    public String val = "";
    public TreeNode padre;
    public int id;
    public ArrayList<TreeNode> hijos = new ArrayList<>();
    
    TreeNode(String val, TreeNode padre, int id){
        this.val = val;
        this.padre =  padre;
        this.id = id;
    }
    
    public String getVal(){
        return this.val;
    }
    
    public ArrayList<TreeNode> getHijos(){
        return this.hijos;
    }
    
    public void agregarHijo(TreeNode hijo){
        hijo.setPadre(this);
        this.hijos.add(hijo);
    }
    
    public void agregarHijo(String val, int id){
        hijos.add(new TreeNode(val, this, id));
    }
    
    public void setPadre(TreeNode tn){
        this.padre = tn;
    }
    
    public void fix(){
        for (TreeNode hijo : hijos) {
            if(this.val.equals(hijo.getVal())){
                for (TreeNode hijo1 : hijo.getHijos()) {
                    agregarHijo(hijo1);
                }
                hijos.remove(hijo);
            }
        }
    }
    
    public void print(){
        String pad = "";
        if(this.padre != null){
            pad += this.padre.id + "_";
            pad += this.padre.getVal();
        }else{
            pad = "null";
        }
        if(!this.val.equals("#") && !this.val.equals("Inicio"))
        System.out.println("\""+pad+"\" -> \""+this.id+"_"+this.val+"\";");
        for (TreeNode hijo : hijos) {
            hijo.print();
        }
    }
    
    public void escribirArchivo(String v){
        FileWriter fichero = null;
        PrintWriter pw = null;
        try {
            fichero = new FileWriter("src/Analizador/generado.txt");
            pw = new PrintWriter(fichero);
            pw.print(v);
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
