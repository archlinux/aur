# Maintainer: Toni Tauro <eye@eyenx.ch>
# Co-Maintainer: Lukas Grossar <lukas.grossar@gmail.com>

pkgname=ctlptl-bin
pkgver=0.7.8
pkgrel=1
pkgdesc="Making local Kubernetes clusters fun and easy to set up"
arch=('x86_64')
url="https://github.com/tilt-dev/ctlptl"
license=('Apache')
source=("https://github.com/tilt-dev/ctlptl/releases/download/v${pkgver}/ctlptl.${pkgver}.linux.x86_64.tar.gz")
sha256sums=('5d0f0b9446854f2616d475b62d2d134d0db42e760e7f4afa3bac3666070ddac5')

package() {
  install -Dm 755 "$srcdir/ctlptl" "$pkgdir/usr/bin/ctlptl"
}
