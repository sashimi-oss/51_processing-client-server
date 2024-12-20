import processing.net.*;
Client client;

void setup(){
  client = new Client(this, "127.0.0.1", 20000);
  //client = new Client(this, "192.168.36.76", 20000);
}

void draw(){}

void clientEvent(Client c){
  String s = c.readString();
  if(s != null){
    println("client received: " + s);
  }
}

void mouseClicked(){
  String s = "(" + mouseX + "," + mouseY + ") was clicked";
  println(s);
  client.write(s);
}