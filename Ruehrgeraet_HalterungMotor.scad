platteDicke = 8;
topfDurchmesser = 490;
henkelBreite = 130;
henkelDurchmesser = 550;
motorBohrloch = 20;

module deckel() {
cylinder(platteDicke,topfDurchmesser/2,topfDurchmesser/2,false);
translate([-henkelDurchmesser/2,-henkelBreite/2,0])
  cube([henkelDurchmesser,henkelBreite,platteDicke],false);
}

module motorBefestigung() {
    difference() {
      deckel();
      translate([-henkelDurchmesser/2,-topfDurchmesser/2-henkelBreite/2,-1])  
        cube([henkelDurchmesser,topfDurchmesser/2,platteDicke+2],false);
      translate([0,0,-1])  
        cylinder(platteDicke+2,motorBohrloch/2,motorBohrloch/2,false);
    }
}

module klappe() {
 difference() {
   cylinder(platteDicke,topfDurchmesser/2,topfDurchmesser/2,false);
   translate([-henkelDurchmesser/2,-henkelBreite/2,-1])  
     cube([henkelDurchmesser,topfDurchmesser/2+henkelBreite/2,platteDicke+2],false);
     
 }
}

klappe();
motorBefestigung();