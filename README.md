# omofun

The publisher distributes the Windows installer through cloud storage.
Download `omofun-2.0.5-setup.exe` manually.
Place the installer in the same directory as `PKGBUILD`.

The expected SHA-256 checksum is:

```text
7f9a5423c07a8449d697667c4155c66e0eeabf177e30e74cd7d2781e3d724c5d
```

Build the package:

```sh
makepkg -s
```

Install the generated package with `pacman -U`.
Start the application with `omofun`.

The package runs the extracted application with the system Electron 40.
The system Electron patch locates the tray icon and playback configuration in the application directory.
Use the tray menu to exit the application. Closing the main window hides it.
The download selector patch preserves the changes from the previous package.
It uses code context instead of fixed line numbers.
