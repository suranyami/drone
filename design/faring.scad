use <arc.scad>

module faring(inner_diam = 127,
  curve_radius = 50,
  angles = [145, 180],
  width = 1,
  fn = 100) {

    translate([0, 0, -(curve_radius  / 4)]) {
      rotate_extrude() {
        $fn = fn;
        translate([inner_diam / 2 + curve_radius, 0, 0]) {
          arc(curve_radius, angles, width, fn);
        }
      }
    }
  }

  faring(127, fn = 100);
