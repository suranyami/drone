
module brains(depth, diam) {
  $fn = 100;

  resize([diam, diam, depth]) {
    sphere(d = 1);
  }
}
