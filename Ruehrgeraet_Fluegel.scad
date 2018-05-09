// Andre Betz
// github@AndreBetz.de

include <Ruehrgeraet_Daten.scad>

module fluegel() {
    fluegelBreite = topfDurchmesserInnen - 80; 
    fluegelScale = fluegelBreite / 3 / fluegelHoehe;
    translate([-fluegelBreite/2,-fluegelHoehe/2,0])  
      cube([fluegelBreite,fluegelHoehe,platteDicke],false);
    translate([-fluegelBreite/2,fluegelHoehe/2,0])  
      cube([fluegelHoehe*fluegelScale,fluegelHoehe/2,platteDicke],false);
    translate([fluegelBreite/2-fluegelHoehe*fluegelScale,fluegelHoehe/2,0])  
      cube([fluegelHoehe*fluegelScale,fluegelHoehe/2,platteDicke],false);
    

}

module fluegelBohrung() {
    difference() {
        fluegel();
        translate([0,fluegelHoehe/4,-1])  
          cylinder(platteDicke+2,schraubeBohrloch/2,schraubeBohrloch/2,false);
        translate([0,-fluegelHoehe/4,-1])  
          cylinder(platteDicke+2,schraubeBohrloch/2,schraubeBohrloch/2,false);
    }
}
// 2D Projektion fuer SVG Datei
projection() 
{ 
  fluegelBohrung();
}
