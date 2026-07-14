// Ultrasonic sensor LED

const int LED = 13; // LEDはデジタルピン13に接続
int TRIG = 3;
int ECHO = 2;

double duration = 0;
double distance = 0;
double threshold = 10; // 10 cm
double speed_of_sound = 331.5 + 0.6 * 25; // 25℃の気温の想定

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);

  pinMode(LED,OUTPUT); // デジタルピンを出力に設定
  pinMode(ECHO, INPUT);
  pinMode(TRIG, OUTPUT);
}

void loop() {
  // put your main code here, to run repeatedly:
  digitalWrite(TRIG, LOW);
  delayMicroseconds(2);
  digitalWrite(TRIG, HIGH);
  delayMicroseconds(10);
  digitalWrite(TRIG, LOW);
  duration = pulseIn(ECHO, HIGH); //往復にかかった時間が返却される[マイクロ秒]

  if(duration>0) {
    duration = duration / 2; //往復にかかった時間
    distance = duration * speed_of_sound * 100 / 1000000;
    Serial.print("Distance: ");
    Serial.print(distance);
    Serial.println(" cm");

    if(distance<threshold){
      digitalWrite(LED, HIGH); // LEDを点ける
    } else {
      digitalWrite(LED, LOW); //LEDを消す
    }

  }

  delay(200);
}
