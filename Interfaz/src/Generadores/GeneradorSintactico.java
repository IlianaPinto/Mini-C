/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Generadores;

/**
 *
 * @author HP
 */
public class GeneradorSintactico {

    public static void main(String[] args) {
        String opciones[] = new String[7];

        opciones[0] = "-destdir";
        opciones[1] = "src/Analizador";
        opciones[2] = "-symbols";
        opciones[3] = "Sym";
        opciones[4] = "-parser";
        opciones[5] = "ASintactico";
        opciones[6] = "src/Analizador/AnalizadorSintactico.cup";
        
        try {
            java_cup.Main.main(opciones);
        } catch (Exception e) {
        }

    }

}
