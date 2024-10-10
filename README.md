
# test
https://wiki.archlinux.org/title/Arch_User_Repository#Installing_and_upgrading_packages
makepkg
pacman -U versiobit

# publishing
makepkg --printsrcinfo > .SRCINFO
git push
