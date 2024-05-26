////
////      QUANDO FOR FAZER OS BOTÕES MÃO DEIXAR O BOTÃO CERTO DA PROXIMA FASE NA MESMA POSIÇÃO DO DA FASE ANTERIOR
////      QUANDO CLICA NO BOTÃO DA FASE ANTERIOR SÃO REGISTRADOS MAIS DE UM CLICK E O BOTÃO DA PROXIMA FASE TAMBEM É CLICKADO
////
////      TODO: Deixar o jogo mais colorido e arrumar a posição dos texto e botões
////
import processing.video.*;
import processing.sound.*;
Movie movie;


SoundFile music;
SoundFile victory;


// Imagem da pergunta
PImage imgLettuce;
String LETT_PATH = "C:/Users/Pichau/Desktop/carroots/Lettuce.jpeg";

PImage imgBeans;
String BEANS_PATH = "C:/Users/Pichau/Desktop/carroots/Beans.jpeg";


// Mudar caminho do arquivo dependendo de onde estiver no computador
String MOVIE_PATH = "C:/Users/Pichau/Desktop/carroots/CARROOTS.mp4";

String GAME_MUSIC_PATH = "C:/Users/Pichau/Desktop/carroots/questionMusic.mp3";

String VICTORY_MUSIC_PATH = "C:/Users/Pichau/Desktop/carroots/victoryMusic.mp3";

// Variavel que guarda em qual pergunta/fase o jogador esta 
int question = 0;

// EXTREMA IMPORTANCIA
int stopMus = 0;
int stopVic = 0;

void setup()
{
  fullScreen();
  // TODO: Definir cor decente pro jogo
  background(#FFFFFF);
  
  // Images setups
  imgLettuce = loadImage(LETT_PATH);
  imgBeans = loadImage(BEANS_PATH);
  
  movie = new Movie(this, MOVIE_PATH);
  movie.play();
  
  music = new SoundFile(this, GAME_MUSIC_PATH);
  victory = new SoundFile(this, VICTORY_MUSIC_PATH);
}

void draw()
{    
  
  if (movie.available()) {
    movie.read();
  }
  
  // Troca de fase de acordo com a variavel question
  // question 0 = menu, question 1 = fase 1, ..., question n = parabens/final do jogo
  switch (question)
  {
    // Adiconar mais fases
    // Copia e cola do case ate o break, muda o numero do case e a função que é chamada
    case 0: // caso question n chama funão n
      p0(); // Função da fase  
      break;
    case 1:
       p1();
       break;
    case 2:
       p2();
       break;
    case 3:
       p3();
       break;
    case 4:
       p4();
       break;
    case 5:
       p5();
       break; 
    case 6:
       p6();
       break; 
    case 7:
       p7();
       break; 
  }

}


// Fase 0
// NÃO copiar essa fase para modelo das proximas
void p0()
{
  // Tamanho do text / Cor do texto / Pergunta da fase
  textSize(128);
  fill(255, 0, 0);
  
  // Inicia video aula
  image(movie, 0, 0);
  // Desenha o botão
  // X / Y / Pergunta / Botão certo = true - Botão errado = false
  button(width - 220, height - 110, "Skip", true);
}

// Fase 1
// Para criar mais fases copiar e colar depois da ultima fase
// Modificar como desejado
// E chamar no switch case
void p1()
{
  movie.stop();
   if (stopMus < 1)
  {
      music.play();
  }
  stopMus++;
  
  // Limpa a tela da ultima fase e desenha a prxima
  clearScreen();
  textSize(40);
  fill(#000000);
  text("Uma alimentação balanceada precisa ter proteínas,\n    carboidratos e salada. Verdadeiro ou Falso?", 160, 180);
   
  button(width/2 - 400, height/2 + 100, "Verdadeiro", true);
  button(width/2 - 100, height/2 + 100, "Falso", false);
}

void p2()
{
  clearScreen();
  textSize(128);
  fill(#000000);
  text("Qual comida é 'Red'?", 260, 180);
  
  button(width/2 - 400, height/2 + 150, "Carrot", false);
  button(width/2 - 100, height/2 + 150, "Lettuce", false);
  button(width/2 - 400, height/2, "Tomato", true);
  button(width/2 - 100, height/2, "Beans", false);

}

void p3()
{
  clearScreen();
  textSize(128);
  fill(#000000);
  text("Qual é o nome desse alimento?", 160, 180);
 
  
  image(imgLettuce, 1080, 300);
  button(width/2 - 400, height/2 + 150, "Rice", false);
  button(width/2 - 100, height/2 + 150, "Chicken", false);
  button(width/2 - 400, height/2, "Tomato", false);
  button(width/2 - 100, height/2, "Lettuce", true);
}
void p4()
{
  clearScreen();
  textSize(80);
  fill(#000000);
  text("Como se fala o nome desse alimento em inglês?", 120, 180);
 
  
  image(imgBeans, 1080, 300);
  button(width/2 - 400, height/2 + 150, "Chicken", false);
  button(width/2 - 100, height/2 + 150, "Beans", true);
  button(width/2 - 400, height/2, "Carrot", false);
  button(width/2 - 100, height/2, "Tomato", false);
}
void p5()
{
  clearScreen();
  textSize(128);
  fill(#000000);
  text("O que é 'Rice'?", 520, 180);
 

  button(width/2 - 400, height/2 + 150, "Arroz", true);
  button(width/2 - 100, height/2 + 150, "Tomate", false);
  button(width/2 - 400, height/2, "Cenoura", false);
  button(width/2 - 100, height/2, "Alface", false);
}
void p6()
{
  clearScreen();
  textSize(128);
  fill(#000000);
  text("Como se fala 'Marrom' em inglês?", 100, 180);
 
  
  button(width/2 - 400, height/2 + 150, "White", false);
  button(width/2 - 100, height/2 + 150, "Red", false);
  button(width/2 - 400, height/2, "Brown", true);
  button(width/2 - 100, height/2, "Green", false);
}

void p7()
{
  music.stop();
  if (stopVic < 1)
  {
      victory.play();
  }
  stopVic++;
  
  clearScreen();
  textSize(80);
  fill(#ab0af5);
  text("Parabéns, você completou todas as perguntas!!", 120, height / 2);

}

void button(int x, int y, String text, boolean correct)
{
  
  // Tamanho horizontal do botão
  int w = 200;
  // Tamnaho vertical do botão
  int h = 90;
  // Cor do botão
  fill(#0000FF);
  rect(x, y, w, h);
  
  // Define tamanho do texto dentro do botão 
  int text_size = 40;
  textSize(text_size);
  // Cor do texto
  fill(255);
  
  // Somar constante no X para adicionar padding/margem das bordas
  text(text, x + 5, y + text_size);
  
  
  // Se mouse dentro do botão e o botão for correto chama a lógica do botão
  if(mouseX>x && mouseX <x+w && mouseY>y && mouseY <y+h){
     mouseReleased(correct);
  }
}

// Se mudar a cor de background deixar a mesma cor nessa função
void clearScreen()
{
  background(#FFFFFF);
}

// Logica do botão
void mouseReleased(boolean correct)
{
   // Se mouse esquerdo for precionado e o botão da pergunta estiver correto passa para proxima fase
  if (mouseButton == LEFT) {
    if(correct)
    {
      question += 1;
    }
  }
}
