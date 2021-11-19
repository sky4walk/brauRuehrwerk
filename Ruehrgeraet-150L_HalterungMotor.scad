// Andre Betz
// github@AndreBetz.de

include <Ruehrgeraet-150L_Daten.scad>

module deckel() {
  cylinder(platteDicke,topfDurchmesser/2,topfDurchmesser/2,false);
  //Halterung aussen Henkel  
  translate([-henkelDurchmesser/2,-henkelBreite/2-henkelUeber,0])
    cube([henkelDurchmesser,henkelBreite+henkelUeber*2,platteDicke],false);
    
}

module motorBefestigung() {
    motorBohrWinkelNeu = (180 - motorBohrWinkel) / 2;
    motorBohrPosY = motorBohrRadius * sin(motorBohrWinkelNeu);
    motorBohrPosX = motorBohrRadius * cos(motorBohrWinkelNeu);
    difference() {
      deckel();
      translate([-henkelDurchmesser/2,-topfDurchmesser/2-henkelBreite/2-henkelUeber,-1])  
        cube([henkelDurchmesser,topfDurchmesser/2,platteDicke+2],false);
      // Motorwelle
      translate([0,0,-1])  
        cylinder(platteDicke+2,motorBohrloch/2,motorBohrloch/2,false);
      // Temperatursensor Tauchhuelse
      translate([topfDurchmesser/4,0,-1])  
        cylinder(platteDicke+2,sensorBohrloch/2,sensorBohrloch/2,false);
      // Motor  Befestigung
      translate([0,-motorBohrRadius,-1])  
        cylinder(platteDicke+2,schraubeBohrloch/2,schraubeBohrloch/2,false);
      translate([motorBohrPosX,motorBohrPosY,-1])  
        cylinder(platteDicke+2,schraubeBohrloch/2,schraubeBohrloch/2,false);
      translate([-motorBohrPosX,motorBohrPosY,-1])  
        cylinder(platteDicke+2,schraubeBohrloch/2,schraubeBohrloch/2,false);
        
    // Halterungsschrauben
    schraubXPos = pow(topfDurchmesser/2*topfDurchmesser/2 - henkelBreite/2*henkelBreite/2,0.5);
    translate([-schraubXPos,-henkelBreite/2-henkelUeber/2,-1])  
        cylinder(platteDicke+2,schraubeBohrloch/2,schraubeBohrloch/2,false);
      translate([-schraubXPos,henkelBreite/2+henkelUeber/2,-1])  
        cylinder(platteDicke+2,schraubeBohrloch/2,schraubeBohrloch/2,false);        
      translate([schraubXPos,-henkelBreite/2-henkelUeber/2,-1])  
        cylinder(platteDicke+2,schraubeBohrloch/2,schraubeBohrloch/2,false);
      translate([schraubXPos,henkelBreite/2+henkelUeber/2,-1])  
        cylinder(platteDicke+2,schraubeBohrloch/2,schraubeBohrloch/2,false);        

    //Scharnier
      translate([scharnierPosMitte,-henkelBreite/2-henkelUeber+scharnierHoehe,-1])  
        cylinder(platteDicke+2,schraubeBohrlochM5/2,schraubeBohrlochM5/2,false); 
      translate([scharnierPosMitte+scharnierAbstandLoch,-henkelBreite/2-henkelUeber+scharnierHoehe,-1])  
        cylinder(platteDicke+2,schraubeBohrlochM5/2,schraubeBohrlochM5/2,false);
      translate([-scharnierPosMitte,-henkelBreite/2-henkelUeber+scharnierHoehe,-1])  
        cylinder(platteDicke+2,schraubeBohrlochM5/2,schraubeBohrlochM5/2,false); 
      translate([-scharnierPosMitte-scharnierAbstandLoch,-henkelBreite/2-henkelUeber+scharnierHoehe,-1])  
        cylinder(platteDicke+2,schraubeBohrlochM5/2,schraubeBohrlochM5/2,false);      
      
    //Gegenruehrer Halterung
      translate([-scharnierPosMitte,-henkelBreite/3,-1])  
        cylinder(platteDicke+2,schraubeBohrlochM5/2,schraubeBohrlochM5/2,false); 
      translate([-scharnierPosMitte-scharnierAbstandLoch,-henkelBreite/3,-1])  
        cylinder(platteDicke+2,schraubeBohrlochM5/2,schraubeBohrlochM5/2,false);      
    
    }    
    // halterung ohne scharnier    
    translate([scharnierPosMitte+scharnierAbstandLoch/4+spielAbstand,-henkelBreite/2-henkelUeber-scharnierAbstandLoch/5*4,-1])
      cube([scharnierAbstandLoch/2-spielAbstand*2,scharnierAbstandLoch/5*4,platteDicke+2],false); 
    translate([scharnierPosMitte+spielAbstand,-henkelBreite/2-henkelUeber-scharnierAbstandLoch/5*4,-1])
      cube([scharnierAbstandLoch-spielAbstand*2,scharnierAbstandLoch/4-spielAbstand,platteDicke+2],false);
      
    translate([-scharnierPosMitte-scharnierAbstandLoch/4*3+spielAbstand,-henkelBreite/2-henkelUeber-scharnierAbstandLoch/5*4,-1])
      cube([scharnierAbstandLoch/2-spielAbstand*2,scharnierAbstandLoch/5*4,platteDicke+2],false); 
    translate([-scharnierPosMitte-scharnierAbstandLoch+spielAbstand,-henkelBreite/2-henkelUeber-scharnierAbstandLoch/5*4,-1])
      cube([scharnierAbstandLoch-spielAbstand*2,scharnierAbstandLoch/4-spielAbstand,platteDicke+2],false);       
}

// 2D Projektion fuer SVG/DXF Datei
projection() 
{ 
// Motorbefestigung
    motorBefestigung(); 
}
