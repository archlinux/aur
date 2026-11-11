# openwebstart 1.14.0-4 — source package for Arch Linux

Source tarballs are fetched by makepkg from GitHub release tags:

- OpenWebStart v1.14.0
- IcedTea-Web icedtea-web-2.0.0-alpha36

Do not replace IcedTea-Web with 1.8.8; OpenWebStart 1.14.0 has Maven dependencies on the newer alpha36 code.

Build as a normal user:

    makepkg -s
    sudo pacman -U ./openwebstart-1.14.0-4-any.pkg.tar.zst

Check:

    itw-settings
    javaws /path/to/application.jnlp

The source-built app uses system OpenJDK 11 to launch itself, and compiles source with JDK 8. It does not ship the official Install4j native launchers or bundled Java runtime. This has not been tested end-to-end on a live Arch Linux host, so test JVM Manager and a real JNLP application before using in production.

IMPORTANT: the downloaded upstream source tarballs use SKIP checksums until their SHA-256 hashes can be verified. For reproducible repository packaging, obtain hashes after downloading (`makepkg -g`) and substitute the two SKIP entries with those hashes, then verify using `makepkg --verifysource`.
