# Maintainer: toxdes <hi@toxdes.com>
pkgname=quectop-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Lightweight Linux resource monitor"
arch=('x86_64' 'aarch64')
url="https://github.com/toxdes/quectop"
license=('MIT')
depends=()
provides=("quectop=${pkgver}")
conflicts=(quectop)

source_x86_64=("quectop-${pkgver}-x86_64.tar.gz::https://packages.toxdes.com/releases/quectop_${pkgver}_amd64.tar.gz")
sha256sums_x86_64=('2250575678a1567465b14fa857366b28342cce943771050184d8681bf414378e')

source_aarch64=("quectop-${pkgver}-aarch64.tar.gz::https://packages.toxdes.com/releases/quectop_${pkgver}_arm64.tar.gz")
sha256sums_aarch64=('93bd914846048d2b1c7123e4e1dceaf3fa185b2b4c6552255514d3cf329af9e3')

package() {
  bsdtar -xf "${srcdir}/quectop-${pkgver}-${CARCH}.tar.gz" -C "${pkgdir}"
}
