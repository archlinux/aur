# Maintainer: Kitsu mail@kitsu.me
pkgname=yofi-bin
pkgver=0.1.5
pkgrel=1
pkgdesc="Minimalistic menu for Wayland-based compositors"
arch=('x86_64')
url="https://github.com/l4l/yofi"
license=('MIT')
depends=('fontconfig' 'expat' 'graphite' 'pcre' 'wayland-protocols' 'libxkbcommon')
provides=('yofi')
_binname="yofi-ubuntu-20.04"
source=("https://github.com/l4l/yofi/releases/download/${pkgver}/${_binname}")
sha256sums=('6abac7e27b0261a8f2e3f8d4c57492e8e4d7914133a9c2dc3a1be1ddf9085d0b')

package() {
  cd "$srcdir"
  install -Dm755 "${_binname}" "$pkgdir/usr/bin/yofi"
}

