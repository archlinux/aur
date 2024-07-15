# Maintainer:
# Contributor: Gavin Lloyd <gavinhungry@gmail.com>

_fontname="fifthleg"
_pkgname="otf-$_fontname"
pkgname="$_pkgname"
pkgver=0.6
pkgrel=8
pkgdesc="Font used for openSUSE-branded material"
url="https://build.opensuse.org/package/show/openSUSE:Factory/fifth-leg-font"
license=('OFL-1.1')
arch=('any')

source=("https://api.opensuse.org/public/source/openSUSE:Factory/fifth-leg-font/opensuse-font-fifth-leg-$pkgver.tar.bz2")
sha256sums=('2facb31148078fa17264ce5bcd6c30e59769150f0b7d6c6536de15bb3f2c5f55')

package() {
  install -Dm644 *.otf -t "$pkgdir/usr/share/fonts/OTF/"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
