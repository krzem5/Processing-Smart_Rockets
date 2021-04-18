class Rect{
	PVector a;
	PVector b;
	PVector c;
	PVector d;



	Rect(float x,float y,float w,float h,float a){
		this.a=new PVector((-w/2*cos(a)+h/2*sin(a))+x,(-w/2*sin(a)-h/2*cos(a))+y);
		this.b=new PVector((w/2*cos(a)+h/2*sin(a))+x,(w/2*sin(a)-h/2*cos(a))+y);
		this.c=new PVector((w/2*cos(a)-h/2*sin(a))+x,(w/2*sin(a)+h/2*cos(a))+y);
		this.d=new PVector((-w/2*cos(a)-h/2*sin(a))+x,(-w/2*sin(a)+h/2*cos(a))+y);
	}
}
