# Maintainer: Lauri Gustafsson <lauri dot gustafsson at iki dot fi>
# Maintainer: Benjamin Brienen <benjamin dot brienen at outlook dot com>
pkgname=wgsl-analyzer-bin
_pkgver=2026-04-26
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
sha256sums_x86_64=('ee3f780b0bdd0f2b0959e876d67fbfc5c887f09a2c822fe5f4e80292c9527ac6')
sha256sums_aarch64=('dfd641162c366be7cbbacdff532329c111f0844e01382b466a58ca250c285d58')
options=('!debug')

package() {
  install -Dm755 "${srcdir}/wgsl-analyzer-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/wgsl-analyzer"
}
