                                                import processing.serial.*;

String armazenaTensao;
int entPorta=0, X = 30, Y =0;
float tensao = 0;

Serial myPort;

void setup(){
    //Criar a janela 850x590
    size(850, 540);
    background(245,235,44);
    
    //Cria o retangulo preto
    fill(20,20,20);
    rect(10, 10, 830, 520, 7);
    
    
    //Define a tipo de fonte, o tamanho do titulo, o alinhamento e a cor 
    //textFont(createFont("Arial Bold", 36));
    textFont(createFont("OCR A Extended", 35));
    textAlign(LEFT);
    fill(255);
    text("Interface Gráfica ", 15, 395);
    text("para Conversor", 15, 435);
    text("ADC0804", 15, 475);
  
    //Deseha retangulo 
    telaGrafico();
   

    //textFont(createFont("Arial Bold", 20));
    textFont(createFont("OCR A Extended", 20));
    fill(255);
    text("Voltage", 495, 395);

    //Texto do rodapé
    textSize(15);
    fill(#848484);
    text("© 2017 Rodrigo da Silva Ribeiro ", 545, 527);
    
    //Inicializa a porta serial
    myPort = new Serial(this, "COM3", 9600);
    //Impede o void draw() de executar em loop
    noLoop();
}

void draw(){
    Y = 320 - entPorta;
    stroke(#CD0F0F);
    strokeWeight(4);
    point(X, Y);
    X++;
    if (X > 825){
        X = 30;
        stroke(0);
        telaGrafico();
    }
    imprimeTensao();
    print(Y +"\n");
}

//VERIFICA OS EVENTOS NA PORTA SERIAL E FAZ A QUANTIZAÇÃO
void serialEvent(Serial myPort){
    entPorta = myPort.read();
    tensao = 0.01953 * entPorta; 
    redraw();
}

//DESENHA A TELA DO GRÁFICO
void telaGrafico(){
    fill(211,211,209);
    strokeWeight(2);
    rect(15, 20, 816, 320); //retângulo
    //Traça os eixos
    stroke(0); //muda a cor da linha
    strokeWeight(2);
    line(30, 20, 30, 320); //linha vertical
    line(30, 320, 830, 320); //linha horizontal
    int i; 
    //Traça a escala
    strokeWeight(0.3);
    for(i=70; i<350; i+=50)
      line(30, i, 830, i); //linha horizontal i=y 
    for(i=30; i<830; i+=50)
      line(i, 20, i, 320); //linha vertical i=x
    
    //Desenha os numeros no eixo y 
    textSize(12);
    fill(0);
    text("5", 19, 73);
    text("4", 19, 123);
    text("3", 19, 173); 
    text("2", 19, 223); 
    text("1", 19, 273);
    text("0", 19, 323);
    text("y(t) = V", 36, 40);  
}

//IMPRIME O VALOR DA TENSÃO
void imprimeTensao(){
    fill(#818111);
    stroke(0);
    strokeWeight(1);
    rect(490, 400, 340, 80, 5);
    fill(0);
    //textFont(createFont("IrisUPC", 58));
    textFont(createFont("OCR A Extended", 45));
    armazenaTensao = str(tensao); //converte float para string  
    text(armazenaTensao + "V", 495, 455);
    armazenaTensao = "";
}





