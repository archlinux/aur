# Maintainer: Lauri Gustafsson <lauri at gustafla dot space>
pkgname=wgsl-analyzer-bin
pkgver=0.9.11
pkgrel=1
pkgdesc='A language server for the WGSL shading language'
url='https://github.com/wgsl-analyzer/wgsl-analyzer'
source=("wgsl-analyzer-${pkgver}::https://github.com/wgsl-analyzer/wgsl-analyzer/releases/download/v$pkgver/wgsl-analyzer-linux-x64")
noextract=("${source[@]%%::*}")
arch=('x86_64')
license=('MIT' 'APACHE')
depends=('gcc-libs')
conflicts=('wgsl-analyzer')
provides=('wgsl-analyzer')
sha256sums=('4620043a96f95442414f12814ead2696a7ad1b503e980c9b6a7eb514242180c1')
options=('!debug')

package() {
  install -Dm755 "${srcdir}/wgsl-analyzer-${pkgver}" "${pkgdir}/usr/bin/wgsl-analyzer"
}
