# Maintainer: Kitsu mail@kitsu.me
pkgname=yofi-bin
pkgver=0.1.3
pkgrel=1
pkgdesc="Minimalistic menu for Wayland-based compositors"
arch=('x86_64')
url="https://github.com/l4l/yofi"
license=('MIT')
depends=('fontconfig' 'expat' 'graphite' 'pcre' 'wayland-protocols' 'libxkbcommon')
makedepends=('cargo' 'git')
provides=('yofi')
_binname="yofi-ubuntu-20.04"
source=("https://github.com/l4l/yofi/releases/download/${pkgver}/${_binname}")
sha256sums=('37aa3dd924008e7d6e86307a146c5a1c351267d485b8e744cb8698bfa92d4e2a')

package() {
  cd "$srcdir"
  install -Dm755 "${_binname}" "$pkgdir/usr/bin/yofi"
}

