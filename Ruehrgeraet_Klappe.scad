// Andre Betz
// github@AndreBetz.de

include <Ruehrgeraet_Daten.scad>

module klappe() {
 difference() {
   cylinder(platteDicke,topfDurchmesser/2,topfDurchmesser/2,false);
   translate([-henkelDurchmesser/2,-henkelBreite/2-henkelUeber,-1])  
     cube([henkelDurchmesser,topfDurchmesser/2+henkelBreite/2+henkelUeber,platteDicke+2],false);
   // Griff Bohrungen  
   translate([abstandGriff/2,-topfDurchmesser/2+topfDurchmesser/2/5,-1])  
     cylinder(platteDicke+2,schraubeBohrlochM5/2,schraubeBohrlochM5/2,false);  
   translate([-abstandGriff/2,-topfDurchmesser/2+topfDurchmesser/2/5,-1])  
     cylinder(platteDicke+2,schraubeBohrlochM5/2,schraubeBohrlochM5/2,false);  
 }
}

// 2D Projektion fuer SVG Datei
projection() 
{ 
// Klappe mit scharnieren daran befestigen
    klappe();
}
