$fn = 30;

module oval_hole(length, diameter, depth) {
  hull() {
    translate([length, 0, 0]) {
      cylinder(d = diameter, depth, center = true);
    }
    cylinder(d = diameter, depth, center = true);
  }
}

module mount_holes(bolt_diam,
  inner_radius,
  outer_radius,
  hole_depth) {
  num_holes = 8;
  ang_inc = 360 / num_holes;
  for (angle = [0:ang_inc:360 - ang_inc]) {
    rotate([0, 0, angle]) {
      translate([inner_radius, 0, 0]) {
        length = outer_radius - inner_radius;
        oval_hole(length, bolt_diam, hole_depth);
      }
    }
  }
}

module motor_mount(
  inner_radius = 9,
  outer_radius = 10,
  bolt_diam = 3,
  mount_diam = 30,
  center_hole_diam = 5,
  mount_depth = 5) {

  hole_depth = mount_depth * 2 + 1;

  difference() {
    difference() {
      cylinder(d = mount_diam, mount_depth, center = true);
      mount_holes(bolt_diam, inner_radius, outer_radius, hole_depth);
    }
    cylinder(d = center_hole_diam, hole_depth, center = true);
  }
}

motor_mount();
