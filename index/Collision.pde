boolean lineLine(Line l1, Line l2) {
  return (((l2.ex-l2.sx)*(l1.sy-l2.sy)-(l2.ey-l2.sy)*(l1.sx-l2.sx))/((l2.ey-l2.sy)*(l1.ex-l1.sx)-(l2.ex-l2.sx)*(l1.ey-l1.sy))>=0&&((l2.ex-l2.sx)*(l1.sy-l2.sy)-(l2.ey-l2.sy)*(l1.sx-l2.sx))/((l2.ey-l2.sy)*(l1.ex-l1.sx)-(l2.ex-l2.sx)*(l1.ey-l1.sy))<=1&&((l1.ex-l1.sx)*(l1.sy-l2.sy)-(l1.ey-l1.sy)*(l1.sx-l2.sx))/((l2.ey-l2.sy)*(l1.ex-l1.sx)-(l2.ex-l2.sx)*(l1.ey-l1.sy))>=0&&((l1.ex-l1.sx)*(l1.sy-l2.sy)-(l1.ey-l1.sy)*(l1.sx-l2.sx))/((l2.ey-l2.sy)*(l1.ex-l1.sx)-(l2.ex-l2.sx)*(l1.ey-l1.sy))<=1);
}
boolean lineRect(Line l, Rect r) {
  return (lineLine(l, new Line(r.a.x, r.a.y, r.b.x, r.b.y))||lineLine(l, new Line(r.b.x, r.b.y, r.c.x, r.c.y))||lineLine(l, new Line(r.c.x, r.c.y, r.d.x, r.d.y))||lineLine(l, new Line(r.d.x, r.d.y, r.a.x, r.a.y)));
}
boolean rectRect(Rect r1, Rect r2) {
  return (lineRect(new Line(r1.a.x, r1.a.y, r1.b.x, r1.b.y), r2)||lineRect(new Line(r1.b.x, r1.b.y, r1.c.x, r1.c.y), r2)||lineRect(new Line(r1.c.x, r1.c.y, r1.d.x, r1.d.y), r2)||lineRect(new Line(r1.d.x, r1.d.y, r1.a.x, r1.a.y), r2));
}
class Line {
  float sx, sy, ex, ey;
  Line(float sx, float sy, float ex, float ey) {
    this.sx=sx;
    this.sy=sy;
    this.ex=ex;
    this.ey=ey;
  }
}
class Rect {
  PVector a, b, c, d;
  Rect(float x, float y, float w, float h, float a) {
    this.a=rotate_point(x-w/2, y-h/2, x, y, a);
    this.b=rotate_point(x+w/2, y-h/2, x, y, a);
    this.c=rotate_point(x+w/2, y+h/2, x, y, a);
    this.d=rotate_point(x-w/2, y+h/2, x, y, a);
  }
}
PVector rotate_point(float x, float y, float ox, float oy, float a) {
  return new PVector(((x-ox)*cos(a)-(y-oy)*sin(a))+ox, ((x-ox)*sin(a)+(y-oy)*cos(a))+oy);
}
