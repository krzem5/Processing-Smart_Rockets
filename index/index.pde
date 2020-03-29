static int ITERATION_PER_FRAME=10;
static int MAX_ROCKETS=500;
static PVector ROCEKT_START_POS=new PVector(0, 0);
static int LIFESPAN=600;
static float MAX_FORCE=4;
static PVector GOAL=new PVector(0, 0);

ArrayList<Rocket> rockets;
ArrayList<DNA> population;
ArrayList<Barrier> obstacles;
int TIME;
int RUN_ID;

void setup() {
  size(600, 400, P2D);
  ROCEKT_START_POS.set(width/2, height-50);
  GOAL.set(width/2, 50);
  rockets=new ArrayList<Rocket>();
  population=new ArrayList<DNA>();
  obstacles=new ArrayList<Barrier>();
  for (int i=0; i<5; i++) {
    obstacles.add(new Barrier(new PVector(floor(map(random(width-150), 0, width-150, 75, width-75)), floor(map(random(height-200), 0, height-200, 100, height-100))), floor(map(random(120), 0, 120, 30, 150)), floor(map(random(50), 0, 50, 15, 65)), map(random(1), 0, 1, -PI/10, PI/10)));
  }
  for (int i=0; i<MAX_ROCKETS; i++) {
    rockets.add(new Rocket(ROCEKT_START_POS, new DNA()));
  }
  TIME=0;
  RUN_ID=0;
  println("Run #"+str(RUN_ID));
}
void draw() {
  for (int i=0; i<ITERATION_PER_FRAME; i++) {
    background(0);
    push();
    ellipseMode(CENTER);
    noStroke();
    fill(220, 0, 20);
    circle(GOAL.x, GOAL.y, 50);
    pop();
    for (Barrier b : obstacles) {
      b.draw();
    }
    for (Rocket r : rockets) {
      r.update();
      r.draw();
    }
    TIME++;
    if (TIME==LIFESPAN) {
      TIME=0;
      RUN_ID++;
      populate();
      println("Run #"+str(RUN_ID));
    }
  }
}

void populate() {
  population=new ArrayList<DNA>();
  for (int i=0; i<MAX_ROCKETS; i++) {
    for (int j=0; j<rockets.get(i).fitness(); j++) {
      population.add(rockets.get(i).DNA);
    }
  }
  rockets=new ArrayList<Rocket>();
  for (int i=0; i<MAX_ROCKETS; i++) {
    DNA DNA_a=population.get(floor(random(population.size())));
    DNA DNA_b=population.get(floor(random(population.size())));
    rockets.add(new Rocket(ROCEKT_START_POS, DNA_a.crossover(DNA_b)));
  }
}
