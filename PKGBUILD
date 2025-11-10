# Maintainer: Lauri Gustafsson <lauri dot gustafsson at iki dot fi>
# Maintainer: Benjamin Brienen <benjamin dot brienen at outlook dot com>
pkgname=wgsl-analyzer-bin
_pkgver=2025-11-04
pkgver=${_pkgver//-}
pkgrel=1
pkgdesc='A language server for the WGSL shading language'
url='https://github.com/wgsl-analyzer/wgsl-analyzer'
source=("wgsl-analyzer-${pkgver}.gz::https://github.com/wgsl-analyzer/wgsl-analyzer/releases/download/${_pkgver}/wgsl-analyzer-${CARCH}-unknown-linux-gnu.gz")
arch=('x86_64')
license=('MIT OR Apache-2.0')
depends=('glibc')
conflicts=('wgsl-analyzer')
provides=('wgsl-analyzer')
sha256sums=('ea3524bf77127e80f84fccd57777751c3d0136e21a56503c69f7a32249bcf309')
options=('!debug')

package() {
  install -Dm755 "${srcdir}/wgsl-analyzer-${pkgver}" "${pkgdir}/usr/bin/wgsl-analyzer"
}
