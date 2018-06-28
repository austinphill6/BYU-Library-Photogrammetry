void setup() {
  pinMode(6,OUTPUT);
  pinMode(5,OUTPUT);
  

}

void loop() {
  // put your main code here, to run repeatedly:
  digitalWrite(6,HIGH);
  digitalWrite(5,LOW);

  delay(500);
  
  digitalWrite(6,LOW);
  digitalWrite(5,HIGH);

  delay(500);


  

}
