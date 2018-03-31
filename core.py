import logging
import time
from threading import Thread

import os

import sys

from generators import Generator
from scanners import Scanner
from settings import Settings

VERSION = '1.0'

# OpenLeecher class
# Application's core.
class OpenLeecher:
    # Init
    # Args : None
    def __init__(self):
        self.VERSION = VERSION
        self.running = False
        self.paused = False
        self.autoopen = False
        self.s = Settings()

        if getattr(sys, 'frozen', False):
            self.application_path = os.path.dirname(sys.executable)
        elif __file__:
            self.application_path = os.path.dirname(__file__)

        if os.name == 'nt':
            self.logfile = os.path.join(self.application_path, "openleecher.log")
        else:
            self.logfile = "/etc/openleecher/openleecher.log"
        logging.basicConfig(format='%(asctime)s | %(message)s', filename=self.logfile, level=logging.DEBUG)

        self.behavior = int(self.s.get('Core', 'behavior'))

        self.generator = Generator(self.s)
        self.scanner = Scanner(self.s)

        self.maxthreads = int(self.s.get('Core', 'threads'))
        self.threads = []

    # Can run
    # Return True if the core can start a session.
    # Args : None
    def can_run(self):
        if len(self.generator.get_actives()) > 0 and len(self.scanner.get_actives()) > 0:
            return True
        return False

    # Run
    # Power on the core.
    # Args : None
    def run(self):
        logging.info("Starting OpenLeecher v" + self.VERSION + "...")
        logging.info("Generators loaded : " + self.generator.tostring())
        logging.info("Scanners loaded : " + self.scanner.tostring())
        logging.info("== Session start ==")
        self.running = True
        while self.running:
            self.update_threads()
        logging.info("== Session end ==")
        self.flush_threads()
        self.deactivate_all()
        self.scanner.bl = []

    # Pause
    # Toggles the core.
    # Args : None
    def pause(self):
        self.running = not self.running

    # Stop
    # Stop the core.
    # Args : None
    def stop(self):
        self.paused = False
        self.running = False

    # Reboot
    # Reload core with new settings.
    # Args : None
    def reboot(self):
        if self.running:
            self.stop()
        while len(self.threads) > 0:
            time.sleep(1)
            print("waiting for threads to finish (" + str(len(self.threads)) + " left)")
        self.__init__()

    # Add thread
    # Manually add thread.
    # Args : v=address to scan
    def add_thread(self, v):
        self.threads.append(Thread(target=self.scanner.scan, args=(v,)))
        self.threads[len(self.threads) - 1].start()

    # Update threads
    # Clean then populate threads.
    # Args : None
    def update_threads(self):
        self.clean_threads()
        self.populate_threads()

    # Populate threads
    # Check then proceed to launch a new thread with a pair depending on the behavior.
    # Args : None
    def populate_threads(self):
        if len(self.threads) < self.maxthreads and len(self.generator.get_actives()) > 0 and len(self.scanner.get_actives()) > 0 and not self.paused:
            self.threads.append(Thread(target=self.scanner.scan, args=(self.generator.generate(), self.behavior,)))
            self.threads[len(self.threads) - 1].start()
        if self.paused:
            time.sleep(0.1)

    # Clean threads
    # Check for dead threads to remove them
    # Args : None
    def clean_threads(self):
        if len(self.threads) > 0:
            r = []
            for i in range(0, len(self.threads)):
                if self.threads[i].is_alive() is False:
                    r.append(self.threads[i])
            for x in r:
                self.threads.remove(x)
            del r

    # Flush treads
    # Remove all working threads
    # Args : None
    def flush_threads(self):
        self.threads = []

    # Deactivate All
    # Deactivate every scanner and generator
    # Args : None
    def deactivate_all(self):
        for g in self.generator.g:
            g.active = False
        for s in self.scanner.s:
            s.active = False