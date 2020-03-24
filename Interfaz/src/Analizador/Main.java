/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Analizador;

import java.awt.Color;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.Reader;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import java_cup.runtime.Scanner;
import javax.swing.JFileChooser;
import javax.swing.JOptionPane;

/**
 *
 * @author HP
 */
public class Main extends javax.swing.JFrame {

    /**
     * Creates new form Main
     */
    public Main() {
        initComponents();
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jTabbedPane1 = new javax.swing.JTabbedPane();
        jPanel1 = new javax.swing.JPanel();
        bt_seleccionar = new javax.swing.JButton();
        bt_probar = new javax.swing.JButton();
        jScrollPane1 = new javax.swing.JScrollPane();
        TextArea = new javax.swing.JTextArea();
        bt_guardar = new javax.swing.JButton();
        jScrollPane2 = new javax.swing.JScrollPane();
        TextErrores = new javax.swing.JTextArea();
        jLabel1 = new javax.swing.JLabel();
        titulo = new javax.swing.JLabel();
        jTabbedPane2 = new javax.swing.JTabbedPane();
        jTabbedPane3 = new javax.swing.JTabbedPane();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        bt_seleccionar.setText("Seleccionar Archivo");
        bt_seleccionar.setName("bt_seleccionar"); // NOI18N
        bt_seleccionar.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                bt_seleccionarMouseClicked(evt);
            }
        });

        bt_probar.setText("Probar");
        bt_probar.setName("bt_probar"); // NOI18N
        bt_probar.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                bt_probarMouseClicked(evt);
            }
        });

        TextArea.setColumns(20);
        TextArea.setRows(5);
        jScrollPane1.setViewportView(TextArea);

        bt_guardar.setText("Guardar");
        bt_guardar.setName("bt_guardar"); // NOI18N
        bt_guardar.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                bt_guardarMouseClicked(evt);
            }
        });

        TextErrores.setColumns(20);
        TextErrores.setRows(5);
        jScrollPane2.setViewportView(TextErrores);

        jLabel1.setText("Archivo: ");

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jScrollPane1, javax.swing.GroupLayout.Alignment.TRAILING)
                            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel1Layout.createSequentialGroup()
                                .addComponent(bt_seleccionar)
                                .addGap(18, 18, 18)
                                .addComponent(bt_guardar)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 385, Short.MAX_VALUE)
                                .addComponent(bt_probar))
                            .addComponent(jScrollPane2, javax.swing.GroupLayout.Alignment.TRAILING))
                        .addGap(25, 25, 25))
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addComponent(jLabel1)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(titulo)
                        .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))))
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel1Layout.createSequentialGroup()
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel1)
                    .addComponent(titulo))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 305, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(18, 18, 18)
                .addComponent(jScrollPane2, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(bt_seleccionar)
                    .addComponent(bt_probar)
                    .addComponent(bt_guardar))
                .addContainerGap())
        );

        jTabbedPane1.addTab("tab1", jPanel1);
        jTabbedPane1.addTab("tab2", jTabbedPane2);
        jTabbedPane1.addTab("tab3", jTabbedPane3);

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jTabbedPane1)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jTabbedPane1)
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void bt_probarMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_bt_probarMouseClicked
        try {
            //File file = new File("C:\\Users\\HP\\Desktop\\Periodo actual\\Compi\\Mini-C\\Interfaz\\src\\Analizador\\prb.txt");
            Lexer lexer = new Lexer(new FileReader(fichero));
            ASintactico p = new ASintactico(lexer);
            System.out.println("**************************************************");
            p.parse();
            System.out.println("**************************************************");
            this.TextErrores.setText("");
            ArrayList<String> l = p.errores;
            if(l.size() == 0){
                this.TextErrores.append("Compilado sin errores!");
            }
            this.TextErrores.setCaretColor(Color.yellow);
            for (int i = 0; i < l.size(); i++) {
                this.TextErrores.append(l.get(i) + "\n");
            }
        } catch (Exception e) {
            System.out.println("ERROR");
            e.printStackTrace();
        }
    }//GEN-LAST:event_bt_probarMouseClicked

    private void bt_seleccionarMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_bt_seleccionarMouseClicked
        JFileChooser fileChooser = new JFileChooser();
        int seleccion = fileChooser.showOpenDialog(this);

        if (seleccion == JFileChooser.APPROVE_OPTION) {
            fichero = fileChooser.getSelectedFile();

            FileReader fr = null;
            BufferedReader bf = null;
            try {
                fr = new FileReader(fichero);
                bf = new BufferedReader(fr);
                String linea;
                this.TextArea.setText("");
                while ((linea = bf.readLine()) != null) {
                    this.TextArea.append(linea + "\n");
                }
                this.titulo.setText(fichero.getName());
            } catch (Exception e) {
            } finally {
                try {
                    fr.close();
                } catch (IOException ex) {
                    Logger.getLogger(Main.class.getName()).log(Level.SEVERE, null, ex);
                }
            }

        }

    }//GEN-LAST:event_bt_seleccionarMouseClicked

    private void bt_guardarMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_bt_guardarMouseClicked

        FileWriter fichero2 = null;
        PrintWriter pw = null;
        try {
            fichero2 = new FileWriter(fichero.getAbsolutePath());
            pw = new PrintWriter(fichero2);
            pw.print(this.TextArea.getText());
            JOptionPane.showMessageDialog(this, "Archivo guardado");
        } catch (Exception e) {
            JOptionPane.showMessageDialog(this, "No ha seleccionado un archivo");
            //e.printStackTrace();
        } finally {
            try {
                if (null != fichero2) {
                    fichero2.close();
                }
            } catch (Exception e2) {
                JOptionPane.showMessageDialog(this, "Ocurrio un error");
                //e2.printStackTrace();
            }
        }
        
    }//GEN-LAST:event_bt_guardarMouseClicked

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Windows".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(Main.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(Main.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(Main.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(Main.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new Main().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JTextArea TextArea;
    private javax.swing.JTextArea TextErrores;
    private javax.swing.JButton bt_guardar;
    private javax.swing.JButton bt_probar;
    private javax.swing.JButton bt_seleccionar;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JScrollPane jScrollPane2;
    private javax.swing.JTabbedPane jTabbedPane1;
    private javax.swing.JTabbedPane jTabbedPane2;
    private javax.swing.JTabbedPane jTabbedPane3;
    private javax.swing.JLabel titulo;
    // End of variables declaration//GEN-END:variables
    File fichero;
}
