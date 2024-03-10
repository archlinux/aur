# Maintainer: Kitsu mail@kitsu.me
pkgname=yofi-bin
pkgver=0.2.1
pkgrel=1
pkgdesc="Minimalistic menu for Wayland-based compositors"
arch=('x86_64')
url="https://github.com/l4l/yofi"
license=('MIT')
depends=('fontconfig' 'wayland-protocols' 'libxkbcommon')
provides=('yofi')
_binname="yofi-ubuntu-22.04"
source=("https://github.com/l4l/yofi/releases/download/${pkgver}/${_binname}")
sha256sums=('fe8af047001b6c47d63d66755a13a337aefb1f3c5ecc472049e20fda3918b08a')

package() {
  cd "$srcdir"
  install -Dm755 "${_binname}" "$pkgdir/usr/bin/yofi"
}

