# Maintainer: Ramadan Ali <rot13:ezqa@ezqa.ny>
pkgname=gnome-console-bin
pkgver=43.0
pkgrel=1
pkgdesc="A simple user-friendly terminal emulator for the GNOME desktop"
arch=("x86_64")
url="https://gitlab.gnome.org/GNOME/console/"
license=("GPL3")
groups=("gnome-extra")
depends=("libgtop" "libadwaita" "vte4")
provides=(${pkgname%-bin})
conflicts=(${pkgname%-bin})
source=("https://kojipkgs.fedoraproject.org//packages/gnome-console/${pkgver}/1.fc38/x86_64/${pkgname%-bin}-${pkgver}-1.fc38.x86_64.rpm")
sha1sums=("9d8c68c0f08991e9af5d41edcb2456c8fb2d0a9d")

package() {
        rm -r $srcdir/usr/lib
        mv $srcdir/usr $pkgdir/usr
}
