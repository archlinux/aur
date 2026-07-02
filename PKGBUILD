# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>
# Contributor: Luis Martinez <luis dot martinez at tuta dot io>
# Contributor: Szymon Scholz <first name last name [at] gmail [dot] com>

pkgname=emulsion-bin
pkgver=12.3
pkgrel=1
pkgdesc="A fast and minimalistic image viewer (binary release)"
url="https://github.com/ArturKovacs/emulsion"
license=('MIT')
arch=('x86_64')
depends=('hicolor-icon-theme' 'libavif')
provides=("emulsion")
conflicts=("emulsion")
source=("$url/releases/download/v$pkgver/Emulsion-Linux.deb-v$pkgver.deb")
sha256sums=('fe75327dbb504f9f68f71966fa4e19adc819c31d65d2148ad6107a0a5f1ddb03')

package() {
  tar -C "$pkgdir" -xf data.tar.gz
  mv "$pkgdir/usr/lib" "$pkgdir/usr/share/licenses"
}
