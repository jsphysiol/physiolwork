// Ultrasonic sensor LED

int TRIG = 3;
int ECHO = 2;

double duration = 0;
double distance = 0;
double speed_of_sound = 331.5 + 0.6 * 25; // 25℃の気温の想定

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);

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
  }

  delay(200);
}
