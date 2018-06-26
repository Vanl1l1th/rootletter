class Particle {
  PVector loc;
  PVector vel;
  PVector acc;
  float lifespan;

  // Another constructor (the one we are using here)
  Particle(PVector l) {
    // Boring example with constant acceleration
    acc = new PVector(0,0.005,0);
    float vx = (float) generator.nextGaussian()*0.2;
    float vy = (float) generator.nextGaussian()*0.18 - 1.0;
    vel = new PVector(vx,vy,0);
    vel.mult(2);
    loc = l.get();
    loc.x=loc.x+int(random(-width*0.15,width*0.15));
    lifespan = 400;
  }

  void run() {
    update();
    render();
  }

  // Method to update location
  void update() {
    vel.add(acc);
    loc.add(vel);
    lifespan -= 1;
  }

  // Method to display
  void render() {
    imageMode(CENTER);
    tint(200,lifespan/3);
    image(texture,loc.x,loc.y,width*0.08,width*0.08);
  }
  
  // Is the particle still useful?
  boolean dead() {
    if (lifespan <= 0.0) {
      return true;
    } else {
      return false;
    }
  }
}