#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""
XONITUBE 2026 - Reproductor de YouTube desde Terminal
OPTIMIZADO PARA 1GB RAM - Descarga y reproduce localmente
Desarrollador: Darian Alberto Camacho Salas
Organización: XONIDU
"""

import os
import sys
import time
import subprocess
import shutil
import tempfile
from pathlib import Path

# ============================================================================
# Colores para terminal
# ============================================================================
class Colors:
    GREEN = '\033[92m'
    YELLOW = '\033[93m'
    RED = '\033[91m'
    PURPLE = '\033[95m'
    CYAN = '\033[96m'
    END = '\033[0m'
    BOLD = '\033[1m'

# ============================================================================
# Configuración
# ============================================================================
REPRODUCTOR = "mpv"
DOWNLOAD_DIR = os.path.expanduser("~/Videos/XoniTube")
TAMANO_VENTANA = "640x360"

# Crear directorio de descargas si no existe
if not os.path.exists(DOWNLOAD_DIR):
    os.makedirs(DOWNLOAD_DIR, exist_ok=True)

# Directorio temporal para archivos que se borrarán
TEMP_DIR = tempfile.gettempdir() + "/xonitube_temp"
if not os.path.exists(TEMP_DIR):
    os.makedirs(TEMP_DIR, exist_ok=True)

# ============================================================================
# Clase principal XONITUBE
# ============================================================================
class XONITUBE:
    def __init__(self):
        self.ultima_busqueda = []
        self.setup_readline()
        self.welcome()
    
    def setup_readline(self):
        try:
            import readline
            histfile = Path.home() / ".xonitube_history"
            try:
                readline.read_history_file(histfile)
            except FileNotFoundError:
                pass
            import atexit
            atexit.register(readline.write_history_file, histfile)
        except ImportError:
            pass
    
    def clear_screen(self):
        os.system('clear' if os.name == 'posix' else 'cls')
    
    def welcome(self):
        self.clear_screen()
        print("=" * 60)
        print("                     XONITUBE")
        print("=" * 60)
        print(" BY: XONIDU - Darian Alberto Camacho Salas")
        print("=" * 60)
        print(" OPTIMIZADO PARA 1GB RAM")
        print(" Modo: Descarga local + reproduccion (menos lag)")
        print(f" Descargas permanentes: {DOWNLOAD_DIR}")
        print("=" * 60)
        print("")
    
    def buscar_videos(self, termino, cantidad):
        print(f"\n{Colors.CYAN}Buscando: '{termino}'...{Colors.END}")
        try:
            cmd = [
                "yt-dlp",
                "--no-warnings",
                "--quiet",
                "--flat-playlist",
                "--print", "%(title)s|%(id)s",
                f"ytsearch{cantidad}:{termino}"
            ]
            resultado = subprocess.run(cmd, capture_output=True, text=True)
            if resultado.returncode != 0:
                return None
            videos = []
            for linea in resultado.stdout.strip().split('\n'):
                if '|' in linea:
                    titulo, vid = linea.split('|', 1)
                    videos.append({
                        'num': len(videos) + 1,
                        'tit': titulo.strip()[:70],
                        'url': f"https://youtu.be/{vid.strip()}",
                        'nombre': titulo.strip()[:50].replace('/', '_').replace(':', '_').replace(' ', '_')
                    })
            return videos if videos else None
        except Exception as e:
            print(f"{Colors.RED}Error: {e}{Colors.END}")
            return None
    
    def mostrar_resultados(self, videos):
        print("\n" + "="*60)
        print("RESULTADOS".center(60))
        print("="*60)
        for v in videos:
            print(f"\n{v['num']}. {v['tit']}")
        print("\n" + "="*60)
    
    def descargar_video(self, url, calidad, nombre, temporal=False):
        """Descarga el video - si temporal=True, usa directorio temporal"""
        print(f"\n{Colors.YELLOW}Descargando: {nombre}...{Colors.END}")
        
        timestamp = time.strftime("%Y%m%d_%H%M%S")
        filename = f"{nombre}_{timestamp}.mp4"
        
        if temporal:
            filepath = os.path.join(TEMP_DIR, filename)
            print(f"  (archivo temporal - se borrara al terminar)")
        else:
            filepath = os.path.join(DOWNLOAD_DIR, filename)
            print(f"  (archivo permanente - se guardara en: {DOWNLOAD_DIR})")
        
        try:
            cmd = ["yt-dlp", "-f", calidad, "-o", filepath, "--no-warnings", "--quiet", url]
            subprocess.run(cmd, check=True)
            print(f"{Colors.GREEN}✓ Descarga completada{Colors.END}")
            return filepath
        except Exception as e:
            print(f"{Colors.RED}Error en descarga: {e}{Colors.END}")
            return None
    
    def reproducir_local(self, filepath, borrar_al_terminar=False):
        """Reproduce archivo local y opcionalmente lo borra al terminar"""
        if not filepath or not os.path.exists(filepath):
            return False
        
        print(f"\n{Colors.GREEN}▶ Reproduciendo desde archivo local...{Colors.END}")
        if borrar_al_terminar:
            print(f"  (el archivo se eliminara automaticamente al terminar)")
        self.mostrar_controles()
        
        try:
            cmd = [REPRODUCTOR, "--cache=yes", "--cache-secs=30", f"--geometry={TAMANO_VENTANA}", "--ontop", filepath]
            subprocess.run(cmd)
            
            # Borrar si se solicitó
            if borrar_al_terminar:
                try:
                    os.remove(filepath)
                    print(f"{Colors.GREEN}✓ Archivo temporal eliminado{Colors.END}")
                except Exception as e:
                    print(f"{Colors.YELLOW}No se pudo eliminar: {e}{Colors.END}")
            return True
            
        except KeyboardInterrupt:
            print(f"\n{Colors.YELLOW}Reproduccion detenida{Colors.END}")
            if borrar_al_terminar and os.path.exists(filepath):
                try:
                    os.remove(filepath)
                    print(f"{Colors.GREEN}✓ Archivo temporal eliminado{Colors.END}")
                except:
                    pass
            return True
        except Exception as e:
            print(f"\n{Colors.RED}Error: {e}{Colors.END}")
            return False
    
    def mostrar_controles(self):
        print("  CONTROLES MPV:")
        print("    ← → : Retroceder/Avanzar 5s")
        print("    Space : Pausa")
        print("    ↑ ↓ : Volumen")
        print("    q : Salir")
        print("-"*40)
    
    def preguntar_cantidad(self):
        while True:
            try:
                cant = input(f"\n{Colors.CYAN}Cuantos resultados? (1-15, Enter=5): {Colors.END}").strip()
                if cant == "":
                    return 5
                cant = int(cant)
                if 1 <= cant <= 15:
                    return cant
                print(f"{Colors.RED}Numero entre 1 y 15{Colors.END}")
            except ValueError:
                print(f"{Colors.RED}Numero invalido{Colors.END}")
    
    def preguntar_calidad(self):
        print("\n" + "="*50)
        print("CALIDADES DISPONIBLES".center(50))
        print("="*50)
        print("  1. Peor calidad (mas rapido, ahorro de datos)")
        print("  2. 144p (muy baja)")
        print("  3. 240p (baja)")
        print("  4. 360p (media)")
        print("  5. 480p (estandar)")
        print("  6. 720p (HD)") 
        print("  7. 1080p (Full HD)")
        print("  8. Mejor calidad disponible (mas lento)")
        print("  9. Solo audio (sin video)")
        print("-"*50)
        while True:
            op = input(f"{Colors.CYAN}Elige una opcion (1-9, Enter=1): {Colors.END}").strip()
            if op == "":
                return "worst", "Peor calidad"
            calidades = {
                '1': ("worst", "Peor calidad"),
                '2': ("worst[height<=144]", "144p"),
                '3': ("worst[height<=240]", "240p"),
                '4': ("worst[height<=360]", "360p"),
                '5': ("worst[height<=480]", "480p"),
                '6': ("best[height<=720]", "720p HD"),
                '7': ("best[height<=1080]", "1080p Full HD"),
                '8': ("best", "Mejor calidad"),
                '9': ("bestaudio", "Solo audio")
            }
            if op in calidades:
                return calidades[op]
            print(f"{Colors.RED}Opcion invalida{Colors.END}")
    
    def preguntar_accion(self):
        print("\n" + "="*50)
        print("OPCIONES OPTIMIZADAS".center(50))
        print("="*50)
        print("  1. Streaming (sin descarga - mas CPU/red)")
        print("  2. Descargar + Reproducir (guarda permanentemente)")
        print("  3. Solo descargar (guarda permanentemente)")
        print("  4. Descargar + Reproducir + BORRAR (OPTIMO para 1GB RAM)")
        print("-"*50)
        print("💡 RECOMENDADO: Opcion 4 (descarga, reproduce y borra)")
        print("   - Menos lag que streaming")
        print("   - No ocupa espacio en disco")
        print("   - Ideal para 1GB RAM")
        print("-"*50)
        while True:
            op = input(f"{Colors.CYAN}Elige una opcion (1-4, Enter=4): {Colors.END}").strip()
            if op == "":
                return 4  # Opcion 4 por defecto (óptimo)
            if op in ['1', '2', '3', '4']:
                return int(op)
            print(f"{Colors.RED}Opcion invalida{Colors.END}")
    
    def run(self):
        while True:
            try:
                entrada = input(f"\n{Colors.CYAN}Buscar → {Colors.END}").strip()
                if entrada.lower() in ['salir', 'exit', 'q']:
                    print(f"\n{Colors.GREEN}Gracias por usar XONITUBE{Colors.END}")
                    break
                if not entrada:
                    continue
                
                cantidad = self.preguntar_cantidad()
                videos = self.buscar_videos(entrada, cantidad)
                
                if not videos:
                    print(f"\n{Colors.RED}No se encontraron resultados{Colors.END}")
                    continue
                
                self.mostrar_resultados(videos)
                
                while True:
                    sel = input(f"\n{Colors.CYAN}Numero de video (Enter para nueva busqueda): {Colors.END}").strip()
                    if sel == "":
                        break
                    
                    if sel.isdigit():
                        idx = int(sel) - 1
                        if 0 <= idx < len(videos):
                            formato, nombre_calidad = self.preguntar_calidad()
                            accion = self.preguntar_accion()
                            
                            if accion == 1:
                                # Streaming (sin descarga)
                                print(f"\n{Colors.YELLOW}Modo streaming...{Colors.END}")
                                cmd = [
                                    REPRODUCTOR,
                                    f"--ytdl-format={formato}",
                                    "--cache=yes",
                                    "--cache-secs=30",
                                    f"--geometry={TAMANO_VENTANA}",
                                    "--ontop",
                                    videos[idx]['url']
                                ]
                                subprocess.run(cmd)
                            
                            elif accion == 2:
                                # Descargar + Reproducir (permanente)
                                archivo = self.descargar_video(videos[idx]['url'], formato, videos[idx]['nombre'], temporal=False)
                                if archivo:
                                    self.reproducir_local(archivo, borrar_al_terminar=False)
                            
                            elif accion == 3:
                                # Solo descargar (permanente)
                                self.descargar_video(videos[idx]['url'], formato, videos[idx]['nombre'], temporal=False)
                            
                            elif accion == 4:
                                # Descargar + Reproducir + BORRAR (óptimo)
                                archivo = self.descargar_video(videos[idx]['url'], formato, videos[idx]['nombre'], temporal=True)
                                if archivo:
                                    self.reproducir_local(archivo, borrar_al_terminar=True)
                            
                            otro = input(f"\n{Colors.CYAN}Reproducir otro video de esta busqueda? (s/n): {Colors.END}").strip().lower()
                            if otro not in ['s', 'si', 'y']:
                                break
                        else:
                            print(f"{Colors.RED}Numero debe ser entre 1 y {len(videos)}{Colors.END}")
                    else:
                        print(f"{Colors.RED}Por favor ingresa un numero valido{Colors.END}")
                        
            except KeyboardInterrupt:
                print(f"\n\n{Colors.GREEN}Gracias por usar XONITUBE{Colors.END}")
                break
            except Exception as e:
                print(f"\n{Colors.RED}Error: {e}{Colors.END}")

# ============================================================================
# Verificación de dependencias
# ============================================================================
def check_mpv():
    return shutil.which('mpv') is not None

def check_ytdlp():
    return shutil.which('yt-dlp') is not None

def main():
    if not check_mpv():
        print(f"{Colors.RED}Error: mpv no esta instalado{Colors.END}")
        print("Ejecuta 'python3 start.py' para instalarlo automaticamente")
        sys.exit(1)
    if not check_ytdlp():
        print(f"{Colors.RED}Error: yt-dlp no esta instalado{Colors.END}")
        print("Ejecuta 'python3 start.py' para instalarlo automaticamente")
        sys.exit(1)
    app = XONITUBE()
    app.run()

if __name__ == "__main__":
    try:
        main()
    except KeyboardInterrupt:
        print(f"\n{Colors.GREEN}Hasta luego!{Colors.END}")
        sys.exit(0)
    except Exception as e:
        print(f"\n{Colors.RED}Error fatal: {e}{Colors.END}")
        sys.exit(1)
