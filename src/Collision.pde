boolean collision_line_line(Line l1,Line l2){
	return (((l2.ex-l2.sx)*(l1.sy-l2.sy)-(l2.ey-l2.sy)*(l1.sx-l2.sx))/((l2.ey-l2.sy)*(l1.ex-l1.sx)-(l2.ex-l2.sx)*(l1.ey-l1.sy))>=0&&((l2.ex-l2.sx)*(l1.sy-l2.sy)-(l2.ey-l2.sy)*(l1.sx-l2.sx))/((l2.ey-l2.sy)*(l1.ex-l1.sx)-(l2.ex-l2.sx)*(l1.ey-l1.sy))<=1&&((l1.ex-l1.sx)*(l1.sy-l2.sy)-(l1.ey-l1.sy)*(l1.sx-l2.sx))/((l2.ey-l2.sy)*(l1.ex-l1.sx)-(l2.ex-l2.sx)*(l1.ey-l1.sy))>=0&&((l1.ex-l1.sx)*(l1.sy-l2.sy)-(l1.ey-l1.sy)*(l1.sx-l2.sx))/((l2.ey-l2.sy)*(l1.ex-l1.sx)-(l2.ex-l2.sx)*(l1.ey-l1.sy))<=1);
}



boolean collision_line_rect(Line l,Rect r){
	return (collision_line_line(l,new Line(r.a.x,r.a.y,r.b.x,r.b.y))||collision_line_line(l,new Line(r.b.x,r.b.y,r.c.x,r.c.y))||collision_line_line(l,new Line(r.c.x,r.c.y,r.d.x,r.d.y))||collision_line_line(l,new Line(r.d.x,r.d.y,r.a.x,r.a.y)));
}



boolean collision_rect_rect(Rect r1,Rect r2){
	return (collision_line_rect(new Line(r1.a.x,r1.a.y,r1.b.x,r1.b.y),r2)||collision_line_rect(new Line(r1.b.x,r1.b.y,r1.c.x,r1.c.y),r2)||collision_line_rect(new Line(r1.c.x,r1.c.y,r1.d.x,r1.d.y),r2)||collision_line_rect(new Line(r1.d.x,r1.d.y,r1.a.x,r1.a.y),r2));
}
