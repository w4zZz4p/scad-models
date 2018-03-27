$fn=50;

HOLDER_D = 20;
HOLDER_H = 20;
BEARING_D = 16;
BEARING_H = 5;

module base() {
    difference() {
        cylinder(h=HOLDER_H, r=HOLDER_D/2+0.5, center=true);
        translate([0, 0, HOLDER_H/2]) 
            rotate_extrude(convexity = 10)
                translate([HOLDER_D/2 - 1, 0, 0])
                    circle(r = 1);
        translate([0, 0, HOLDER_H/2 + HOLDER_D/3.05])
            sphere(HOLDER_D/2);
    }
}

module holder_support() {
    difference() {
        base();
        translate([0, 0, -HOLDER_H/2 + BEARING_H/2])
            cylinder(h=BEARING_H, r=BEARING_D/2, center=true);
        translate([0, 0, -HOLDER_H/2 + BEARING_H/2 + BEARING_H])
            cylinder(h=BEARING_H + 4, r=BEARING_D/2 - 1, center=true);
    }
}

module holder_stepper() {
    hole_height = 10;
    difference() {
        base();
        translate([0, 0, -HOLDER_H/2 + hole_height/2])
            cylinder(h=hole_height, r=2.5, center=true);
        translate([0, 0, -HOLDER_H/2 + hole_height/2])
            rotate([90, 0, 0])
                cylinder(h=HOLDER_D*2, r=1.5, center=true);
    }
}

holder_support();

