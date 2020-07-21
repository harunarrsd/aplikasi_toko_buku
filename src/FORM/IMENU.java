/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package FORM;

import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.Image;
import javax.swing.ImageIcon;
import javax.swing.JPanel;

/**
 *
 * @author Harun Ar
 */
public class IMENU extends JPanel{
    
    private Image image;
    public IMENU(){
        image = new ImageIcon(getClass().getResource("/GAMBAR/menu1.jpg")).getImage();
    }
    
    protected void paintComponent(Graphics g){
        super.paintComponent(g);
        Graphics gd = (Graphics2D)g.create();
        gd.drawImage(image, 0, 0, getWidth(), getHeight(), this);
        gd.dispose();
    }
}
