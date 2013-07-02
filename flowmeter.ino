/*
    Carriots.com
 Created: April 10, 2013
 */

int flowPin = 2;    //flowmeter pin number
int pulsesCounter = 0;
int previousMeasure = 0;
int counter = 0;

void rpm ()     
{
  pulsesCounter++;  
}

void setup()
{
  pinMode(flowPin, INPUT); // Initialize the digital pin as an output
  Serial.begin(9600); // Start serial port
  attachInterrupt(0, rpm, RISING); //Interrupt is attached
}

void loop ()
{
  sei();            //Enable interrupts
  delay (15);
  cli();            //Disable interrupts
  if ((pulsesCounter == previousMeasure) && (pulsesCounter != 0)) {
    counter += 1;
  }

  previousMeasure = pulsesCounter;

  if ((counter == 50) && (pulsesCounter != 0)) { // Send pulses number to Raspberry Pi
    Serial.print("pulses:");
    Serial.println (pulsesCounter, DEC); //Prints the pulses number
    pulsesCounter = 0;
    previousMeasure = 0;
    counter = 0;
  }
}

