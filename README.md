# 📄 XONISPAM

**Advertencia:** Este código tiene únicamente fines educativos. No debe usarse para actividades malintencionadas ni para molestar a otras personas. El autor no se hace responsable del uso indebido.

## 🎯 ¿Qué es XONISPAM?

XONISPAM es una herramienta Python que automatiza la escritura y envío de texto usando la biblioteca `pyautogui`. Consta de dos componentes:

- **`start.py`** - Lanzador universal que verifica dependencias y ejecuta el programa principal
- **`xonispam.py`** - Programa principal con la funcionalidad de spam

Permite:
- Enviar un mismo mensaje N veces (spam normal)
- Enviar palabra por palabra el contenido de un archivo `.txt`

El script simula pulsaciones de teclado en la máquina donde se ejecuta, por lo que el foco debe estar en la aplicación destino (chat, editor, etc.).

## 📥 Instalación

Clona el repositorio desde GitHub:

```bash
git clone https://github.com/XONIDU/xonispam.git
cd xonispam
```

## ✅ Requisitos

- Python 3.8+ instalado
- Dependencias Python listadas en `requisitos.txt`
- Entorno con servidor gráfico (Xorg) o soporte para generar eventos de teclado desde Python. En Wayland o entornos restringidos puede no funcionar.

### Dependencias del sistema por plataforma:

#### 🐧 Arch Linux
```bash
# Instalar dependencias del sistema
sudo pacman -S python-pip tk scrot xorg-xinput xdotool

# Instalar dependencias Python
pip install -r requisitos.txt --break-system-packages
```

#### 🐧 Ubuntu / Debian
```bash
# Actualizar repositorios
sudo apt update

# Instalar dependencias del sistema
sudo apt install python3 python3-pip -y
sudo apt install python3-tk python3-dev scrot xdotool python3-xlib -y

# Instalar dependencias Python
pip3 install -r requisitos.txt --break-system-packages
```

#### 🪟 Windows
1. Instala Python 3 desde [python.org](https://python.org)
2. Abre una terminal (cmd o PowerShell) y ejecuta:
```bash
pip install -r requisitos.txt
```

**Notas:**
- `scrot` y `xdotool` ayudan en Linux para ciertas funciones de automatización
- En algunas distribuciones con Wayland puede ser necesario cambiar a Xorg o permitir control de entrada

## ⚙️ Uso

1. Asegúrate de que la ventana objetivo (chat, editor, etc.) tenga el foco y el cursor en el campo donde quieres escribir
2. Ejecuta el lanzador:

```bash
python start.py
```

3. El lanzador verificará las dependencias y automáticamente ejecutará `xonispam.py`
4. En el menú principal de XONISPAM, elige una opción:

```
MENU PRINCIPAL:

  [0] SPAM normal - Envia un mismo mensaje N veces
  [1] SPAM de texto - Envia palabra por palabra desde archivo .txt
  [2] SALIR
```

5. Tras elegir, el script espera **3 segundos** antes de empezar para que tengas tiempo de colocar el foco en la ventana destino

### Accesos directos

El lanzador crea automáticamente accesos directos para facilitar la ejecución:

- **Windows:** `INICIAR_XONISPAM.bat` (doble clic)
- **Linux:** `INICIAR_XONISPAM.sh` (ejecutar con `./INICIAR_XONISPAM.sh`)
- **MacOS:** `INICIAR_XONISPAM.command` (doble clic)

## ✋ Pausar / Detener

- Para detener el script en ejecución: `Ctrl + C`
- Si el script está enviando teclas y necesitas recuperar el control, intenta cambiar a otra ventana o presionar la combinación de seguridad del sistema (ej. `Ctrl+Alt+F1` en Linux para cambiar de consola)

## 🔒 Consideraciones de seguridad y ética

- No uses este script para enviar mensajes no solicitados, acosar o causar daños
- No lo ejecutes en sistemas de terceros sin permiso
- Evita usarlo en sistemas donde `pyautogui` pueda interactuar con privilegios elevados o alterar la configuración del sistema
- Este programa es **SOLO para fines educativos**

## 🐛 Problemas comunes

- **"Las teclas no se envían"**: revisa que la ventana de destino tenga el foco y que el servidor gráfico permita inyección de eventos
- **"Funcionó solo parcialmente"**: puede haber diferencias entre entornos (Wayland vs Xorg). Prueba en Xorg si es posible
- **"Permisos"**: en algunos entornos de escritorio hay que habilitar control por aplicaciones
- **"Error: No se encuentra spam.py"**: asegúrate de que `xonispam.py` está en el mismo directorio que `start.py`

## 📦 Archivos incluidos

- `start.py` — Lanzador universal (verifica dependencias y ejecuta el programa)
- `xonispam.py` — Programa principal con la funcionalidad de spam
- `requisitos.txt` — Dependencias Python
- `README.md` — Este archivo de documentación

## 📊 Estadísticas del proyecto

- **Estrellas:** 0
- **Observadores:** 1
- **Forks:** 0
- **Lenguaje principal:** Python 100.0%

## ✉️ Contacto y Créditos

- **Proyecto:** XONISPAM
- **Contacto:** xonidu@gmail.com
- **Creador:** Darian Alberto Camacho Salas
- **#Somos XONINDU**

