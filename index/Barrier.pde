class Barrier {
  PVector pos;
  int w, h;
  float a;
  Barrier(PVector pos, int w, int h, float a) {
    this.pos=pos.copy();
    this.w=w;
    this.h=h;
    this.a=a;
  }
  Rect getRect() {
    return new Rect(this.pos.x, this.pos.y, this.w, this.h, this.a);
  }
  void draw() {
    push();
    translate(this.pos.x,this.pos.y);
    rotate(this.a);
    rectMode(CENTER);
    stroke(200,0,0,80);
    fill(180,0,0,40);
    rect(0,0,this.w,this.h);
    pop();
  }
}
