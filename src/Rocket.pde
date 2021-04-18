class Rocket{
	PVector pos;
	float rot;
	boolean dead;
	boolean end;
	DNA dna;



	Rocket(PVector pos,DNA dna){
		this.pos=pos.copy();
		this.rot=0;
		this.dna=dna;
		this.dead=false;
		this.end=false;
	}



	void check_hit(){
		Rect rect=new Rect(this.pos.x,this.pos.y,ROCKET_WIDTH,ROCKET_HEIGHT,this.rot+HALF_PI);
		if (collision_line_rect(new Line(0,0,width,0),rect)||collision_line_rect(new Line(width,0,width,height),rect)||collision_line_rect(new Line(width,height,0,height),rect)||collision_line_rect(new Line(0,height,0,0),rect)){
			this.dead=true;
			return;
		}
		for (Barrier b:bl){
			if (collision_rect_rect(b.getRect(),rect)){
				this.dead=true;
				return;
			}
		}
		if (GOAL.dist(this.pos)<=25){
			this.end=true;
		}
	}



	void update(){
		if (this.dead==false&&this.end==false){
			PVector pp=this.pos.copy();
			this.pos.add(this.dna.next());
			this.rot=this.pos.copy().sub(pp).heading();
			this.check_hit();
		}
	}



	int fitness(){
		if (this.dead==true){
			return 1;
		}
		if (this.end==true){
			return 500;
		}
		return (int)map(constrain((int)GOAL.dist(this.pos)-50,1,300),1,300,300,1);
	}



	void draw(){
		push();
		translate(this.pos.x,this.pos.y);
		rotate(this.rot+HALF_PI);
		rectMode(CENTER);
		noStroke();
		fill(255,50);
		rect(0,0,ROCKET_WIDTH,ROCKET_HEIGHT);
		pop();
	}
}
