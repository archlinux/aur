# Maintainer: Dakkshesh <dakkshesh5@gmail.com>
pkgname=antman
pkgver=2.4
pkgrel=1
pkgdesc="A Nonsensical Toolchain Manager used to download/sync, upgrade and manage neutron toolchain builds."
arch=('x86_64')
url="https://github.com/Neutron-Toolchains/antman"
license=('GPL3')
depends=('bash' 'zstd' 'wget')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Neutron-Toolchains/antman/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('cb3455d5318ffad8c50fe17ea65282287d3fc203b44be26950d636fd2dcdf556')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 "antman" "${pkgdir}/usr/bin/antman"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
