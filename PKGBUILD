# Maintainer: Lauri Gustafsson <lauri dot gustafsson at iki dot fi>
# Maintainer: Benjamin Brienen <benjamin dot brienen at outlook dot com>
pkgname=wgsl-analyzer-bin
_pkgver=2025-03-30
pkgver=${_pkgver//-}
pkgrel=2
pkgdesc='A language server for the WGSL shading language'
url='https://github.com/wgsl-analyzer/wgsl-analyzer'
source=("wgsl-analyzer-${pkgver}.gz::https://github.com/wgsl-analyzer/wgsl-analyzer/releases/download/${_pkgver}/wgsl-analyzer-${CARCH}-unknown-linux-gnu.gz")
arch=('x86_64')
license=('MIT OR Apache-2.0')
depends=('glibc')
conflicts=('wgsl-analyzer')
provides=('wgsl-analyzer')
sha256sums=('825de3c091c5631a23b0d80033a39af603a5983af2775915604570f67be8328f')
options=('!debug')

package() {
  install -Dm755 "${srcdir}/wgsl-analyzer-${pkgver}" "${pkgdir}/usr/bin/wgsl-analyzer"
}
