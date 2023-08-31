# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=lazap
pkgname=$_pkgname-bin
pkgver=0.7.0
pkgrel=1
pkgdesc="Lightweight cross-platform client, unifying games into a single, modern library 🎮 (binary release)"
arch=('x86_64')
url="https://github.com/Lazap-Development/Lazap"
license=('CCPL:by-nc-sa4')
depends=('webkit2gtk')
conflicts=($_pkgname)
provides=($_pkgname)
source=("$url/releases/download/v$pkgver/lazap_${pkgver}_amd64.deb")
sha256sums=('9edaa3edfc409f0ad9b735d7eafc8c104297ccaa6528383eb9fc2456e287844b')

prepare() {
  tar -xf data.tar.gz
}

package() {
  mv $srcdir/usr "$pkgdir"
}
