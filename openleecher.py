import logging
import os, sys
import random
import sys
import time
from threading import Thread

from termcolor import cprint

from core import OpenLeecher
from kbhit import KBHit

# Core class
# Handles the core, can be threaded
# Args : None
class Core(Thread):
    def __init__(self):
        Thread.__init__(self, target=self.run)
        self.core = OpenLeecher()

    def run(self):
        self.core.run()

ol = Core()

# Show Help
# Display help in console
# Args : None
def show_help():
    cprint("OpenLeecher v" + ol.core.VERSION, 'blue', attrs=['bold'])
    cprint("Made by lwsk", 'blue')
    cprint("https://openleecher.tk/\n", 'blue')
    cprint("Command line arguments:", attrs=['bold'])
    cprint("\t-b 0 : set behavior")
    cprint("\t-g IPGenerator : set generator(s)")
    cprint("\t-s WEBScanner FTPScanner : set scanner(s)")
    cprint("\t-t 8 : set thread limit at 8")
    cprint("\t-h : display help")
    cprint("\nBehaviors", attrs=['bold'])
    cprint("\t0 : Random")
    cprint("\t1 : Intelligent")
    cprint("\t2 : Complete")
    cprint("\nAvailable generator(s):", attrs=['bold'])
    for g in ol.core.generator.g:
        cprint("\t" + g.__class__.__name__)
    cprint("\nAvailable scanner(s):", attrs=['bold'])
    for s in ol.core.scanner.s:
        cprint("\t" + s.__class__.__name__)

# Reset UI
# Clear console screen and re-draw UI
# Args : None
def reset_UI():
    os.system('cls' if os.name == 'nt' else 'clear')
    print(""".-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-.
|                                                               |
|     OpenLeecher v"""+ol.core.VERSION+"""                                          |
|                                                               |
|     Generators :                                              |""")
    for g in ol.core.generator.g:
        if g.active is True:
            print("""
|            """+str(g.__class__.__name__).strip()+"""                                      |""")
    print("""
!                                                               !
:                                                               :
:     Scanners :                                                :""")
    for s in ol.core.scanner.s:
        if s.active is True:
            print("""
.            """+str(s.__class__.__name__).strip()+"""                                         .""")
    print("""
:                                                               :
:                                                               :
!                                                               !
|     Controls :                                                |
|         'o'        Raise maximum thread limit                 |
|         'l'        Lower maximum thread limit                 |
|         'p'        Toggle auto-open                           |
|         space      Pause/Resume generator                     |
|         'q' / esc  Quit                                       |
|                                                               |
`-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-'
    """)
    print("\n")


def run_core():
    running = True
    reset_UI()
    kb = KBHit()
    while running:
        if kb.kbhit():
            c = kb.getch()
            if len(c) > 0:
                if c == 'q' or ord(c) is 27: # esc
                    running = False
                elif c == 'o':
                    ol.core.maxthreads += 1
                elif c == 'l':
                    if ol.core.maxthreads > 0:
                        ol.core.maxthreads -= 1
                elif c == 'p':
                    ol.core.autoopen = not ol.core.autoopen
                elif ord(c) is 32 : # space
                    ol.core.paused = not ol.core.paused
                #else:
                    #sys.stdout.write('\r' + 'Keycode not registered ' + str(ord(c)) + '\n')

        pre = ""
        if ol.core.paused is True:
            pre += '[PAUSED] '
        if ol.core.autoopen is True:
            pre += '[AUTO-OPEN] '

        sys.stdout.write("\r" + pre + str(len(ol.core.threads)) + "/" + str(ol.core.maxthreads) + " threads running" + ('.' * random.randint(1, 3)) + "           ")

        # Notifications
        if len(ol.core.scanner.results) > 0:
            x = ol.core.scanner.results.pop(0)
            sys.stdout.write("\r" + "Found " + str(x.p) + " @ " + str(x.v) + '\n')

        time.sleep(0.04)

    sys.stdout.write("\r" + "Quitting OpenLeecher..." + "\n")
    logging.info("Quitting OpenLeecher...")
    sys.exit(0)


def start():
    for i in range(1, len(sys.argv)):
        a = sys.argv[i]
        if str(a) == '-h':
            show_help()
            run = False
            logging.info("Quitting OpenLeecher...")
            sys.exit(0)
        elif str(a) == '--gui':
            import gui
            gui.launch()

        elif str(a) == '-t':
            try:
                ol.core.maxthreads = int(sys.argv[i + 1])
            except:
                run = False
                cprint("Error !", 'red', attrs=['bold']),
                print("Thread limit argument (-t) value is invalid")

        elif str(a) == '-b':
            try:
                ol.core.behavior = int(sys.argv[i + 1])
            except:
                run = False
                cprint("Error !", 'red', attrs=['bold']),
                print("Thread limit argument (-t) value is invalid")

        elif str(a) == '-g':
            j = 1
            try:
                while str(sys.argv[i + j]).startswith('-') is False:
                    if ol.core.generator.activate(str(sys.argv[i + j])) is False:
                        cprint("Error !", 'red', attrs=['bold']),
                        print("Generator " + str(sys.argv[i + j]) + " cannot be loaded.")
                        logging.error("Error : Generator " + str(sys.argv[i + j]) + " cannot be loaded.")
                        break
                    j += 1
            except:
                pass

        elif str(a) == '-s':
            j = 1
            try:
                while str(sys.argv[i + j]).startswith('-') is False:
                    if ol.core.scanner.activate(str(sys.argv[i + j])) is False:
                        cprint("Error !", 'red', attrs=['bold']),
                        print("Scanner " + str(sys.argv[i + j]) + " cannot be loaded.")
                        logging.error("Error : Scanner " + str(sys.argv[i + j]) + " cannot be loaded.")
                        break
                    j += 1
            except:
                pass

    if ol.core.can_run() is True:
        ol.start()
        run_core()
    else:
        cprint("Error !", 'red', attrs=['bold'])
        print("There must be at least one generator and one scanner active.")
        logging.error("Error : There must be at least one generator and one scanner active.")
        logging.warning("Cannot start session.")
        logging.info("Quitting OpenLeecher...")
        sys.exit(0)

if __name__ == '__main__':
    start()
    sys.exit(0)