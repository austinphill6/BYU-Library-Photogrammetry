#define FOCUS_PIN 9
#define SHUTTER_PIN 10

enum capture_sm { init_st, wait_st, focus_st, capture_st } current_st, next_st;



void setup() {
  pinMode(FOCUS_PIN,OUTPUT);
  pinMode(SHUTTER_PIN,OUTPUT);
}

void loop() {
switch(current_st)
  case init_st:
    next_st = wait_st; 
    break;
  case wait_st:
    if(/*TODO: button pushed*/)
      next_st = focus_st;
    else
      next_st = wait_st;
    break;
  case focus_st:
    if(/*focused*/)
      next_st = capture_st;
    else
      next_st = focus_st:  
      break;
  case capture_st:
    if(/**/)
      break;

switch(current_st)
  case init_st: 
    break;
  case wait_st:
    break;
  case focus_st:
    break;
  case capture_st:
    break;
  
  current_st = next_st;

}
