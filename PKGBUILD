# Maintainer: Lauri Gustafsson <lauri dot gustafsson at iki dot fi>
# Maintainer: Benjamin Brienen <benjamin dot brienen at outlook dot com>
pkgname=wgsl-analyzer-bin
_pkgver=2026-09-30
pkgver=${_pkgver//-}
pkgrel=1
pkgdesc='A language server for the WGSL shading language'
url='https://github.com/wgsl-analyzer/wgsl-analyzer'
source_x86_64=("wgsl-analyzer-${CARCH}-${pkgver}.gz::https://github.com/wgsl-analyzer/wgsl-analyzer/releases/download/${_pkgver}/wgsl-analyzer-${CARCH}-unknown-linux-gnu.gz")
source_aarch64=("wgsl-analyzer-${CARCH}-${pkgver}.gz::https://github.com/wgsl-analyzer/wgsl-analyzer/releases/download/${_pkgver}/wgsl-analyzer-${CARCH}-unknown-linux-gnu.gz")
arch=('x86_64' 'aarch64')
license=('MIT OR Apache-2.0')
depends=('glibc')
conflicts=('wgsl-analyzer')
provides=('wgsl-analyzer')
sha256sums_x86_64=('4635d9d804c9609dc7639632c14d9b6cf888b21f3c95d41c1dc55a33dc76f98e')
sha256sums_aarch64=('e5cb5b27f4b754a945e0b4c34a75f09690edda8fe99eeaa671550afeee671b07')
options=('!debug')

package() {
  install -Dm755 "${srcdir}/wgsl-analyzer-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/wgsl-analyzer"
}
