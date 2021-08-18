# pamac-flatpak
A Gtk3 frontend for libalpm (with AUR, Flatpak and AppIndicator support)

# Attribution
This package is a modified version of [pamac-all](https://aur.archlinux.org/packages/pamac-all) with Snapd removed and added GNOME integration. <br >

# Notes
The Flathub Beta repository is enable by default. <br >
I have also removed the post_upgrade() function to make it so that if you remove any of the default Flatpak repo, they won't persistently come back after an update.