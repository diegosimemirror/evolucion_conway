# evolucion_conway

Bosquejo exploratorio: **Conway y la evolución**. Son 8 gráficos que conectan la ley de Conway (un sistema copia la red de comunicación de la organización que lo diseña) con ideas de la biología evolutiva.

La pregunta de fondo: ¿la digitalización y la inteligencia artificial solo van a reproducir la estructura del Estado que ya existe?

Los gráficos son esquemas y modelos pequeños: **no usan datos del Estado**.

- Página: https://diegosimemirror.github.io/evolucion_conway/ (necesita GitHub Pages activado: *Settings → Pages → Deploy from a branch → main, / (root)*).
- Copia en el portafolio: https://diegosimemirror.github.io/demos/conway-evolucion/

## Archivos

| Archivo | Qué contiene |
|---|---|
| `index.html` | Los textos de la página y un espacio vacío para cada gráfico |
| `estilo.css` | El aspecto: letras, colores (azul = estructura existente, naranja = cambio), columnas |
| `graficos.js` | El código que dibuja los 8 gráficos, comentado por procesos. No usa librerías |
| `capturas.sh` | Toma capturas en computadora, celular y modo oscuro con Chrome sin ventana, para revisar sin abrir el navegador |
| `.nojekyll` | Le indica a GitHub Pages que publique los archivos tal como están |

## Mapa de procesos (uno por gráfico)

| N.º | Proceso | Insumo | Método | Resultado |
|---|---|---|---|---|
| 0 | Herramientas comunes | — | Funciones para crear figuras SVG, textos, flechas y la ventana flotante | Funciones que usan todos los gráficos |
| 1 | El espejo | 4 equipos que solo hablan con su vecino | Dibujar el mismo patrón de canales en el organigrama y en el sistema | Diagrama con resaltado por pareja |
| 2 | Líneas de menor resistencia | Inicio, meta y variación en cada dirección (matriz G) | Ecuación de Lande, Δz = G β, paso a paso | Camino de la población y n.º de pasos según la barra |
| 3 | Pleiotropía | Dos unidades y sus vínculos | Diagrama en estrella | Unidad con 2 vínculos frente a unidad con 6 |
| 4 | Círculo de reproducción | Tres etapas y tres mecanismos | Ciclo con flechas | Dónde se puede cortar (maniobra inversa) |
| 5 | Costo de coordinación | 3 unidades de 6 nodos y 30 enlaces posibles con beneficio al azar (semilla fija) | Conservar el enlace si beneficio > costo; calcular la modularidad Q de Newman | Red y Q según la barra |
| 6 | Transición mayor | Cuatro partes antes y después | Diagrama comparativo | Partes con información propia frente a un canal común |
| 7 | Ley de escala | Tamaños de 4 a 256 | Tres reglas (proporcional, cuadrática y n(n−1)/2), índice 4 unidades = 1 | Gráfico logarítmico con lectura al pasar el cursor y tabla |
| 8 | ¿Copia o convergencia? | 6 entidades hipotéticas (sector y año del ROF) | Dos árboles con la misma forma y distinta agrupación | Por plantilla (copia) o por sector (convergencia) |

## Fuentes

- Futuyma y Kirkpatrick (2017), *Evolution*, caps. 12, 15, 17 y 20.
- Losos y otros (2013), *The Princeton Guide to Evolution*, caps. V.2, V.5, V.9 y V.11.
- Barresi y Gilbert (2023), *Developmental Biology*, cap. 26.
- Breed y Moore (2021), *Animal Behavior*, cap. 14.
- Kandel y otros (2021), *Principles of Neural Science*, cap. 49.
- Conway (1968); Simon (1962); Maynard Smith y otros (1985); Lande (1979); Schluter (1996); Clune, Mouret y Lipson (2013); Colfer y Baldwin (2016); Skelton y Pais (2019).

## Cómo cambiarlo

1. Editar `index.html`, `estilo.css` o `graficos.js`.
2. Revisar con `sh capturas.sh` (en Git Bash) y mirar las imágenes de `capturas/`.
3. `git commit` y `git push`. Si también cambia la copia del portafolio, copiar los tres archivos a `demos/conway-evolucion/` del repositorio `diegosimemirror.github.io`.
