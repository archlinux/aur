# Maintainer: toxdes <hi@toxdes.com>
pkgname=glesha-bin
pkgver=0.5.1
pkgrel=1
pkgdesc="Encrypted archives and indexed cloud backups"
arch=('x86_64' 'aarch64')
url="https://github.com/toxdes/glesha"
license=('MIT')
depends=()

source_x86_64=("glesha-${pkgver}-x86_64.tar.gz::https://packages.toxdes.com/glesha/releases/glesha_${pkgver}_amd64.tar.gz")
sha256sums_x86_64=('df7f5da4a9caa5fd7a6f89e621e90fb2303bd86927f23a30206f942378621d63')

source_aarch64=("glesha-${pkgver}-aarch64.tar.gz::https://packages.toxdes.com/glesha/releases/glesha_${pkgver}_arm64.tar.gz")
sha256sums_aarch64=('2694de73e6f04b6220d58b851829e30d81c419b06ccd9cd1feb5638843b753ca')

package() {
  bsdtar -xf "${srcdir}/glesha-${pkgver}-${CARCH}.tar.gz" -C "${pkgdir}"
}
