# Maintainer: Markus Pesch <markus.pesch@cryptic.systems>

pkgname=flucky
pkgver=0.3.2
pkgrel=1
pkgdesc='A lightweight golang program to read values from different sensors'
arch=('x86_64' 'armv7h')
url=https://git.cryptic.systems/volker.raschek/flucky
license=('Apache 2.0')
makedepends=('git' 'go' 'make')
source=("https://git.cryptic.systems/volker.raschek/flucky/archive/v${pkgver}.tar.gz")
sha512sums=('fb7688d20d8d5b6293f826b2c0aa2748cbab6ef1dffab9529cc3371fffc4b18dc1e7ae1799cab187cea5dd7d5b859cbd8d693fd7b83736e6ecb2d94d255a2a13')

package() {
  make --directory ${srcdir}/${pkgname} DESTDIR=${pkgdir} PREFIX=/usr VERSION=${pkgver} install
}
