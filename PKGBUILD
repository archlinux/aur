# Maintainer: toxdes <hi@toxdes.com>
pkgname=glesha-bin
pkgver=0.5.2
pkgrel=1
pkgdesc="Encrypted archives and indexed cloud backups"
arch=('x86_64' 'aarch64')
url="https://github.com/toxdes/glesha"
license=('MIT')
depends=()
provides=("glesha=${pkgver}")
conflicts=(glesha)

source_x86_64=("glesha-${pkgver}-x86_64.tar.gz::https://packages.toxdes.com/glesha/releases/glesha_${pkgver}_amd64.tar.gz")
sha256sums_x86_64=('18f47cd32e2affd41421e4ea91ef0b4ac6bc4c9dbae0532ac756f865268f3a76')

source_aarch64=("glesha-${pkgver}-aarch64.tar.gz::https://packages.toxdes.com/glesha/releases/glesha_${pkgver}_arm64.tar.gz")
sha256sums_aarch64=('3f5d85ab4e8b8f95b78393b6e88858c8584f81af9f1c6d5d3eeea40bf3d7e922')

package() {
  bsdtar -xf "${srcdir}/glesha-${pkgver}-${CARCH}.tar.gz" -C "${pkgdir}"
}
