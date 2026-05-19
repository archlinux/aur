#!/usr/bin/env python3
import sys
import asyncio
import gi
gi.require_version("Gtk", "4.0")
gi.require_version("Adw", "1")
gi.require_version("Soup", "3.0")
from gi.repository import Gio
from gi.events import GLibEventLoopPolicy
from main import FlmChatApp

# Set the policy BEFORE creating any loops
asyncio.set_event_loop_policy(GLibEventLoopPolicy())

if __name__ == "__main__":
    app = FlmChatApp()
    app.run(sys.argv)
