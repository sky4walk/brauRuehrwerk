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
   //Scharnier
      translate([scharnierPosMitte,-henkelBreite/2-henkelUeber-scharnierHoehe,-1])  
        cylinder(platteDicke+2,schraubeBohrlochM5/2,schraubeBohrlochM5/2,false); 
      translate([scharnierPosMitte+scharnierAbstandLoch,-henkelBreite/2-henkelUeber-scharnierHoehe,-1])  
        cylinder(platteDicke+2,schraubeBohrlochM5/2,schraubeBohrlochM5/2,false);
      translate([-scharnierPosMitte,-henkelBreite/2-henkelUeber-scharnierHoehe,-1])  
        cylinder(platteDicke+2,schraubeBohrlochM5/2,schraubeBohrlochM5/2,false); 
      translate([-scharnierPosMitte-scharnierAbstandLoch,-henkelBreite/2-henkelUeber-scharnierHoehe,-1])  
        cylinder(platteDicke+2,schraubeBohrlochM5/2,schraubeBohrlochM5/2,false); 
 
 // halterung ohne scharnier    
    translate([scharnierPosMitte+scharnierAbstandLoch/4,-henkelBreite/2-henkelUeber-scharnierAbstandLoch/5*4,-1])
      cube([scharnierAbstandLoch/2,scharnierAbstandLoch/5*4,platteDicke+2],false); 
    translate([scharnierPosMitte,-henkelBreite/2-henkelUeber-scharnierAbstandLoch/5*4,-1])
      cube([scharnierAbstandLoch,scharnierAbstandLoch/4,platteDicke+2],false);
      
    translate([-scharnierPosMitte-scharnierAbstandLoch/4*3,-henkelBreite/2-henkelUeber-scharnierAbstandLoch/5*4,-1])
      cube([scharnierAbstandLoch/2,scharnierAbstandLoch/5*4,platteDicke+2],false); 
    translate([-scharnierPosMitte-scharnierAbstandLoch,-henkelBreite/2-henkelUeber-scharnierAbstandLoch/5*4,-1])
      cube([scharnierAbstandLoch,scharnierAbstandLoch/4,platteDicke+2],false);      
      
 }
 
}

module stoerstelle() {
 difference() {
     translate([-stoerBlechLaenge/2,-scharnierAbstandLoch-scharnierHoehe*2,-1])  
       cube([stoerBlechLaenge,scharnierAbstandLoch+scharnierHoehe*2,platteDicke],false);
     // Bohrungen
     translate([-stoerBlechLaenge/2+scharnierHoehe,-scharnierHoehe,-1])  
        cylinder(platteDicke+2,schraubeBohrlochM5/2,schraubeBohrlochM5/2,false); 
     translate([-stoerBlechLaenge/2+scharnierHoehe,-scharnierHoehe-scharnierAbstandLoch,-1])  
        cylinder(platteDicke+2,schraubeBohrlochM5/2,schraubeBohrlochM5/2,false); 
 }
}

// 2D Projektion fuer SVG Datei
projection() 
{ 
// Klappe mit scharnieren daran befestigen
    klappe();
// Stoerblech
    stoerstelle();
}
