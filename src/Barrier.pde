class Barrier{
	PVector p;
	int w;
	int h;
	float a;



	Barrier(PVector p,int w,int h,float a){
		this.p=p.copy();
		this.w=w;
		this.h=h;
		this.a=a;
	}



	Rect getRect(){
		return new Rect(this.p.x,this.p.y,this.w,this.h,this.a);
	}



	void draw(){
		push();
		translate(this.p.x,this.p.y);
		rotate(this.a);
		rectMode(CENTER);
		stroke(200,0,0,80);
		fill(180,0,0,40);
		rect(0,0,this.w,this.h);
		pop();
	}
}
