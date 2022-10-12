# Maintainer: Kitsu mail@kitsu.me
pkgname=yofi-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="Minimalistic menu for Wayland-based compositors"
arch=('x86_64')
url="https://github.com/l4l/yofi"
license=('MIT')
depends=('fontconfig' 'expat' 'graphite' 'pcre' 'wayland-protocols' 'libxkbcommon')
provides=('yofi')
_binname="yofi-ubuntu-20.04"
source=("https://github.com/l4l/yofi/releases/download/${pkgver}/${_binname}")
sha256sums=('a8b033009c868f442c6bbd982523fb7c8f2fc9676db06edc1d595b962a489e09')

package() {
  cd "$srcdir"
  install -Dm755 "${_binname}" "$pkgdir/usr/bin/yofi"
}

