# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=overskride
pkgname=$_pkgname-bin
pkgver=0.6.6
pkgrel=1
pkgdesc="A simple yet powerful bluetooth client (binary release)"
url="https://github.com/kaii-lb/overskride"
license=('GPL-3.0-or-later')
arch=('x86_64')
depends=('bluez' 'libadwaita' 'libpulse')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname-$pkgver.tar.xz::$url/releases/download/v$pkgver/$_pkgname.tar.xz")
sha256sums=('2e86b8136f578edc52a547a3367da77fb29f803b9c954d59d30aa237000e492d')

package() {
  cd package/usr
  install -Dm755 bin/$_pkgname -t "$pkgdir/usr/bin"
  mv share "$pkgdir/usr"
}
