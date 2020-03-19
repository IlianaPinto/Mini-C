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
        System.out.println("\""+pad+"\" -> \""+this.id+"_"+this.val+"\";");
        for (TreeNode hijo : hijos) {
            hijo.print();
        }
    }
}
