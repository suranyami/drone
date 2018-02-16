use <faring.scad>
use <motor-mount.scad>
use <brains.scad>

num_arms = 4;

angle_inc = 360 / num_arms;
/* echo(angle = angle_inc); */
arm_length = 60;
arm_diam = 20;
arm_wall_thickness = 5;
arm_inner_diam = arm_diam - arm_wall_thickness;

prop_diam = 127;
prop_radius = prop_diam / 2;

brains_depth = 50;
brains_diam = 150;
brains_radius = brains_diam / 2;

overlap = 7;

for (angle = [0:angle_inc:360 - angle_inc]) {
  rotate([0, 0, angle]) {

    difference() {
      union() {
        // arms that connect fan to brains
        translate([brains_radius + arm_length / 2 - overlap, 0, 0]) {
          rotate(90, [0, 1, 0])
          cylinder(d = arm_diam, arm_length + overlap * 2, center = true);
        }

        translate([arm_length + brains_radius + prop_radius, 0, 0]) {
          faring(prop_diam, fn = 100);

          motor_mount(
            inner_radius = 10,
            outer_radius = 20,
            bolt_diam = 3,
            mount_diam = 50,
            center_hole_diam = 10,
            mount_depth = 5);
        }
      }
      translate([brains_radius + arm_length / 2 - overlap, 0, 0]) {
        rotate(90, [0, 1, 0])
        cylinder(d = arm_inner_diam, arm_length + overlap * 3, center = true);
      }
    }
  }
}

brains(brains_depth, brains_diam);
