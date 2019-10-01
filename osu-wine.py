#!/usr/bin/python3
import sys
import os

def prog_paths():
    with os.scandir('/proc') as sd:
        for entry in sd:
            if entry.name.isdecimal() and entry.is_dir(follow_symlinks=False):
                yield entry

def main(args):
    uid = os.getuid()

    for dirent in prog_paths():
        try:
            if dirent.stat().st_uid != uid:
                continue

            with open(dirent.path + '/comm', 'rb') as file:
                if file.read() != b'osu!.exe\n':
                    continue

            exe_path = os.readlink(dirent.path + '/exe')
            if not exe_path.endswith('/wine-preloader'):
                continue
            wine_path = exe_path[:-len('-preloader')]

            with open(dirent.path + '/environ', 'rb') as file:
                environ = file.read()
            environ = environ.split(b'\0')
            environ = environ[:-1]
            environ = dict(x.split(b'=', maxsplit=1) for x in environ)

            del environ[b'WINELOADERNOEXEC']
            os.execve(wine_path, [wine_path] + args, environ)
        except OSError:
            pass

    os.execl('/usr/bin/notify-send', 'notify-send', '-i', 'osu!', '-a', 'osu!',
             'No running osu! instance found')

if __name__ == '__main__':
    main(sys.argv[1:])
