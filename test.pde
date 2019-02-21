import de.voidplus.leapmotion.*;
import processing.video.*;
PImage img;

LeapMotion leap;
Movie Movie1;
Movie Movie2;

void setup() {
  size(2224, 1668);
  img = loadImage("IMG1.jpeg");
  //background(0);
  Movie1 = new Movie(this, "1.mp4");
  Movie2 = new Movie(this, "2.mp4");
  leap = new LeapMotion(this);
}

void draw() {
  //
  //image(myMovie, 0, 0);
  for (Hand hand : leap.getHands ()){
    //println("pitch ", hand.getPitch(), " roll ", hand.getRoll(), " yaw ", hand.getYaw());
    println("wo quan shu: " + hand.getGrabStrength());
    //hand.draw();
    if(hand.getGrabStrength()>=0.4){
      image(Movie1, 0, 0);
      Movie1.loop();
    } else {
     
     image(Movie2, 0, 0);
      Movie2.loop();
    }
  }
}

void movieEvent(Movie m) {
  m.read();
}
