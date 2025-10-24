# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=overskride
pkgname=$_pkgname-bin
pkgver=0.6.2
pkgrel=1
pkgdesc="A simple yet powerful bluetooth client (binary release)"
url="https://github.com/kaii-lb/overskride"
license=('GPL-3.0-or-later')
arch=('x86_64')
depends=('bluez' 'libadwaita' 'libpulse')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname-$pkgver.zip::$url/releases/download/v$pkgver/$_pkgname.zip")
sha256sums=('7dc231b41578e0d4808880a80f4a93489c2693b4693fb47245d1c7409043bb81')

package() {
  mv package/* "$pkgdir"
}
