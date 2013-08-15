import toxi.geom.*;
import toxi.math.waves.*;
import toxi.math.noise.*;
import toxi.processing.*;
import java.util.Iterator;
import java.awt.event.*;

Cell      cell;
Render    render;
NetworkIO networkIO;
Graphview graphview;
String    gui;  // Scene, Graph

void setup() {
   size(1280, 720);
   background(3, 7, 10);
   frameRate(60);
   addMouseWheelListener(new MouseWheelListener() { 
     public void mouseWheelMoved(MouseWheelEvent mwe) { 
     mouseWheel(mwe.getWheelRotation());
   }}); 
      
   gui = "Scene";
   graphview = new Graphview();
   
   networkIO = new NetworkIO();
   cell   = new Cell(256);
   networkIO.setCell(cell);

   render = new Render(cell);
}

void draw() {
    
  networkIO.tick();
  cell.step();
  render.render();
  saveFrame("takeD/takeD_#####.png");
}
