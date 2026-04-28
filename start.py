#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""
XONISPAM 2026 - Lanzador Universal con Gestor de Automatización
Herramienta de spam educativo para pruebas de teclado
Desarrollador: Darian Alberto Camacho Salas
Organización: XONIDU
#Somos XONINDU
"""

import subprocess
import sys
import os
import platform
import shutil
import time
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
    BLUE = '\033[94m'
    END = '\033[0m'
    BOLD = '\033[1m'
    
    @staticmethod
    def supports_color():
        if platform.system() == 'Windows':
            try:
                import ctypes
                kernel32 = ctypes.windll.kernel32
                return kernel32.SetConsoleMode(kernel32.GetStdHandle(-11), 7)
            except:
                return False
        return True

if not Colors.supports_color():
    for attr in dir(Colors):
        if not attr.startswith('_') and attr != 'supports_color':
            setattr(Colors, attr, '')

# ============================================================================
# Detección del sistema
# ============================================================================
def get_system():
    return platform.system().lower()

def get_linux_distro():
    if get_system() != 'linux':
        return None
    try:
        if os.path.exists('/etc/os-release'):
            with open('/etc/os-release', 'r') as f:
                content = f.read().lower()
                if 'ubuntu' in content or 'debian' in content or 'mint' in content or 'antix' in content:
                    return 'debian-based'
                elif 'arch' in content or 'manjaro' in content:
                    return 'arch-based'
                elif 'fedora' in content:
                    return 'fedora'
                elif 'centos' in content or 'rhel' in content:
                    return 'centos'
                elif 'opensuse' in content:
                    return 'opensuse'
        if shutil.which('apt'):
            return 'debian-based'
        elif shutil.which('pacman'):
            return 'arch-based'
        elif shutil.which('dnf'):
            return 'fedora'
        elif shutil.which('yum'):
            return 'centos'
        elif shutil.which('zypper'):
            return 'opensuse'
        return 'linux-generico'
    except:
        return 'linux-generico'

def get_python_command():
    if get_system() == 'windows':
        return ['python']
    else:
        try:
            subprocess.run(['python3', '--version'], capture_output=True, check=True)
            return ['python3']
        except:
            return ['python']

def get_pip_command():
    return [sys.executable, '-m', 'pip']

def get_install_flags():
    flags = []
    sistema = get_system()
    distro = get_linux_distro()
    if sistema == 'linux':
        if distro in ['arch-based', 'fedora']:
            flags.append('--break-system-packages')
        else:
            flags.append('--user')
    elif sistema == 'darwin':
        flags.append('--user')
    return flags

def get_script_dir():
    return os.path.dirname(os.path.abspath(__file__))

def get_xonispam_path():
    """Detecta la ruta de xonispam.py en múltiples ubicaciones"""
    script_dir = get_script_dir()
    rutas = [
        os.path.join(script_dir, 'xonispam.py'),
        '/usr/share/xonispam/xonispam.py',
        os.path.join(os.path.expanduser("~"), '.xonispam', 'xonispam.py'),
        os.path.join(os.getcwd(), 'xonispam.py')
    ]
    for r in rutas:
        if os.path.exists(r):
            return r
    return None

def print_banner():
    sistema = get_system()
    distro = get_linux_distro()
    sistema_texto = {
        'windows': 'WINDOWS',
        'linux': f'LINUX ({distro.upper()})' if distro else 'LINUX',
        'darwin': 'MACOS'
    }.get(sistema, 'DESCONOCIDO')
    
    banner = f"""
{Colors.PURPLE}{Colors.BOLD}╔══════════════════════════════════════════════════════════╗
║                    XONISPAM 2026 v1.0                    ║
║              Herramienta de Automatización               ║
║                  Spam educativo para                     ║
║                   pruebas de teclado                     ║
║                                                            ║
║               Sistema detectado: {sistema_texto:<27} ║
║                                                            ║
║               Desarrollado por: Darian Alberto           ║
║                      Camacho Salas                       ║
║                      Organización: XONIDU                ║
║                      #Somos XONINDU                      ║
╚══════════════════════════════════════════════════════════╝{Colors.END}
    """
    print(banner)

def mostrar_ayuda():
    ayuda = f"""
{Colors.BOLD}USO DE XONISPAM:{Colors.END}

  xonispam

