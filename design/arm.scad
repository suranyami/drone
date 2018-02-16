use <sweep/sweep.scad>
use <scad-utils/transformations.scad>
use <scad-utils/shapes.scad>

module arm(diam = 10, height = 100) {
  $fn = 50;
  function func1(x) = 2 - pow(sin(x * 90), 2);

  pathstep = 1;
  $fn = 24;

  shape_points = circle(diam);

  path_transforms1 = [
  for (i = [0:pathstep:height])
    let(t = i/height)
      translation([0, 0, i])
      * scaling([func1(t), 1, 1])
  ];

  sweep(shape_points, path_transforms1);
}

arm();
