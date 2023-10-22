# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=overskride
pkgname=$_pkgname-bin
pkgver=0.4.4
pkgrel=1
pkgdesc='A simple yet powerful bluetooth client (binary release)'
url="https://github.com/kaii-lb/overskride"
arch=('x86_64')
license=('GPL3')
depends=('bluez' 'libadwaita')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname$pkgver.zip::https://github.com/kaii-lb/overskride/releases/download/v$pkgver/$_pkgname.zip")
sha256sums=('1313a8e57599737c28d9e8ddfa10b44049f22cdfe1cefd7ee36517c556310ba2')

package() {
  mv $_pkgname/* "$pkgdir"
}
