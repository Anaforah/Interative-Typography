boolean ativo=false;
boolean ativoGrande=false;
   
PFont font;
String tumulto = "Tumulto";
float fontsize = 30;
float fontsizeU = 30;
color fontcolor = #9D9D9C;
float[] larguras = {21.15, 18.33, 26.67, 18.33, 9.45, 11.1, 16.68};
float espacamento;

float inc;
float incTumulto;
boolean rotate = false;
float Mov;
float tamanho1;
float tamanho2;
float localizacao;

void setup() {
  size(360, 640);
    frameRate(30);
  
  font = createFont("Didot-Bold", fontsize);
  textFont(font);
  textAlign(CENTER, CENTER);
  espacamento = 5; 
    
}

void draw() {
  background(#1D1D1B);
  ativo = false;
  ativoGrande = false;
  rotate = false;
  fill(fontcolor);
  textSize(abs(fontsize));


  float larguraTotal = calcularLarguraTotal() + (larguras.length - 1) * espacamento;
  float xInicial = (width - larguraTotal) / 2;
  float x = xInicial;
  
  float mouseXDiff = abs(mouseX - pmouseX);
float mouseYDiff = abs(mouseY - pmouseY);
 Mov = mouseXDiff + mouseYDiff;
 
if(Mov >=0 && Mov <20){
  ativo =true;
} else if (Mov >=60){
  ativoGrande = true;
  rotate = true;
} else {
  ativo = false;
  ativoGrande=false;
  rotate=false;
   fill(fontcolor);
   textSize(abs(fontsize));
}

  for (int i = 0; i < tumulto.length(); i++) {
    char letter = tumulto.charAt(i);
    tamanho1=random(20,40);
    tamanho2=random(200,400);
    incTumulto = map(Mov,60,300,tamanho1,tamanho2);
    inc = map(Mov,20,60,5,20);
    
    if (i==3 && ativo==true) {
      fill(fontcolor);
      textSize(abs(fontsizeU + inc));
    } else{
      textSize(abs(fontsize));
      fill(fontcolor);
    }
if (ativoGrande == true && rotate ==true) {
  incTumulto += random(10, 100);
  textSize(abs(fontsize + incTumulto));
  if (i <= 3) {
    float mapRed = map(incTumulto, tamanho1, tamanho2, 157, 200);
    float mapGreen = map(incTumulto, tamanho1, tamanho2, 157, 32);
    float mapBlue = map(incTumulto, tamanho1, tamanho2, 156, 44);
    fill(mapRed, mapGreen, mapBlue);
  } else if (i <= 6) {
    float mapRed = map(incTumulto, tamanho1, tamanho2, 157, 255);
    float mapGreen = map(incTumulto, tamanho1, tamanho2, 157, 255);
    float mapBlue = map(incTumulto, tamanho1, tamanho2, 156, 255);
    fill(mapRed, mapGreen, mapBlue);
  }
  
      float r = random(0,TWO_PI);
      pushMatrix();
      translate( x + larguras[i] / 2, height / 2);
    rotate(map(incTumulto,tamanho1, tamanho2,0,r));
 
    text(letter, map(incTumulto,tamanho1,tamanho2,x + larguras[i] / 2,random(20,width-20)),
    map(incTumulto,tamanho1,tamanho2,height/2,localizacao));
    popMatrix();
}

    text(letter, x + larguras[i] / 2, height / 2);
    x += larguras[i] + espacamento;
  }

println("Diferença X: " + mouseXDiff);
println("Diferença Y: " + mouseYDiff);
}

float calcularLarguraTotal() {
  float larguraTotal = 0;
  for (float largura : larguras) {
    larguraTotal += largura;
  }
  return larguraTotal;
}
