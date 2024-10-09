# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=overskride
pkgname=$_pkgname-bin
pkgver=0.6.1
pkgrel=1
pkgdesc="A simple yet powerful bluetooth client (binary release)"
url="https://github.com/kaii-lb/overskride"
license=('GPL-3.0-or-later')
arch=('x86_64')
depends=('bluez' 'libadwaita' 'libpulse')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname-$pkgver.tar.xz::$url/releases/download/v$pkgver/$_pkgname.tar.xz")
sha256sums=('99995a52e930977341899d472df789c82b6ed6005f9a9248aaa19c3b4c556205')

package() {
  mv $_pkgname/* "$pkgdir"
}
