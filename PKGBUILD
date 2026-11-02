# Maintainer: Lauri Gustafsson <lauri dot gustafsson at iki dot fi>
# Maintainer: Benjamin Brienen <benjamin dot brienen at outlook dot com>
pkgname=wgsl-analyzer-bin
_pkgver=2026-11-02
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
sha256sums_x86_64=('08ef4b2c5342776fbfe2a4b10af4e4c25a9b99872b71dd4eac27aff3d54add70')
sha256sums_aarch64=('ed7b91a19970cd78852168587ccfea2b00ec228cbe22352e2e8daddddfed48f6')
options=('!debug')

package() {
  install -Dm755 "${srcdir}/wgsl-analyzer-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/wgsl-analyzer"
}
