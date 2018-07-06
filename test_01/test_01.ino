#define FOCUS_PIN 9
#define SHUTTER_PIN 10
#define NUM_FOCUS_CYCLES 50
#define NUM_CAPTURE_CYCLES 50

enum capture_sm { init_st, wait_st, focus_st, capture_st } current_st, next_st;



void setup() {
  pinMode(FOCUS_PIN,OUTPUT);
  pinMode(SHUTTER_PIN,OUTPUT);
  uint32_t counter;
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
    if(counter >= NUM_FOCUS_CYCLES)
      {
        next_st = capture_st;
        counter = 0;
      }
    else
      next_st = focus_st;  
      break;
  case capture_st:
    if(counter >= NUM_CAPTURE_CYCLES)
    {
      next_st = wait_st;
      counter = 0;
    }
      
      break;

switch(current_st)
  case init_st: 
    break;
  case wait_st:
    break;
  case focus_st:
    counter++;
    break;
  case capture_st:
    counter++;
    break;
  
  current_st = next_st;

}
