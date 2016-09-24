# cleanupdate

Simple script to update and clean an Arch-based system.

The script can switch between Italian and English languages.
(At the moment it hasn't very elegant structure, it's a work in progress.)

### Features:

 - update local database; (`pacman -Syy`)
 - update packages from repositories; (`pacman -Syu`)
 - update packages from AUR (`pacaur` or `yaourt`); (`pacaur -Sua` || `yaourt -Sua`)
 - search and uninstall orphaned packages; (`pacman -Rs $(pacman -Qdtq)`)
 - clean the cache of installed packages; (`paccache -rk2`)
 - clean the cache of uninstalled packages; (`paccache -ruk0`)
 - optimize (defragment) pacman database (NO SSD); (`pacman-optimize`)
 - clean temp file; (`rm -rf /tmp/*`)
 - clean thumbnails file; (`rm -rf ~/.thumbnails/*`)
 - search and clean residual file;
 - clean trash file; (`rm -rfv ~/.local/share/Trash/*`)

