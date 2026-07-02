"""Single-instance guard for FlooCast (Arch downstream addition).

wxWidgets' TaskBarIcon is backed by GtkStatusIcon / the _NET_SYSTEM_TRAY X11
protocol, which does nothing on Wayland/GNOME. "Minimize to System Tray" can
therefore hide the window with no tray icon to click, and a second launch
starts a rival process that fights over the /dev/ttyACM* dongle.

This guard makes the *first* process own a per-user Unix socket. A later launch
connects to that socket, tells the running instance to raise its window, and
exits before touching the dongle -- so relaunching FlooCast reliably restores a
hidden window regardless of whether a system tray exists.
"""
import atexit
import os
import socket
import tempfile
import threading

_runtime_dir = os.environ.get("XDG_RUNTIME_DIR") or tempfile.gettempdir()
_SOCK_PATH = os.path.join(_runtime_dir, f"floocast-{os.getuid()}.sock")
_server = None


def claim_or_signal():
    """Return True if we are the primary instance.

    If another instance is already listening, signal it to show its window and
    return False; the caller should then exit immediately.
    """
    global _server

    # Is a live primary already listening on the socket?
    probe = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)
    probe.settimeout(1.0)
    try:
        probe.connect(_SOCK_PATH)
        probe.sendall(b"SHOW\n")
        return False
    except OSError:
        # No live primary (missing or stale socket) -> we become primary.
        pass
    finally:
        probe.close()

    try:
        os.unlink(_SOCK_PATH)
    except FileNotFoundError:
        pass

    _server = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)
    _server.bind(_SOCK_PATH)
    _server.listen(5)
    atexit.register(_cleanup)
    return True


def start_listener(activate):
    """Spawn a daemon thread that invokes `activate` on each incoming signal."""
    if _server is None:
        return

    def _serve():
        while True:
            try:
                conn, _ = _server.accept()
            except OSError:
                return
            try:
                conn.recv(64)
            except OSError:
                pass
            finally:
                conn.close()
            try:
                activate()
            except Exception:
                pass

    threading.Thread(target=_serve, name="floocast-singleton", daemon=True).start()


def _cleanup():
    global _server
    if _server is not None:
        try:
            _server.close()
        finally:
            _server = None
    try:
        os.unlink(_SOCK_PATH)
    except FileNotFoundError:
        pass
