// logo.scad - Basic example of module, top-level variable and $fn usage

// The $fn parameter will influence all objects inside this module
// It can, optionally, be overridden when instantiating the module
module Logo(size=50, fn=100) {
    // Temporary variables
    hole = size/2;
    cylinderHeight = size * 1.25;

    // One positive object (sphere) and three negative objects (cylinders)
    difference() {
        sphere(r=size/2);

        cylinder(r1=hole / 2, r2=hole/2, h=cylinderHeight, center=true);
        // The '#' operator highlights the object
        rotate(a = [90, 0, 0]) cylinder(r1=hole / 2, r2=hole/2, h=cylinderHeight, center=true);
        rotate(a = [0, 90, 0]) cylinder(r1=hole / 2, r2=hole/2, h=cylinderHeight, center=true);
    }
}

Logo(50);

