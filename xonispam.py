#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""
XONISPAM 2026 - Herramienta de Automatización de Teclado
Spam educativo para pruebas de teclado
Desarrollador: Darian Alberto Camacho Salas
Organización: XONIDU
#Somos XONINDU
"""

import pyautogui
import time
import sys
import os
import platform

# Colores para terminal
class Colors:
    GREEN = '\033[92m'
    YELLOW = '\033[93m'
    RED = '\033[91m'
    BLUE = '\033[94m'
    CYAN = '\033[96m'
    END = '\033[0m'
    BOLD = '\033[1m'

def clear_screen():
    os.system('cls' if platform.system() == 'Windows' else 'clear')

def print_menu():
    print(f"""
{Colors.BOLD}{Colors.CYAN}═══════════════════════════════════════════════════════════
                    XONISPAM 2026                    
              Herramienta de Automatización          
═══════════════════════════════════════════════════════════{Colors.END}

{Colors.BOLD}MENU PRINCIPAL:{Colors.END}

  {Colors.GREEN}[0]{Colors.END} SPAM normal - Envia un mismo mensaje N veces
  {Colors.GREEN}[1]{Colors.END} SPAM de texto - Envia palabra por palabra desde archivo .txt
  {Colors.GREEN}[2]{Colors.END} SALIR

{Colors.YELLOW}⚠️  ADVERTENCIA: Solo para fines educativos{Colors.END}
{Colors.YELLOW}   No usar para acosar o enviar spam no solicitado{Colors.END}

Selecciona una opcion: """, end='')

def spam_normal():
    print(f"\n{Colors.BOLD}SPAM NORMAL{Colors.END}")
    print("-" * 40)
    
    mensaje = input(f"{Colors.YELLOW}Mensaje a enviar:{Colors.END} ")
    try:
        cantidad = int(input(f"{Colors.YELLOW}Cuantas veces?{Colors.END} "))
    except ValueError:
        print(f"{Colors.RED}Error: Debes ingresar un numero valido{Colors.END}")
        return
    
    if cantidad <= 0:
        print(f"{Colors.RED}Error: La cantidad debe ser mayor a 0{Colors.END}")
        return
    
    print(f"\n{Colors.BOLD}Preparando para enviar {cantidad} veces...{Colors.END}")
    print(f"{Colors.YELLOW}En 3 segundos comenzara el envio.{Colors.END}")
    print(f"{Colors.YELLOW}Asegurate de tener el cursor en el lugar correcto!{Colors.END}")
    print(f"{Colors.RED}Para detener: Ctrl+C{Colors.END}")
    
    for i in range(3, 0, -1):
        print(f"{i}...")
        time.sleep(1)
    
    print(f"{Colors.GREEN}Enviando...{Colors.END}")
    
    try:
        for i in range(cantidad):
            pyautogui.typewrite(mensaje)
            pyautogui.press('enter')
            time.sleep(0.1)
            print(f"Enviado {i+1}/{cantidad}", end='\r')
        
        print(f"\n{Colors.GREEN}Completado! Se enviaron {cantidad} mensajes{Colors.END}")
    except KeyboardInterrupt:
        print(f"\n{Colors.YELLOW}Detenido por el usuario{Colors.END}")
    except Exception as e:
        print(f"\n{Colors.RED}Error durante el envio: {e}{Colors.END}")

def spam_archivo():
    print(f"\n{Colors.BOLD}SPAM DE TEXTO DESDE ARCHIVO{Colors.END}")
    print("-" * 40)
    
    ruta = input(f"{Colors.YELLOW}Ruta del archivo .txt:{Colors.END} ")
    
    if not os.path.exists(ruta):
        print(f"{Colors.RED}Error: El archivo '{ruta}' no existe{Colors.END}")
        return
    
    try:
        with open(ruta, 'r', encoding='utf-8') as archivo:
            contenido = archivo.read()
        
        palabras = contenido.split()
        
        if not palabras:
            print(f"{Colors.RED}Error: El archivo esta vacio{Colors.END}")
            return
        
        print(f"\n{Colors.BOLD}Archivo cargado: {ruta}{Colors.END}")
        print(f"Total de palabras: {len(palabras)}")
        
        try:
            pausa = float(input(f"{Colors.YELLOW}Pausa entre palabras (segundos, 0.1-0.5):{Colors.END} ") or "0.2")
        except ValueError:
            pausa = 0.2
        
        print(f"\n{Colors.BOLD}Preparando para enviar {len(palabras)} palabras...{Colors.END}")
        print(f"{Colors.YELLOW}En 3 segundos comenzara el envio.{Colors.END}")
        
        for i in range(3, 0, -1):
            print(f"{i}...")
            time.sleep(1)
        
        print(f"{Colors.GREEN}Enviando...{Colors.END}")
        
        try:
            for i, palabra in enumerate(palabras, 1):
                pyautogui.typewrite(palabra + ' ')
                time.sleep(pausa)
                print(f"Enviadas {i}/{len(palabras)} palabras", end='\r')
            
            pyautogui.press('enter')
            print(f"\n{Colors.GREEN}Completado! Se enviaron {len(palabras)} palabras{Colors.END}")
        except KeyboardInterrupt:
            print(f"\n{Colors.YELLOW}Detenido por el usuario{Colors.END}")
            
    except Exception as e:
        print(f"\n{Colors.RED}Error: {e}{Colors.END}")

def main():
    clear_screen()
    
    try:
        while True:
            print_menu()
            opcion = input().strip()
            
            if opcion == '0':
                spam_normal()
                input(f"\n{Colors.YELLOW}Presiona Enter para continuar...{Colors.END}")
                clear_screen()
            elif opcion == '1':
                spam_archivo()
                input(f"\n{Colors.YELLOW}Presiona Enter para continuar...{Colors.END}")
                clear_screen()
            elif opcion == '2':
                print(f"\n{Colors.GREEN}Gracias por usar XONISPAM{Colors.END}")
                print(f"{Colors.BLUE}#Somos XONINDU{Colors.END}")
                sys.exit(0)
            else:
                print(f"{Colors.RED}Opcion invalida{Colors.END}")
                time.sleep(1)
                clear_screen()
    except KeyboardInterrupt:
        print(f"\n{Colors.YELLOW}Saliendo...{Colors.END}")
        sys.exit(0)

if __name__ == "__main__":
    main()
