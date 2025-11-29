# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=overskride
pkgname=$_pkgname-bin
pkgver=0.6.5
pkgrel=1
pkgdesc="A simple yet powerful bluetooth client (binary release)"
url="https://github.com/kaii-lb/overskride"
license=('GPL-3.0-or-later')
arch=('x86_64')
depends=('bluez' 'libadwaita' 'libpulse')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname-$pkgver.tar.xz::$url/releases/download/v$pkgver/$_pkgname.tar.xz")
sha256sums=('da8954294a7c3a263e36a9b252959b3fd5f5aa6e6176bf0145f63deb53f931b5')

package() {
  cd package/usr
  install -Dm755 bin/$_pkgname -t "$pkgdir/usr/bin"
  mv share "$pkgdir/usr"
}
