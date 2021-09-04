# Maintainer: Sri <opensource@srirangan.net>

pkgname="xlap"
pkgver="0.9.3"
pkgrel=0
pkgdesc="Window snap assistant for Xfce and the X Window System"
arch=("any")
url="https://gitlab.com/sri-at-gitlab/projects/xlap"
license=("GPL")
depends=("xdotool"
         "xorg-xprop"
         "xdg-utils"
         "python"
         "python-gobject"
         "libappindicator-gtk3"
         "python-pynput"
         "libnotify")
changelog="CHANGELOG"
source=("https://gitlab.com/sri-at-gitlab/projects/xlap/-/raw/v$pkgver/xlap"
        "https://gitlab.com/sri-at-gitlab/projects/xlap/-/raw/v$pkgver/xlap.desktop")
md5sums=("50fd1e4ea67e90b119319cdcc0ea60c1"     # md5sum xlap
         "08a752f95cf9a89273e1df8e5ad84739")    # md5sum xlap.desktop

package() {
    mkdir --parents $pkgdir/usr/bin
    mkdir --parents $pkgdir/usr/share/applications/
    install xlap $pkgdir/usr/bin
    install xlap.desktop $pkgdir/usr/share/applications/
}
