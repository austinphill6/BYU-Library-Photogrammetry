#define FOCUS 2
#define SHUTTER 3

void setup()
{
  pinMode(FOCUS,OUTPUT);
  pinMode(SHUTTER,OUTPUT);
}

void loop()
{
  delay(500);
  digitalWrite(FOCUS,HIGH);
  delay(500);
  digitalWrite(SHUTTER,HIGH);
  delay(100);
  digitalWrite(SHUTTER,LOW);
  digitalWrite(FOCUS,LOW);
  delay(10000);
}
