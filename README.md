# AUR package for google auth libpam #

### DESCRIPTION ###

From the google authenticator [homepage](https://code.google.com/p/google-authenticator/):
> The PAM module can add a two-factor authentication step to any PAM-enabled application. It supports:
>
>    * Per-user secret and status file stored in user's home directory
>    * Support for 30-second TOTP codes
>    * Support for emergency scratch codes
>    * Protection against replay attacks
>    * Key provisioning via display of QR code
>    * Manual key entry of RFC 3548 base32 key strings

This PKGBUILD uses the latest source from the official google authenticator libpam [git repo](http://code.google.com/p/google-authenticator/source/checkout) to build an Arch Linux ``pkg.tar.xz``.

### INSTALL ###
    git clone git@github.com:calid/aur-google-authenticator-libpam-git.git
    cd aur-google-authenticator-libpam-git
    makepkg
    sudo pacman -U google-authenticator-libpam-git-XYZ-any.pkg.tar.xz


