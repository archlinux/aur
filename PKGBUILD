# Maintainer: Murat Çileli <murat.cileli@gmail.com>

pkgname="adwaita-creamy-gtk-theme"
pkgver="3.24.8"
pkgrel="1"
pkgdesc="Refreshed new Adwaita theme with creamy colors and minor changes."
arch=("x86_64")
license=("MIT")
url="https://github.com/murat-cileli/adwaita-creamy"
makedepends=()
provides=("adwaita-creamy-gtk-theme")
source=("https://github.com/murat-cileli/adwaita-creamy/archive/$pkgver.tar.gz")
sha256sums=("SKIP")

package() {  
    # Create directory
    mkdir -p $pkgdir/usr/share/themes/adwaita-creamy

    # Copy contents
    cp -r "$srcdir/adwaita-creamy-3.24.8/." "$pkgdir/usr/share/themes/adwaita-creamy"
}
