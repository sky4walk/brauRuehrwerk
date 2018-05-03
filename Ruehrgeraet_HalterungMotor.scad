// Andre Betz
// github@AndreBetz.de

include <Ruehrgeraet_Daten.scad>

module deckel() {
  cylinder(platteDicke,topfDurchmesser/2,topfDurchmesser/2,false);
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
      translate([-topfDurchmesser/2,-henkelBreite/2-henkelUeber/2,-1])  
        cylinder(platteDicke+2,schraubeBohrloch/2,schraubeBohrloch/2,false);
      translate([-topfDurchmesser/2,henkelBreite/2+henkelUeber/2,-1])  
        cylinder(platteDicke+2,schraubeBohrloch/2,schraubeBohrloch/2,false);        
      translate([topfDurchmesser/2,-henkelBreite/2-henkelUeber/2,-1])  
        cylinder(platteDicke+2,schraubeBohrloch/2,schraubeBohrloch/2,false);
      translate([topfDurchmesser/2,henkelBreite/2+henkelUeber/2,-1])  
        cylinder(platteDicke+2,schraubeBohrloch/2,schraubeBohrloch/2,false);        
    }
}

// 2D Projektion fuer SVG/DXF Datei
projection() 
{ 
// Motorbefestigung
    motorBefestigung(); 
}
