# pamac-flatpak-gnome
A Gtk3 frontend for libalpm (with AUR, Flatpak, AppIndicator support, and GNOME integration)

# Attribution
This package is a modified version of [pamac-nosnap](https://aur.archlinux.org/packages/pamac-nosnap) with a slightly different install and GNOME integration. <br >

It was originally based on [pamac-all](https://aur.archlinux.org/packages/pamac-all) with snapd removed.

# Notes
The Flathub Beta repository is enable by default. <br >
I have also removed the post_upgrade() function to make it so that if you remove any of the default Flatpak repo, they won't persistently come back after an update.