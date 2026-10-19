# omofun

The publisher distributes the Windows installer through cloud storage.
Download `omofun-2.0.2-setup.exe` manually.
Place the installer in the same directory as `PKGBUILD`.

The expected SHA-256 checksum is:

```text
d4472bcd965350d43b66e7df02fe142214d8e9f35e6ccf70f1d50306d76705eb
```

Build the package:

```sh
makepkg -s
```

Install the generated package with `pacman -U`.
Start the application with `omofun`.

The package runs the extracted application with the system Electron 40.
The system Electron patch locates the tray icon in the application directory.
Use the tray menu to exit the application. Closing the main window hides it.
The download selector patch preserves the changes from the previous package.
It uses code context instead of fixed line numbers.
