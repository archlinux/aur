#!/usr/bin/python
"""Run a command with a headless, unlocked org.freedesktop.secrets provider.

Must run inside a private D-Bus session (dbus-run-session). Starts whichever
provider is installed (gnome-keyring, oo7, KWallet, KeePassXC or ChiPass),
waits until its default collection is unlocked, runs the command, then stops
the provider. Exits with the command's exit status.
"""

import os
import shutil
import signal
import socket
import subprocess
import sys
import tempfile
import time

from gi.repository import Gio, GLib

PASSWORD = "secret"
DATABASE_XML = """<?xml version="1.0" encoding="UTF-8"?>
<KeePassFile><Meta><DatabaseName>test</DatabaseName><CustomData><Item><Key>FDO_SECRETS_EXPOSED_GROUP</Key><Value>{11111111-2222-3333-4444-555555555555}</Value></Item></CustomData></Meta>
<Root><Group><UUID>ERERESIiMzNERFVVVVVVVQ==</UUID><Name>Root</Name></Group></Root></KeePassFile>
"""
KEEPASS_CONFIG = """[FdoSecrets]
Enabled=true
ShowNotification=false
ConfirmDeleteItem=false
ConfirmAccessItem=false
UnlockBeforeSearch=false
[GUI]
ShowTrayIcon=false
[General]
SingleInstance=false
"""


def popen(args, **kwargs):
    return subprocess.Popen(args, start_new_session=True, **kwargs)


def gnome_keyring(home):
    return popen(["gnome-keyring-daemon", "--foreground", "--unlock", "--components=secrets"], stdin=subprocess.PIPE), PASSWORD


def oo7(home):
    return popen(["/usr/lib/oo7-daemon", "--login"], stdin=subprocess.PIPE), PASSWORD


def kwallet(home):
    # ksecretd's PAM login path: password hash on a pipe, environment on a socket
    hash_read, hash_write = os.pipe()
    path = os.path.join(home, "kwallet.socket")
    server = socket.socket(socket.AF_UNIX)
    server.bind(path)
    server.listen(1)
    env = dict(os.environ, PAM_KWALLET5_LOGIN=path, QT_QPA_PLATFORM="offscreen")
    process = popen(["ksecretd", "--pam-login", str(hash_read), str(server.fileno())], pass_fds=(hash_read, server.fileno()), env=env)
    os.close(hash_read)
    os.write(hash_write, bytes(56))
    os.close(hash_write)
    client = socket.socket(socket.AF_UNIX)
    client.connect(path)
    client.sendall(f"DBUS_SESSION_BUS_ADDRESS={os.environ['DBUS_SESSION_BUS_ADDRESS']}\n".encode())
    client.close()
    server.close()
    return process, None


def keepass(app, cli):
    def start(home):
        xml = os.path.join(home, "database.xml")
        database = os.path.join(home, "database.kdbx")
        config = os.path.join(home, "config.ini")
        with open(xml, "w") as file:
            file.write(DATABASE_XML)
        with open(config, "w") as file:
            file.write(KEEPASS_CONFIG)
        subprocess.run([cli, "import", "-q", "-p", xml, database], input=f"{PASSWORD}\n{PASSWORD}\n", text=True, check=True, stdout=subprocess.DEVNULL)
        command = [app, "--config", config, "--localconfig", os.path.join(home, "local.ini"), "--pw-stdin", database]
        return popen(["xvfb-run", "-a", *command], stdin=subprocess.PIPE), PASSWORD

    return start


PROVIDERS = [
    ("gnome-keyring-daemon", gnome_keyring),
    ("/usr/lib/oo7-daemon", oo7),
    ("ksecretd", kwallet),
    ("keepassxc", keepass("keepassxc", "keepassxc-cli")),
    ("ChiPass", keepass("ChiPass", "ChiPass-cli")),
]


def default_collection_unlocked(bus):
    try:
        path = bus.call_sync("org.freedesktop.secrets", "/org/freedesktop/secrets", "org.freedesktop.Secret.Service", "ReadAlias", GLib.Variant("(s)", ("default",)), None, Gio.DBusCallFlags.NO_AUTO_START, 1000, None).unpack()[0]
        if path == "/":
            return False
        locked = bus.call_sync("org.freedesktop.secrets", path, "org.freedesktop.DBus.Properties", "Get", GLib.Variant("(ss)", ("org.freedesktop.Secret.Collection", "Locked")), None, Gio.DBusCallFlags.NO_AUTO_START, 1000, None).unpack()[0]
        return not locked
    except GLib.Error:
        return False


def main():
    if "DBUS_SESSION_BUS_ADDRESS" not in os.environ:
        sys.exit("secret-service.py: run it inside dbus-run-session")
    for binary, start in PROVIDERS:
        if shutil.which(binary):
            break
    else:
        sys.exit("secret-service.py: no supported org.freedesktop.secrets provider installed")

    home = tempfile.mkdtemp(prefix="secret-service-")
    runtime = os.path.join(home, "runtime")
    os.mkdir(runtime, 0o700)
    for variable, directory in (("XDG_CONFIG_HOME", "config"), ("XDG_DATA_HOME", "data"), ("XDG_CACHE_HOME", "cache"), ("XDG_STATE_HOME", "state")):
        os.environ[variable] = os.path.join(home, directory)
    os.environ["XDG_RUNTIME_DIR"] = runtime

    process, password = start(home)
    if password is not None:
        process.stdin.write(f"{password}\n".encode())
        process.stdin.close()
    try:
        bus = Gio.bus_get_sync(Gio.BusType.SESSION, None)
        deadline = time.monotonic() + 60
        while not default_collection_unlocked(bus):
            if process.poll() is not None or time.monotonic() > deadline:
                sys.exit(f"secret-service.py: {binary} did not provide an unlocked default collection")
            time.sleep(0.5)
        print(f"secret-service.py: using {binary}", flush=True)
        sys.exit(subprocess.run(sys.argv[1:]).returncode)
    finally:
        try:
            os.killpg(process.pid, signal.SIGTERM)
            process.wait(10)
        except subprocess.TimeoutExpired:
            os.killpg(process.pid, signal.SIGKILL)
        except ProcessLookupError:
            pass
        shutil.rmtree(home, ignore_errors=True)


if __name__ == "__main__":
    main()
