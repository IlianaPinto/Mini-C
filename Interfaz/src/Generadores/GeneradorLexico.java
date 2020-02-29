/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Generadores;

import java.io.File;

/**
 *
 * @author HP
 */
public class GeneradorLexico {
    public static void main(String[] args) {
        String path = "src/Analizador/AnalizadorLexico.jflex";
        generarLexer(path);
    }
    
    public static void generarLexer(String path){
        File archivo = new File(path);
        jflex.Main.generate(archivo);
    }
}
