# Maintainer: Kitsu mail@kitsu.me
pkgname=yofi-bin
pkgver=test3
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
sha256sums=('252c4edde13e0960123cf82da8edac56c1fdcad057cea84ba279029b4e26cc34')

package() {
  cd "$srcdir"
  install -Dm755 "${_binname}" "$pkgdir/usr/bin/yofi"
}

