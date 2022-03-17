# Maintainer: Toni Tauro <eye@eyenx.ch>
# Co-Maintainer: Lukas Grossar <lukas.grossar@gmail.com>

pkgname=ctlptl-bin
pkgver=0.7.6
pkgrel=1
pkgdesc="Making local Kubernetes clusters fun and easy to set up"
arch=('x86_64')
url="https://github.com/tilt-dev/ctlptl"
license=('Apache')
source=("https://github.com/tilt-dev/ctlptl/releases/download/v${pkgver}/ctlptl.${pkgver}.linux.x86_64.tar.gz")
sha256sums=('48f967b56cd552717ca13ad0a3900c23ae18adcef4cf664e2fdaac0226092b43')

package() {
  install -Dm 755 "$srcdir/ctlptl" "$pkgdir/usr/bin/ctlptl"
}
