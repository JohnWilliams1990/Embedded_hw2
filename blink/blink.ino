//; John Williams
//; 105201054
//; February 12, 2019
//; Homework 2 
extern "C" {
  // function prototypes
  void start();
  void blink();
}

void setup() {
  Serial.begin(9600);
  start();
}

void loop() {
  blink();
  }
