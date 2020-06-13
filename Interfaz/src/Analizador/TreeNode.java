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

    TreeNode(String val, TreeNode padre, int id) {
        this.val = val;
        this.padre = padre;
        this.id = id;
    }

    public String getVal() {
        return this.val;
    }

    public ArrayList<TreeNode> getHijos() {
        return this.hijos;
    }

    public void agregarHijo(TreeNode hijo) {
        hijo.setPadre(this);
        this.hijos.add(hijo);
    }

    public void agregarHijo(String val, int id) {
        hijos.add(new TreeNode(val, this, id));
    }
    
    public void agregarHijoInicio(TreeNode hijo) {
        hijo.setPadre(this);
        this.hijos.add(0,hijo);
    }

    public void setPadre(TreeNode tn) {
        this.padre = tn;
    }
    
    public void setVal(String v){
        this.val = v;
    }

    public void print() {
        String pad = "";
        if (this.padre != null) {
            pad += this.padre.id + "_";
            pad += this.padre.getVal();
        } else {
            pad = "null";
            limpiar("");
            escribirArchivo("digraph {\n");
        }
        //if (!this.val.equals("#") && !this.val.equals("Inicio") && !(this.id == this.padre.id && this.val.equals(this.padre.getVal()))) {
            String cadena = "\"" + pad + "\" -> \"" + this.id + "_" + this.val + "\";";
            cadena += "\n";
            escribirArchivo(cadena);
        //}
        for (TreeNode hijo : hijos) {
            hijo.print();
        }
    }

    public void escribirArchivo(String v) {
        FileWriter fichero = null;
        PrintWriter pw = null;
        try {
            fichero = new FileWriter("src/Analizador/generado.dot", true);
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
    
    public void limpiar(String v) {
        FileWriter fichero = null;
        PrintWriter pw = null;
        try {
            fichero = new FileWriter("src/Analizador/generado.dot");
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
