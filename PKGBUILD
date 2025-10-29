# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=overskride
pkgname=$_pkgname-bin
pkgver=0.6.3
pkgrel=1
pkgdesc="A simple yet powerful bluetooth client (binary release)"
url="https://github.com/kaii-lb/overskride"
license=('GPL-3.0-or-later')
arch=('x86_64')
depends=('bluez' 'libadwaita' 'libpulse')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname-$pkgver.tar.xz::$url/releases/download/v$pkgver/$_pkgname.tar.xz")
sha256sums=('1e47b753996cb02aac570b2c942c186f339c1a891b7c694664f422997bc1f19b')

package() {
  cd package/usr
  install -Dm755 bin/$_pkgname -t "$pkgdir/usr/bin"
  mv share "$pkgdir/usr"
}
