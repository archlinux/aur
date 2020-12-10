# Maintainer: Kitsu mail@kitsu.me
pkgname=yofi-bin
pkgver=0.1.1
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
sha256sums=('471c9707bf0d6df479411ad0f44689562049396d17be452f1fd7293e49f33f2e')

package() {
  cd "$srcdir"
  install -Dm755 "${_binname}" "$pkgdir/usr/bin/yofi"
}

