# Maintainer: Kitsu mail@kitsu.me
pkgname=yofi-bin
pkgver=0.2.2
pkgrel=1
pkgdesc="Minimalistic menu for Wayland-based compositors"
arch=('x86_64')
url="https://github.com/l4l/yofi"
license=('MIT')
depends=('fontconfig' 'wayland-protocols' 'libxkbcommon')
provides=('yofi')
_binname="yofi-ubuntu-22.04"
source=("https://github.com/l4l/yofi/releases/download/${pkgver}/${_binname}")
sha256sums=('d45adde7502bcd4e47b92c4366e1554e87b63cd3df15d2cbdd2d25e40d5bd389')

package() {
  cd "$srcdir"
  install -Dm755 "${_binname}" "$pkgdir/usr/bin/yofi"
}

