# Maintainer: Toni Tauro <eye@eyenx.ch>
# Co-Maintainer: Lukas Grossar <lukas.grossar@gmail.com>

pkgname=ctlptl-bin
pkgver=0.6.1
pkgrel=1
pkgdesc="Making local Kubernetes clusters fun and easy to set up"
arch=('x86_64')
url="https://github.com/tilt-dev/ctlptl"
license=('Apache')
source=("https://github.com/tilt-dev/ctlptl/releases/download/v${pkgver}/ctlptl.${pkgver}.linux.x86_64.tar.gz")
sha256sums=('309641d068c521e9179cb6a7a8b401b9a278ad397cfb750bde42301b2a26ed14')

package() {
  install -Dm 755 "$srcdir/ctlptl" "$pkgdir/usr/bin/ctlptl"
}
