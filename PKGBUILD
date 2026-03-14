# Maintainer: Lauri Gustafsson <lauri dot gustafsson at iki dot fi>
# Maintainer: Benjamin Brienen <benjamin dot brienen at outlook dot com>
pkgname=wgsl-analyzer-bin
_pkgver=2026-03-13
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
sha256sums_x86_64=('ef8937b3db3f5ca9edfc17e266148941f99394c166a193d20c5145efc5d20eb5')
sha256sums_aarch64=('b36e8030f16d72850cbb29839dab85a8ad65da2a5dc618235be173400d2b01fc')
options=('!debug')

package() {
  install -Dm755 "${srcdir}/wgsl-analyzer-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/wgsl-analyzer"
}
