# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=overskride
pkgname=$_pkgname-bin
pkgver=0.4.5
pkgrel=1
pkgdesc='A simple yet powerful bluetooth client (binary release)'
url="https://github.com/kaii-lb/overskride"
arch=('x86_64')
license=('GPL3')
depends=('bluez' 'libadwaita')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname$pkgver.zip::https://github.com/kaii-lb/overskride/releases/download/v$pkgver/$_pkgname.zip")
sha256sums=('046b8ebb193172add67eb5bdb47e33e12d9d913818342cd51a77740902848ffc')

package() {
  mv $_pkgname/* "$pkgdir"
}
