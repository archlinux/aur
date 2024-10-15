# Maintainer: Dakkshesh <dakkshesh5@gmail.com>
pkgname=antman
pkgver=3.0
pkgrel=1
pkgdesc="A Nonsensical Toolchain Manager used to download/sync, upgrade and manage neutron toolchain builds."
arch=('x86_64')
url="https://github.com/Neutron-Toolchains/antman"
license=('GPL3')
depends=('bash' 'zstd' 'wget')
optdepends=('axel: speed up toolchain download using multiple connections')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Neutron-Toolchains/antman/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('4b169a946bda3dff9e1ef816f6d1df3271e8f2de451af3e61c219f605003680f')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 "antman" "${pkgdir}/usr/bin/antman"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
