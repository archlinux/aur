# Maintainer: toxdes <hi@toxdes.com>
pkgname=quectop-hub-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Dashboard and data collector for quectop probes"
arch=('x86_64' 'aarch64')
url="https://github.com/toxdes/quectop"
license=('MIT')
depends=('quectop')
provides=("quectop-hub=${pkgver}")
conflicts=(quectop-hub)

source_x86_64=("quectop-hub-${pkgver}-x86_64.tar.gz::https://packages.toxdes.com/releases/quectop-hub_${pkgver}_amd64.tar.gz")
sha256sums_x86_64=('0de271a1c66dd485ce8d9099cc2178ac6dfc5a4258afedca2e5e9c35f4b7c498')

source_aarch64=("quectop-hub-${pkgver}-aarch64.tar.gz::https://packages.toxdes.com/releases/quectop-hub_${pkgver}_arm64.tar.gz")
sha256sums_aarch64=('cf9582514b9d85fb770410ce24a1b619395a1365e31a5b1cf7178b3f956d72cb')

package() {
  bsdtar -xf "${srcdir}/quectop-hub-${pkgver}-${CARCH}.tar.gz" -C "${pkgdir}"
}
