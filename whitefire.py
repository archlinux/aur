import curses
import random
import time

def main(stdscr):
    # Ascundem cursorul pentru un aspect curat
    curses.curs_set(0)
    # Setăm terminalul să nu blocheze scriptul la citirea tastelor
    stdscr.nodelay(True)
    stdscr.timeout(0)

    # Obținem dimensiunile curente ale terminalului Kitty
    height, width = stdscr.getmaxyx()

    # Caractere folosite pentru intensitatea focului (de la cel mai intens la scrum)
    # Cu cât caracterul e mai dens, cu atât focul e mai „cald”/strălucitor
    FIRE_CHARS = [" ", ".", "-", "~", "*", "x", "s", "O", "#", "M", "W", "█"]
    max_intensity = len(FIRE_CHARS) - 1

    # Inițializăm matricea de foc (ecranul de jos în sus)
    fire_pixels = [[0 for _ in range(width)] for _ in range(height)]

    try:
        while True:
            # Verificăm dacă utilizatorul apasă 'q' pentru a închide
            ch = stdscr.getch()
            if ch == ord('q'):
                break

            # Generăm o nouă linie de „căldură” la baza ecranului
            for x in range(width):
                fire_pixels[height - 1][x] = random.choice([max_intensity, max_intensity - 2, 0])

            # Propagăm focul în sus pe ecran (algoritmul PSX Doom Fire)
            for y in range(1, height):
                for x in range(width):
                    # Citim pixelul de sub cel curent
                    below_pixel = fire_pixels[y][x]
                    
                    if below_pixel > 0:
                        # Introducem un factor aleatoriu de stingere și deviere la stânga/dreapta
                        decay = random.randint(0, 2)
                        wind = random.randint(-1, 1)
                        
                        new_y = y - 1
                        new_x = (x + wind + width) % width
                        
                        # Calculăm noua intensitate a pixelului care urcă
                        new_intensity = below_pixel - decay
                        fire_pixels[new_y][new_x] = max(0, new_intensity)
                    else:
                        fire_pixels[y - 1][x] = 0

            # Desenăm matricea pe ecran folosind nuanțele de alb/text curat
            for y in range(height - 1):
                for x in range(width):
                    intensity = fire_pixels[y][x]
                    char = FIRE_CHARS[intensity]
                    try:
                        stdscr.addch(y, x, char)
                    except curses.error:
                        pass # Ignorăm erorile de colț de ecran

            stdscr.refresh()
            # Controlăm viteza animației (aprox. 30 FPS)
            time.sleep(0.03)

    except KeyboardInterrupt:
        pass # Permitem închiderea curată cu Ctrl+C

if __name__ == "__main__":
    curses.wrapper(main)

#!/usr/bin/env python


