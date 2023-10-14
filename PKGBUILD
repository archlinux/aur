# Maintainer: markstos <mark@stosberg.com>
# Fuzzel is not be 100% compatible with dmenu
pkgname=fuzzel-dmenu-dropin
pkgver=1.0
pkgrel=1
pkgdesc="Makes symlinks to provide dmenu when using fuzzel."
arch=('any')
license=('none')
depends=('fuzzel')
provides=('dmenu')
conflicts=('dmenu')


package() {
    mkdir -p "$pkgdir/usr/bin"
    mkdir -p "$pkgdir/usr/share/man/"
    mkdir -p "$pkgdir/usr/share/man/man1"
    ln -sf "fuzzel" "$pkgdir/usr/bin/dmenu"
    ln -sf "fuzzel.1.gz" "$pkgdir/usr/share/man/man1/dmenu.1.gz"
}
