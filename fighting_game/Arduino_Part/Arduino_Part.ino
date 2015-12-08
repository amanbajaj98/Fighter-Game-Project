const int fsrOne = A0;
const int fsrTwo = A1;

int sensorValOne = 0;
int sensorValTwo = 0;

void setup()
{
  Serial.begin(9600);
  pinMode(fsrOne,INPUT);
  pinMode(fsrTwo,INPUT);
}

void loop()
{
  sensorValOne = analogRead(fsrOne);
  sensorValTwo = analogRead(fsrTwo);
  
  Serial.print(sensorValOne);
  Serial.print(",");
  Serial.println(sensorValTwo);
  delay(20);
}
