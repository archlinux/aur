# Contributor: quantax -- contact via Arch Linux forum or AUR

pkgname=umodunpack
pkgver=1.11
pkgrel=3
pkgdesc="A small script for extracting files from Unreal Tournament Umod intallers."
arch=(any)
url="http://www.deepsky.com/~misaka/"
license=('custom')
depends=(perl)
source=(umodunpack.pl)
sha1sums=('b163fad8a7b041f660c72698aed3f13203100d00')

package() {
    install --mode=0755 -D -- "$srcdir/umodunpack.pl" "$pkgdir/usr/bin/umodunpack"
}

