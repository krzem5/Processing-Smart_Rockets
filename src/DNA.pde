class DNA{
	PVector[] g;
	int ci=0;



	DNA(){
		this.g=new PVector[LIFESPAN];
		for (int i=0;i<LIFESPAN;i++){
			if (i==0){
				this.g[i]=PVector.random2D();
				this.g[i].setMag(MAX_FORCE);
			}
			else{
				this.g[i]=PVector.fromAngle(this.g[i-1].heading()+radians(map(random(1),0,1,-5,5)));
				this.g[i].setMag(MAX_FORCE);
			}
		}
	}



	PVector next(){
		this.ci++;
		return this.g[this.ci-1];
	}



	DNA crossover(DNA other){
		DNA o=new DNA();
		for (int i=0;i<LIFESPAN;i++){
			if (random(1)<0.5){
				o.g[i]=this.g[i];
			}
			else{
				o.g[i]=other.g[i];
			}
			if (random(1)<0.001&&i>0){
				o.g[i]=PVector.fromAngle(o.g[i-1].heading()+radians(map(random(1),0,1,-5,5)));
				o.g[i].setMag(MAX_FORCE);
			}
		}
		return o;
	}
}
