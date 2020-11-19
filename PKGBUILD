# Maintainer: Toni Tauro <eye@eyenx.ch>
# Co-Maintainer: Lukas Grossar <lukasgrossar@gmail.com>

pkgname=ctlptl-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="Making local Kubernetes clusters fun and easy to set up"
arch=('x86_64')
url="https://github.com/tilt-dev/ctlptl"
license=('Apache')
source=("https://github.com/tilt-dev/ctlptl/releases/download/v${pkgver}/ctlptl.${pkgver}.linux.x86_64.tar.gz")
sha256sums=('ee45742a239b470865f928a0b4f9ddc5aee7f7c4ab44673283fcaef015ee6bae')

package() {
  install -Dm 755 "$srcdir/ctlptl" "$pkgdir/usr/bin/ctlptl"
}
