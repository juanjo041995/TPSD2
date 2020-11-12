<br />
<p align="center">
  <a href="https://github.com/github_username/Laboratorio">
    <img src="https://www.extremetech.com/wp-content/uploads/2019/05/MIPS-Banner-223x126.jpg" alt="Logo" width="640" height="160">
  </a>

  <h3 align="center">SISTEMAS DIGITALES 2</h3>

  <p align="center">
    TRABAJO PRÁCTICO
    <br />
    <a href="https://eaula.ing.una.py/course/view.php?id=34"><strong>Visitar Aula Virtual »</strong></a>
    <br />
    <br />
    <a href="https://github.com/pyefiuna/Laboratorio">Ver Demo</a>
    ·
    <a href="https://github.com/pyefiuna/Laboratorio/issues">Reportar errores</a>
    ·
    <a href="https://github.com/pyefiuna/Laboratorio/issues">Hacer pedidos</a>
  </p>
</p>

<p align="center">
<img src="https://www.smbc-comics.com/comics/1586708147-20200412b.png" alt="Logo">
</p>

## Tabla de Contenido

* [Hardware](#hardware)
  * [Diagrama de bloques](#diagrama-de-bloques)
  * [Hardware implementado](#hardware-implementado)
* [Software](#software)
  * [Algoritmo](#algoritmo)
  * [Rutinas importantes](#rutinas-importantes)
* [Estado actual del trabajo](#estado-actual-del-trabajo)
  * [Resultados obtenidos](#resultados-obtenidos)
  * [Inconvenientes](#inconvenientes)
* [Recursos utilizados](#recursos-utilizados)
* [Integrantes](#integrantes)


<!-- SOBRE EL PROYECTO -->
## Hardware

### Diagrama de bloques
![Diagrama de bloques principal](img/main_block_diagram.jpg)

![Diagrama de bloques del mmioVGA](img/mmioVGA_block_diagram.jpg)


### Hardware implementado

## Software

### Algoritmo

El algoritmo, cuya implementación está basada en el programa del Juego de la Vida citado en los recursos utilizados, se resume a grandes rasgos según el siguiente diagrama:

<p align="center">
  <img src="img/GoL_flowchart.jpg" alt="alternate text">
</p>

En el diagrama mostrado arriba existen detalles que no están siendo mostrados:
* Existen contadores que llegan hasta 1.000.000 para que el cambio entre frame y frame pueda ser apreciado por el ojo humano.
* Si el botón de reset es presionado, el bucle vuelve al inicio (resetear contenidos de la memoria y cargar la condición inicial para que el ciclo vuelva a empezar).
* Presionando el botón de pausa se tiene la posibilidad de alterar el estado de las celdas, tomando como base la última configuración de las celdas en el momento de pausar el juego. Esta modificación de los estados funciona de la siguiente manera:
    * El estado de los 8 switches de la placa expresa una representación en binario del número de celda cuyo estado se quiere modificar (representando la matriz de celdas como un vector, donde la celda [i,j] es representada por el valor i*16+j).
    * Al presionar el botón de set, el estado de la celda [i,j] es tal esta celda esté viva (independientemente de si al momento del set la celda ya esté viva o no).
    * Al presionar el botón de clear (la contraparte de set), el estado de la celda [i,j] es tal que esta celda esté muerta (independientemente de si al momento del clear la celda ya esté muerta o no).
    * Se puede alterar los estados de las celdas tantas veces como se desee, reanudando el juego con la configuración deseada al presionar nuevamente el botón de pause.

### Rutinas importantes
Para la implementación del algoritmo, se hizo uso de las siguientes rutinas:
* **createPixel**: Tiene en cuenta la posición de memoria en la que se guarda el primer elemento del vector de pixels y suma un offset según la posición [i,j] de la memoria, siendo offset=i*16+j. Esto da como resultado la posición en la memoria donde hay que guardar la información de que en la celda [i,j] existe una celda viva.
* **checkSelfColor**: Esta rutina se encarga de verificar el estado de una celda. La función mencionada anteriormente guarda un valor positivo en la celda [i,j], mientras que esta rutina lee el estado de la misma.
* **checkColor**: Es utilizada cuando se quiere saber el estado los vecinos de la celda [i,j].
* **XYtoAddress**: Hace la conversión de posiciones [i,j] a i*16+j y guarda el resultado.
* **updateScreen**: Itera sobre cada celda y verifica si esta tiene que vivir o morir según las condiciones del juego, las cuales son verificadas en las etiquetas *colored* (donde se verifica si la celda viva debe morir, recurriendo a la etiqueta markDead en caso necesario) y *black* (donde, si la celda está muerta, se recurre a markLive si se cumple la condición para revivirla).
* **countNeighbors**: Cuenta la cantidad de vecinos de la celda [i,j] para verificar la condición de celda viva o muerta para el siguiente frame.
* **nextGeneration**: Se leen los vectores guardados en *updateScreen* que tienen información sobre cuáles son las celdas que tienen que vivir en el siguiente frame y cuáles tienen que estar muertas y se guarda esta información en la memoria del VGA.

## Estado actual del trabajo
### Resultados obtenidos
Como ejemplo, puede verse un oscilador de periodo 3:  
![Estado Actual](https://im3.ezgif.com/tmp/ezgif-3-aa1e1931bf2c.gif)

### Inconvenientes
Como se explicó en la sección anterior, el proyecto pudo concluirse satisfactoriamente.

## Recursos utilizados

* [Mimas V2 Spartan 6 FPGA Development Board](https://numato.com/product/mimas-v2-spartan-6-fpga-development-board-with-ddr-sdram/)
* [ISE Design Suite](https://www.xilinx.com/products/design-tools/ise-design-suite.html)
* [MARS (MIPS Assembler and Runtime Simulator)](http://courses.missouristate.edu/kenvollmar/mars/)
* [Conway's Game of Life in MIPS Assembly Language](https://github.com/hackmak/GoL-MIPS)
* [Mimas V2 VGA Display demo code](https://github.com/numato/samplecode/tree/master/FPGA/MimasV2/mimasV2Demo/src/MimasV2VGA)
* [Diseño de sistemas digitales con VHDL](https://burjcdigital.urjc.es/handle/10115/5700)
* Diseño del MIPS por Dr. Vicente González

## Integrantes

* Alejandro Cáceres
* Juan José Salinas



[product-screenshot]: https://fiverr-res.cloudinary.com/images/t_main1,q_auto,f_auto,q_auto,f_auto/gigs/166073512/original/8d38f82581e58de40ed5b587ce6d15aaaac49bf2/solve-data-science-machine-learning-deep-learning-problems.png
