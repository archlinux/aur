#!/usr/bin/env python3
import sys
import warnings
# hide annoying warnings
warnings.filterwarnings("ignore", category=DeprecationWarning)
import asyncio
import init_gi
from gi.repository import Gio, GLib
from gi.events import GLibEventLoopPolicy
from main import FlmChatApp

# set app name so taskbar icon works
GLib.set_prgname("com.marley.FastFlowLM-gtk")
GLib.set_application_name("FastFlowLM-gtk")

# policy setup before loops
asyncio.set_event_loop_policy(GLibEventLoopPolicy())

if __name__ == "__main__":
    app = FlmChatApp()
    app.run(sys.argv)
