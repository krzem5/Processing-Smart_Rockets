final int ITERATION_PER_FRAME=10;
final int BARRIER_COUNT=10;
final int MAX_ROCKETS=500;
final PVector ROCEKT_START_POS=new PVector(0,0);
final int ROCKET_WIDTH=10;
final int ROCKET_HEIGHT=50;
final int LIFESPAN=1200;
final float MAX_FORCE=4;
final PVector GOAL=new PVector(0,0);



ArrayList<Rocket> rl;
ArrayList<DNA> pl;
ArrayList<Barrier> bl;
int tm;
int id;



void setup(){
	size(1920,1080,P2D);
	ROCEKT_START_POS.set(width/2,height-50);
	GOAL.set(width/2,50);
	rl=new ArrayList<Rocket>();
	pl=new ArrayList<DNA>();
	bl=new ArrayList<Barrier>();
	for (int i=0;i<BARRIER_COUNT;i++){
		bl.add(new Barrier(new PVector(floor(map(random(width-150),0,width-150,75,width-75)),floor(map(random(height-200),0,height-200,100,height-100))),floor(random(450)+60),floor(random(250)+25),map(random(1),0,1,-PI/10,PI/10)));
	}
	for (int i=0;i<MAX_ROCKETS;i++){
		rl.add(new Rocket(ROCEKT_START_POS,new DNA()));
	}
	tm=0;
	id=0;
	println("Run #"+str(id));
}



void draw(){
	for (int i=0;i<ITERATION_PER_FRAME;i++){
		background(0);
		push();
		ellipseMode(CENTER);
		noStroke();
		fill(220,0,20);
		circle(GOAL.x,GOAL.y,100);
		pop();
		for (Barrier b:bl){
			b.draw();
		}
		for (Rocket r:rl){
			r.update();
			r.draw();
		}
		tm++;
		if (tm==LIFESPAN){
			tm=0;
			id++;
			pl.clear();
			for (int j=0;j<MAX_ROCKETS;j++){
				for (int k=0;k<rl.get(j).fitness();k++){
					pl.add(rl.get(j).dna);
				}
			}
			rl.clear();
			for (int j=0;j<MAX_ROCKETS;j++){
				rl.add(new Rocket(ROCEKT_START_POS,pl.get(floor(random(pl.size()))).crossover(pl.get(floor(random(pl.size()))))));
			}
			println("Run #"+str(id));
		}
	}
}
