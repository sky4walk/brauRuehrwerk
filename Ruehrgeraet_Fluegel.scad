// Andre Betz
// github@AndreBetz.de

include <Ruehrgeraet_Daten.scad>

module fluegel() {
//  translate([-henkelDurchmesser/2,-henkelBreite/2-henkelUeber,-1])  
    cube([topfDurchmesserInnen,fluegelHoehe,platteDicke+2],false);
}

// 2D Projektion fuer SVG Datei
projection() 
{ 
  fluegel();
}
