#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""
XONIMET 2026 - Lanzador Universal con Gestor de Dependencias
Extractor universal de metadatos para equipos de bajos recursos
Desarrollador: Darian Alberto Camacho Salas
Organización: XONIDU
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

def get_xonimet_path():
    """Detecta la ruta de xonimet.py en múltiples ubicaciones"""
    script_dir = get_script_dir()
    rutas = [
        os.path.join(script_dir, 'xonimet.py'),
        '/usr/share/xonimet/xonimet.py',
        os.path.join(os.path.expanduser("~"), '.xonimet', 'xonimet.py'),
        os.path.join(os.getcwd(), 'xonimet.py')
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
║                    XONIMET 2026 v2.1                      ║
║              Extractor Universal de Metadatos              ║
║                   Optimizado para 1GB RAM                   ║
║                                                            ║
║               Sistema detectado: {sistema_texto:<27} ║
║                                                            ║
║               Desarrollado por: Darian Alberto             ║
║                      Camacho Salas                         ║
║                      Organización: XONIDU                  ║
╚══════════════════════════════════════════════════════════════╝{Colors.END}
    """
    print(banner)

def mostrar_ayuda():
    ayuda = f"""
{Colors.BOLD}USO DE XONIMET:{Colors.END}

  xonimet [archivo] [opciones]

{Colors.BOLD}EJEMPLOS:{Colors.END}

  Analizar un archivo:
    xonimet foto.jpg
    xonimet cancion.mp3
    xonimet video.mp4

  Modo interactivo (con menu):
    xonimet

  Guardar resultados en JSON:
    xonimet foto.jpg --json

  Generar reporte PDF:
    xonimet video.mp4 --pdf

{Colors.BOLD}COMANDOS EN MODO INTERACTIVO:{Colors.END}

  [1] Seleccionar archivo
  [2] Analizar archivo actual
  [3] Guardar resultados en JSON
  [4] Generar reporte PDF
  [5] Salir

{Colors.BOLD}CARACTERISTICAS:{Colors.END}

  ✅ Extrae metadatos de fotos, audio, video, documentos
  ✅ Genera reportes PDF profesionales
  ✅ Modo interactivo y linea de comandos
  ✅ Sin necesidad de sudo
    """
    print(ayuda)

# ============================================================================
# Gestión de dependencias
# ============================================================================
REQUISITOS = [
    'pillow>=10.0.0',
    'mutagen>=1.46.0',
    'ffmpeg-python>=0.2.0',
    'PyPDF2>=3.0.0',
    'python-docx>=0.8.11',
    'openpyxl>=3.1.0',
    'python-pptx>=0.6.21',
    'exifread>=3.0.0',
    'reportlab>=4.0.0'
]

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
    return False

def install_pip_windows():
    print(f"{Colors.YELLOW}Instalando pip en Windows...{Colors.END}")
    try:
        subprocess.run([sys.executable, '-m', 'ensurepip', '--upgrade'], check=True)
        return True
    except:
        return False

def check_dependencies():
    print(f"\n{Colors.BOLD}Verificando dependencias...{Colors.END}")
    missing = []
    for req in REQUISITOS:
        package = req.split('>=')[0].split('==')[0]
        import_name = package.replace('-', '_')
        if import_name == 'pillow':
            import_name = 'PIL'
        elif import_name == 'ffmpeg_python':
            import_name = 'ffmpeg'
        try:
            __import__(import_name)
            print(f"{Colors.GREEN}  ✓ {package}{Colors.END}")
        except ImportError:
            print(f"{Colors.YELLOW}  ✗ {package} (faltante){Colors.END}")
            missing.append(req)
    return missing

def install_dependencies(missing):
    if not missing:
        return True
    
    print(f"\n{Colors.BOLD}Instalando dependencias faltantes...{Colors.END}")
    pip_cmd = get_pip_command()
    flags = get_install_flags()
    
    success = True
    for req in missing:
        print(f"  Instalando {req}...")
        try:
            cmd = pip_cmd + ['install', req] + flags
            subprocess.run(cmd, check=True, capture_output=True)
            print(f"{Colors.GREEN}  ✓ {req} instalado{Colors.END}")
        except:
            try:
                cmd = pip_cmd + ['install', req]
                subprocess.run(cmd, check=True)
                print(f"{Colors.GREEN}  ✓ {req} instalado{Colors.END}")
            except Exception as e:
                print(f"{Colors.RED}  ✗ Error instalando {req}: {e}{Colors.END}")
                success = False
    return success

def check_ffmpeg():
    """Verifica si FFmpeg está instalado"""
    print(f"\n{Colors.BOLD}Verificando FFmpeg...{Colors.END}")
    if shutil.which('ffmpeg'):
        print(f"{Colors.GREEN}  ✓ FFmpeg disponible{Colors.END}")
        return True
    else:
        print(f"{Colors.YELLOW}  ✗ FFmpeg no instalado (necesario para videos){Colors.END}")
        return False

def install_ffmpeg():
    """Instala FFmpeg según el sistema"""
    sistema = get_system()
    distro = get_linux_distro()
    
    print(f"\n{Colors.YELLOW}Instalando FFmpeg...{Colors.END}")
    
    if sistema == 'windows':
        print(f"{Colors.RED}Windows: Descarga manual desde https://ffmpeg.org/download.html{Colors.END}")
        return False
    elif sistema == 'darwin':
        if shutil.which('brew'):
            subprocess.run(['brew', 'install', 'ffmpeg'], check=True)
            return True
        else:
            print(f"{Colors.RED}Instala Homebrew primero: https://brew.sh/{Colors.END}")
            return False
    elif sistema == 'linux':
        if distro == 'debian-based':
            subprocess.run(['sudo', 'apt', 'update'], check=False)
            subprocess.run(['sudo', 'apt', 'install', '-y', 'ffmpeg'], check=True)
        elif distro == 'arch-based':
            subprocess.run(['sudo', 'pacman', '-S', '--noconfirm', 'ffmpeg'], check=True)
        elif distro == 'fedora':
            subprocess.run(['sudo', 'dnf', 'install', '-y', 'ffmpeg'], check=True)
        else:
            print(f"{Colors.RED}Distribución no soportada para instalación automática{Colors.END}")
            return False
        print(f"{Colors.GREEN}FFmpeg instalado correctamente{Colors.END}")
        return True
    return False

# ============================================================================
# Gestor de configuración
# ============================================================================
def get_config_dir():
    """Retorna el directorio de configuración (~/.xonimet/)"""
    return os.path.join(os.path.expanduser("~"), '.xonimet')

def ensure_config_dir():
    """Asegura que el directorio de configuración existe"""
    config_dir = get_config_dir()
    os.makedirs(config_dir, exist_ok=True)
    return config_dir

# ============================================================================
# Creación de accesos directos para Windows
# ============================================================================
def create_windows_bat():
    """Crea archivos .bat para ejecución en Windows"""
    if get_system() != 'windows':
        return
    
    script_dir = get_script_dir()
    
    # Batch con permisos de administrador
    admin_bat = f'''@echo off
title XONIMET 2026 - Extractor de Metadatos
color 1F
cls

echo ========================================
echo      XONIMET 2026 - Extractor Universal
echo      Desarrollado por Darian Alberto
echo ========================================
echo.

:: Verificar permisos de administrador
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo [AVISO] Se requieren permisos de administrador
    echo.
    echo Solicitando permisos...
    echo.
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\\getadmin.vbs"
    echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\\getadmin.vbs"
    "%temp%\\getadmin.vbs"
    del "%temp%\\getadmin.vbs"
    exit /B
)

:: Verificar Python
python --version >nul 2>&1
if errorlevel 1 (
    echo [ERROR] Python no esta instalado
    echo Descarga desde: https://www.python.org/downloads/
    start https://www.python.org/downloads/
    pause
    exit
)

echo [OK] Python disponible
echo.

:: Instalar pip si es necesario
python -m pip --version >nul 2>&1
if errorlevel 1 (
    echo Instalando pip...
    python -m ensurepip --upgrade
)

:: Instalar dependencias
echo Instalando dependencias...
python -m pip install pillow>=10.0.0 mutagen>=1.46.0 ffmpeg-python>=0.2.0
python -m pip install PyPDF2>=3.0.0 python-docx>=0.8.11
python -m pip install openpyxl>=3.1.0 python-pptx>=0.6.21
python -m pip install exifread>=3.0.0 reportlab>=4.0.0
echo.

:: Ejecutar XONIMET
python "{script_dir}\\start.py" %*
pause
'''
    
    bat_path = os.path.join(script_dir, 'XONIMET_ADMIN.bat')
    with open(bat_path, 'w', encoding='utf-8') as f:
        f.write(admin_bat)
    print(f"{Colors.GREEN}✓ Creado XONIMET_ADMIN.bat{Colors.END}")
    
    # Batch simple sin admin
    simple_bat = f'''@echo off
title XONIMET 2026
color 1F
python "{script_dir}\\start.py" %*
pause
'''
    simple_path = os.path.join(script_dir, 'XONIMET.bat')
    with open(simple_path, 'w', encoding='utf-8') as f:
        f.write(simple_bat)
    print(f"{Colors.GREEN}✓ Creado XONIMET.bat{Colors.END}")

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
    
    # Verificar Python
    if not check_python():
        print(f"\n{Colors.RED}❌ Python no esta instalado{Colors.END}")
        print("   Descarga desde: https://www.python.org/downloads/")
        sys.exit(1)
    
    ver_py = subprocess.run(get_python_command() + ['--version'], capture_output=True, text=True).stdout.strip()
    print(f"{Colors.BOLD}Python:{Colors.END} {ver_py}")
    
    # Verificar/instalar pip
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
    
    # Verificar/instalar dependencias Python
    missing = check_dependencies()
    if missing:
        print(f"\n{Colors.YELLOW}⚠️ Faltan {len(missing)} dependencias{Colors.END}")
        respuesta = input(f"¿Instalar ahora? (s/n): ")
        if respuesta.lower() == 's':
            if not install_dependencies(missing):
                print(f"{Colors.RED}Algunas dependencias no se instalaron{Colors.END}")
    
    # Verificar FFmpeg (opcional)
    if not check_ffmpeg():
        respuesta = input(f"¿Instalar FFmpeg ahora? (s/n): ")
        if respuesta.lower() == 's':
            install_ffmpeg()
    
    # Crear directorio de configuración
    ensure_config_dir()
    print(f"{Colors.GREEN}✓ Configuración en: {get_config_dir()}{Colors.END}")
    
    # Crear accesos directos para Windows
    if get_system() == 'windows':
        create_windows_bat()
    
    # Buscar xonimet.py
    ruta_xonimet = get_xonimet_path()
    if not ruta_xonimet:
        print(f"\n{Colors.RED}❌ No se encuentra xonimet.py{Colors.END}")
        sys.exit(1)
    
    xonimet_dir = os.path.dirname(ruta_xonimet)
    print(f"{Colors.GREEN}✓ xonimet.py encontrado en: {xonimet_dir}{Colors.END}")
    
    # Cambiar al directorio y ejecutar
    os.chdir(xonimet_dir)
    print(f"\n{Colors.BOLD}🚀 Iniciando XONIMET...{Colors.END}")
    print(f"{Colors.CYAN}Para salir: Ctrl+C{Colors.END}")
    print("-" * 50)
    
    try:
        python_cmd = get_python_command()
        subprocess.run(python_cmd + [ruta_xonimet] + sys.argv[1:])
    except KeyboardInterrupt:
        print(f"\n{Colors.YELLOW}🛑 Programa detenido por el usuario.{Colors.END}")
    except Exception as e:
        print(f"\n{Colors.RED}❌ Error: {e}{Colors.END}")
    
    print(f"\n{Colors.GREEN}Gracias por usar XONIMET{Colors.END}")
    if get_system() != 'windows':
        input(f"{Colors.YELLOW}Presiona Enter para salir...{Colors.END}")

if __name__ == '__main__':
    try:
        main()
    except KeyboardInterrupt:
        print(f"\n{Colors.YELLOW}Saliendo...{Colors.END}")
    except Exception as e:
        print(f"\n{Colors.RED}Error inesperado: {e}{Colors.END}")
