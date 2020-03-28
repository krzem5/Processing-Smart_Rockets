class Rocket {
  int WIDTH=6, HEIGHT=20;

  PVector pos;
  float rot;
  boolean dead;
  boolean reached_end;
  DNA DNA;
  Rocket(PVector pos, DNA DNA) {
    this.pos=pos.copy();
    this.rot=0;
    this.DNA=DNA;
    this.dead=false;
    this.reached_end=false;
  }
  void check_hit() {
    Rect rect=new Rect(this.pos.x, this.pos.y, this.WIDTH, this.HEIGHT, this.rot+HALF_PI);
    if (lineRect(new Line(0, 0, width, 0), rect)||lineRect(new Line(width, 0, width, height), rect)||lineRect(new Line(width, height, 0, height), rect)||lineRect(new Line(0, height, 0, 0), rect)) {
      this.dead=true;
      return;
    }
    for (Barrier b : obstacles) {
      if (rectRect(b.getRect(), rect)) {
        this.dead=true;
        return;
      }
    }
    if (GOAL.dist(this.pos)<=25){
      this.reached_end=true;
    }
  }
  void update() {
    if (this.dead==false&&this.reached_end==false) {
      PVector pp=this.pos.copy();
      this.pos.add(this.DNA.next());
      this.rot=this.pos.copy().sub(pp).heading();
      this.check_hit();
    }
  }
  int fitness() {
    if (this.dead==true) {
      return 1;
    }
    if (this.reached_end==true) {
      return 500;
    }
    return (int)map(constrain((int)GOAL.dist(this.pos)-50, 1, 300), 1, 300, 300, 1);
  }
  void draw() {
    push();
    translate(this.pos.x, this.pos.y);
    rotate(this.rot+HALF_PI);
    rectMode(CENTER);
    noStroke();
    fill(255, 50);
    rect(0, 0, this.WIDTH, this.HEIGHT);
    pop();
  }
}
