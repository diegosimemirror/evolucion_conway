#!/bin/sh
# ============================================================
# Revisión visual con capturas
# Insumo:    index.html (con estilo.css y graficos.js)
# Resultado: imágenes PNG en la carpeta "capturas": computadora,
#            celular y modo oscuro, sin abrir la página a mano
#
# Cómo se usa (en Git Bash, desde esta carpeta):
#   sh capturas.sh
# Necesita Google Chrome. Se usa «sin ventana» (headless):
# abre la página, toma la foto y se cierra.
# ============================================================

AQUI="$(cd "$(dirname "$0")" && pwd)"
CHROME="/c/Program Files/Google/Chrome/Application/chrome.exe"
PAGINA="file:///$(cygpath -m "$AQUI/index.html")"
mkdir -p "$AQUI/capturas"
SALIDA="$(cygpath -w "$AQUI/capturas")"

# --- Paso 1: comprobar que los 8 gráficos se dibujaron (cuenta los <svg>) ---
"$CHROME" --headless=new --disable-gpu --virtual-time-budget=4000 --dump-dom "$PAGINA" 2>/dev/null \
  | grep -o "<svg" | wc -l | xargs echo "Gráficos dibujados:"

# --- Paso 2: capturas (computadora, celular y modo oscuro) ---
# Chrome sin ventana no baja de ~500 px de ancho; para ver el celular, la página va dentro de un marco de 390 px
printf '%s\n' "<!doctype html><meta charset=utf-8><style>html,body{margin:0;background:#777}iframe{border:0;width:390px;height:12000px;background:#fff}</style><iframe src=\"$PAGINA\"></iframe>" > "$AQUI/capturas/vista-celular.html"
"$CHROME" --headless=new --disable-gpu --hide-scrollbars --virtual-time-budget=4000 \
  --window-size=1400,7400 --screenshot="$SALIDA\\computadora.png" "$PAGINA" 2>/dev/null
"$CHROME" --headless=new --disable-gpu --hide-scrollbars --virtual-time-budget=4000 \
  --window-size=420,12000 --screenshot="$SALIDA\celular.png" "file:///$(cygpath -m "$AQUI/capturas/vista-celular.html")" 2>/dev/null
"$CHROME" --headless=new --disable-gpu --hide-scrollbars --virtual-time-budget=4000 --force-dark-mode \
  --window-size=1400,7400 --screenshot="$SALIDA\\oscuro.png" "$PAGINA" 2>/dev/null
ls -la "$AQUI/capturas"
