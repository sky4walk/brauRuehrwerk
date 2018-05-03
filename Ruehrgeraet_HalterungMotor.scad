// Andre Betz
// github@AndreBetz.de

include <Ruehrgeraet_Daten.scad>

module deckel() {
  cylinder(platteDicke,topfDurchmesser/2,topfDurchmesser/2,false);
  translate([-henkelDurchmesser/2,-henkelBreite/2-henkelUeber,0])
    cube([henkelDurchmesser,henkelBreite+henkelUeber*2,platteDicke],false);
}

module motorBefestigung() {
    difference() {
      deckel();
      translate([-henkelDurchmesser/2,-topfDurchmesser/2-henkelBreite/2-henkelUeber,-1])  
        cube([henkelDurchmesser,topfDurchmesser/2,platteDicke+2],false);
      translate([0,0,-1])  
        cylinder(platteDicke+2,motorBohrloch/2,motorBohrloch/2,false);
    }
}

// 2D Projektion fuer SVG Datei
projection() 
{ 
// Motorbefestigung
    motorBefestigung(); 
}
