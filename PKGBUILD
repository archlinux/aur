# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>
# Contributor: Luis Martinez <luis dot martinez at tuta dot io>
# Contributor: Szymon Scholz <first name last name [at] gmail [dot] com>

pkgname=emulsion-bin
pkgver=11.0
pkgrel=1
pkgdesc="A fast and minimalistic image viewer (binary release)"
url="https://github.com/ArturKovacs/emulsion"
arch=('x86_64')
license=('MIT')
depends=('hicolor-icon-theme' 'libavif')
provides=("emulsion")
conflicts=("emulsion")
source=("$url/releases/download/v$pkgver/Emulsion-Linux.deb-v$pkgver.deb")
sha256sums=('e9564387333592cd6dbc16dbeeb9dc4243d00a15d67bc821afd3c6e57c12b568')

package() {
  tar -C "$pkgdir" -xf data.tar.gz
  mv "$pkgdir/usr/lib" "$pkgdir/usr/share/licenses"
}
