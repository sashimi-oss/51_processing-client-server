import processing.serial.*; // シリアルライブラリをインポート
import processing.net.*;
Client client;

Serial myPort;  //シリアルポートのインスタンス
int available_serialport = 0; // シリアル検索プログラムで調べたシリアルポートの番号に変更
String arduinoPort = Serial.list()[available_serialport]; //
int x; //シリアルから読み取った値を入れる
int preX = 0;

void setup(){
  size(300, 300); // キャンバスサイズ
 myPort = new Serial(this, arduinoPort, 9600); // シリアルポートの設定
 client = new Client(this, "127.0.0.1", 20000);
 }

void draw(){
  background(251,252,239); //背景色をやわらかい色に
  noFill(); //図形をぬりつぶさない
  stroke(153,0,0) ;//線を赤っぽく
  strokeWeight(3);//線をちょっと太く
  ellipse(width/2,height/2,x,x); //キャンバスの中心に円を描画。サイズはシリアルの値(0-255)
  
  println("abs", abs(x - preX));
  if(abs(x - preX) > 10){
    String s = "シリアル通信で受け取った値：" + x;
    client.write(s);
  }
  preX = x;

}

void serialEvent(Serial p){
  x = p.read();  //xにシリアルの値を入れる
  println(x); //processingのシリアルモニタに数値を表示
}