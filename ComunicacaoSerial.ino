
int led = 13,
ad0 = 2,
ad1 = 3,
ad2 = 4,
ad3 = 5,
ad4 = 6,
ad5 = 7,
ad6 = 8,
ad7 = 9,
wr = 10;
boolean serial [8] = {
};

void setup() {                
  Serial.begin(9600);
  pinMode(led, OUTPUT);     
  pinMode(wr, OUTPUT);     
  pinMode(ad0, INPUT);     
  pinMode(ad1, INPUT);     
  pinMode(ad2, INPUT);     
  pinMode(ad3, INPUT);     
  pinMode(ad4, INPUT);     
  pinMode(ad5, INPUT);     
  pinMode(ad6, INPUT);     
  pinMode(ad7, INPUT);     
}

void loop() {
  digitalWrite(led, HIGH);  
  digitalWrite(wr, HIGH);  
  delay(1);             
  digitalWrite(led, LOW);   
  digitalWrite(wr, LOW);    
  delay(1);              
  serial[7] = digitalRead(ad7);
  serial[6] = digitalRead(ad6);
  serial[5] = digitalRead(ad5);
  serial[4] = digitalRead(ad4);
  serial[3] = digitalRead(ad3);
  serial[2] = digitalRead(ad2);
  serial[1] = digitalRead(ad1);
  serial[0] = digitalRead(ad0);
  int i,saida = 0;
  double  pot, tensao;
  for(i = 0; i < 8; i++){
    pot = pow(2,i);
    saida += serial[i] * pot;
  }   

  Serial.write(saida); 
}

