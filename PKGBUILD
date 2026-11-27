# Maintainer: toxdes <hi@toxdes.com>
pkgname=glesha-bin
pkgver=0.5.3
pkgrel=1
pkgdesc="Encrypted archives and indexed cloud backups"
arch=('x86_64' 'aarch64')
url="https://github.com/toxdes/glesha"
license=('MIT')
depends=()
provides=("glesha=${pkgver}")
conflicts=(glesha)

source_x86_64=("glesha-${pkgver}-x86_64.tar.gz::https://packages.toxdes.com/releases/glesha_${pkgver}_amd64.tar.gz")
sha256sums_x86_64=('510b8ad850a1d10600eb5004c3143cabd12e0faeeff8819ed34784f7d46ff9b4')

source_aarch64=("glesha-${pkgver}-aarch64.tar.gz::https://packages.toxdes.com/releases/glesha_${pkgver}_arm64.tar.gz")
sha256sums_aarch64=('d9a9480489e2d19d8f02c055c750143cd67f54a29bd688676aab4a5d0d281f37')

package() {
  bsdtar -xf "${srcdir}/glesha-${pkgver}-${CARCH}.tar.gz" -C "${pkgdir}"
}
