# nbstata-pkgbuild
PKGBUILD for nbstata

1. Install STATA under `/usr/local/stataXX` (where `XX` is the STATA version number) by cd-ing into that directory and calling STATA installation script (`sudo [PATH_TO_STATA_INSTALLER]/install`)
2. Activate STATA: `sudo ./stinit`
3. Export `/usr/local/stataXX` in PATH
4. Install nbstata
5. Edit `/usr/etc/nbstata.conf` to put STATA installation folder
