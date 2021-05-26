# Maintainer: Markus Pesch <markus.pesch@cryptic.systems>

pkgname=flucky
pkgver=0.3.2
pkgrel=2
pkgdesc='A lightweight golang program to read values from different sensors'
arch=('x86_64' 'armv7h')
url=https://git.cryptic.systems/flucky/flucky
license=('Apache 2.0')
makedepends=('git' 'go' 'make')
source=("https://git.cryptic.systems/flucky/flucky/archive/v${pkgver}.tar.gz")
sha512sums=('1e53256f0b45c0e887b224ca697b3c1fadfb4135399595cbfee758f8f6c2357471da287a816d7fd0924adb96bc43676adf3149b0dd6bfa3f1c6c6947fcc6c760')

package() {
  make --directory ${srcdir}/${pkgname} DESTDIR=${pkgdir} PREFIX=/usr VERSION=${pkgver} install
}
