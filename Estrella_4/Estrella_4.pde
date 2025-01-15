int widthFactor = 0;    // Ancho inicial en el eje "x"
int heightFactor = 400; // Altura inicial en el eje "y"
color startColor;       // Color inicial
color endColor;         // Color final

void setup() {
  size(800, 800);  // Tamaño del lienzo
  noFill();        // Sin fondo en los rombos
  stroke(0);       // Color de línea
  frameRate(30);   // Velocidad de la animación
  
  // Establecer los colores de inicio y fin
  startColor = color(255, 0, 0); // Rojo
  endColor = color(0, 0, 255);   // Azul
}

void draw() {
  // Interpolar entre los colores mientras se dibuja
  color currentColor = lerpColor(startColor, endColor, (float)widthFactor / 400.0);

  // Dibuja el rombo con las dimensiones actuales y el color interpolado
  stroke(currentColor);  // Aplicar el color interpolado al borde del rombo
  drawRhombus(width / 2, height / 2, widthFactor, heightFactor);
  
  // Progresar las dimensiones del rombo hasta (400, 0)
  if (widthFactor < 400) {
    widthFactor += 10;  // Aumentar el ancho
    heightFactor -= 10; // Disminuir la altura
  } else {
    // Cuando se alcance el tamaño máximo, restablece el fondo y reinicia el proceso
    background(255);  // Restablece el fondo a blanco solo al final
    widthFactor = 0;
    heightFactor = 400;
  }
}

void drawRhombus(float centerX, float centerY, float w, float h) {
  beginShape();
  vertex(centerX, centerY - h);       // Arriba
  vertex(centerX + w, centerY);       // Derecha
  vertex(centerX, centerY + h);       // Abajo
  vertex(centerX - w, centerY);       // Izquierda
  endShape(CLOSE);
}