{Colors.BOLD}MODO DE USO:{Colors.END}

  [0] SPAM normal - Envia un mismo mensaje N veces
  [1] SPAM de texto - Envia palabra por palabra desde archivo .txt
  [2] SALIR

{Colors.BOLD}CONTROLES:{Colors.END}

  Ctrl+C     - Detener el envio
  El programa da 3 segundos para enfocar la ventana destino

{Colors.BOLD}ADVERTENCIA:{Colors.END}

  Este programa es SOLO para fines educativos.
  No usar para acosar o enviar mensajes no solicitados.
    """
    print(ayuda)

# ============================================================================
# Verificación de dependencias
# ============================================================================
def check_python():
    try:
        cmd = get_python_command() + ['--version']
        subprocess.run(cmd, capture_output=True, check=True)
        return True
    except:
        return False

def check_pip():
    try:
        cmd = get_pip_command() + ['--version']
        subprocess.run(cmd, capture_output=True, check=True)
        return True
    except:
        return False

def install_pip_linux():
    distro = get_linux_distro()
    print(f"{Colors.YELLOW}Instalando pip en Linux ({distro})...{Colors.END}")
    if distro == 'debian-based':
        try:
            subprocess.run(['sudo', 'apt', 'update'], check=False)
            subprocess.run(['sudo', 'apt', 'install', '-y', 'python3-pip'], check=True)
            return True
        except:
            return False
    elif distro == 'arch-based':
        try:
            subprocess.run(['sudo', 'pacman', '-S', '--noconfirm', 'python-pip'], check=True)
            return True
        except:
            return False
    elif distro == 'fedora':
        try:
            subprocess.run(['sudo', 'dnf', 'install', '-y', 'python3-pip'], check=True)
            return True
        except:
            return False
    return False

def install_pip_windows():
    print(f"{Colors.YELLOW}Instalando pip en Windows...{Colors.END}")
    try:
        subprocess.run([sys.executable, '-m', 'ensurepip', '--upgrade'], check=True)
        return True
    except:
        return False

def check_pyautogui():
    try:
        __import__('pyautogui')
        return True
    except ImportError:
        return False

def install_pyautogui():
    print(f"{Colors.YELLOW}Instalando pyautogui...{Colors.END}")
    if not check_pip():
        return False
    flags = get_install_flags()
    try:
        cmd = get_pip_command() + ['install', 'pyautogui'] + flags
        subprocess.run(cmd, check=True, capture_output=True)
        print(f"{Colors.GREEN}pyautogui instalado correctamente.{Colors.END}")
        return True
    except:
        try:
            cmd = get_pip_command() + ['install', 'pyautogui']
            subprocess.run(cmd, check=True)
            print(f"{Colors.GREEN}pyautogui instalado correctamente.{Colors.END}")
            return True
        except:
            return False

def check_system_deps_linux():
    """Verifica dependencias del sistema necesarias para pyautogui en Linux"""
    if get_system() != 'linux':
        return True
    
    distro = get_linux_distro()
    faltantes = []
    
    if not shutil.which('scrot'):
        faltantes.append('scrot')
    if not shutil.which('xdotool'):
        faltantes.append('xdotool')
    
    if faltantes:
        print(f"{Colors.YELLOW}Faltan dependencias del sistema: {', '.join(faltantes)}{Colors.END}")
        respuesta = input("¿Instalarlas automáticamente? (s/n): ")
        if respuesta.lower() == 's':
            if distro == 'debian-based':
                try:
                    subprocess.run(['sudo', 'apt', 'update'], check=False)
                    subprocess.run(['sudo', 'apt', 'install', '-y'] + faltantes, check=True)
                    print(f"{Colors.GREEN}Dependencias instaladas{Colors.END}")
                    return True
                except:
                    print(f"{Colors.RED}Error instalando{Colors.END}")
                    return False
            elif distro == 'arch-based':
                try:
                    subprocess.run(['sudo', 'pacman', '-S', '--noconfirm'] + faltantes, check=True)
                    print(f"{Colors.GREEN}Dependencias instaladas{Colors.END}")
                    return True
                except:
                    print(f"{Colors.RED}Error instalando{Colors.END}")
                    return False
            elif distro == 'fedora':
                try:
                    subprocess.run(['sudo', 'dnf', 'install', '-y'] + faltantes, check=True)
                    print(f"{Colors.GREEN}Dependencias instaladas{Colors.END}")
                    return True
                except:
                    print(f"{Colors.RED}Error instalando{Colors.END}")
                    return False
        else:
            print(f"{Colors.YELLOW}Instalación manual requerida:{Colors.END}")
            if distro == 'debian-based':
                print(f"  sudo apt install {' '.join(faltantes)}")
            elif distro == 'arch-based':
                print(f"  sudo pacman -S {' '.join(faltantes)}")
            return False
    return True

# ============================================================================
# Función principal
# ============================================================================
def main():
    if get_system() == 'windows':
        os.system('cls')
    else:
        os.system('clear')
    
    print_banner()
    
    if len(sys.argv) > 1 and sys.argv[1] in ['-h', '--help', '/?']:
        mostrar_ayuda()
        if get_system() != 'windows':
            input(f"\n{Colors.YELLOW}Presiona Enter para salir...{Colors.END}")
        return
    
    if not check_python():
        print(f"\n{Colors.RED}❌ Python no esta instalado{Colors.END}")
        sys.exit(1)
    
    ver_py = subprocess.run(get_python_command() + ['--version'], capture_output=True, text=True).stdout.strip()
    print(f"{Colors.BOLD}Python:{Colors.END} {ver_py}")
    
    if not check_pip():
        print(f"\n{Colors.YELLOW}⚠️ Pip no encontrado. Instalando...{Colors.END}")
        sistema = get_system()
        if sistema == 'linux':
            if not install_pip_linux():
                print(f"{Colors.RED}No se pudo instalar pip.{Colors.END}")
                sys.exit(1)
        elif sistema == 'windows':
            if not install_pip_windows():
                print(f"{Colors.RED}No se pudo instalar pip.{Colors.END}")
                sys.exit(1)
    else:
        print(f"{Colors.GREEN}✓ Pip disponible{Colors.END}")
    
    if not check_pyautogui():
        print(f"\n{Colors.YELLOW}⚠️ pyautogui no encontrado. Instalando...{Colors.END}")
        if not install_pyautogui():
            print(f"{Colors.RED}No se pudo instalar pyautogui.{Colors.END}")
            sys.exit(1)
    else:
        print(f"{Colors.GREEN}✓ pyautogui disponible{Colors.END}")
    
    # Verificar dependencias del sistema en Linux
    if get_system() == 'linux':
        if not check_system_deps_linux():
            print(f"{Colors.YELLOW}⚠️ Algunas funciones pueden no funcionar correctamente{Colors.END}")
            time.sleep(2)
    
    ruta_xonispam = get_xonispam_path()
    if not ruta_xonispam:
        print(f"\n{Colors.RED}❌ No se encuentra xonispam.py{Colors.END}")
        print(f"Buscado en: /usr/share/xonispam/, ~/.xonispam/, directorio actual")
        sys.exit(1)
    
    xonispam_dir = os.path.dirname(ruta_xonispam)
    print(f"{Colors.GREEN}✓ xonispam.py encontrado en: {xonispam_dir}{Colors.END}")
    
    os.chdir(xonispam_dir)
    print(f"\n{Colors.BOLD}🚀 Iniciando XONISPAM...{Colors.END}")
    print(f"{Colors.CYAN}Para detener el envio: Ctrl+C{Colors.END}")
    print(f"{Colors.YELLOW}El programa da 3 segundos para enfocar la ventana destino{Colors.END}")
    print("-"*50)
    
    try:
        python_cmd = get_python_command()
        subprocess.run(python_cmd + [ruta_xonispam])
    except KeyboardInterrupt:
        print(f"\n{Colors.YELLOW}🛑 Programa detenido por el usuario.{Colors.END}")
    except Exception as e:
        print(f"\n{Colors.RED}❌ Error: {e}{Colors.END}")
    
    print(f"\n{Colors.GREEN}Gracias por usar XONISPAM{Colors.END}")
    print(f"{Colors.BLUE}#Somos XONINDU{Colors.END}")
    if get_system() != 'windows':
        input(f"{Colors.YELLOW}Presiona Enter para salir...{Colors.END}")

if __name__ == '__main__':
    try:
        main()
    except KeyboardInterrupt:
        print(f"\n{Colors.YELLOW}Saliendo...{Colors.END}")
    except Exception as e:
        print(f"\n{Colors.RED}Error inesperado: {e}{Colors.END}")
