# Maintainer: Lauri Gustafsson <lauri at gustafla dot space>
pkgname=wgsl-analyzer-bin
pkgver=0.6.2
pkgrel=1
pkgdesc='A language server for the WGSL shading language'
url='https://github.com/wgsl-analyzer/wgsl-analyzer'
source=("wgsl_analyzer-${pkgver}::https://github.com/wgsl-analyzer/wgsl-analyzer/releases/download/v$pkgver/wgsl_analyzer-linux-x64")
noextract=("${source[@]%%::*}")
arch=('x86_64')
license=('MIT' 'APACHE')
depends=('gcc-libs')
conflicts=('wgsl-analyzer')
provides=('wgsl-analyzer')
sha256sums=('63e7ceb3622782fff8484ebb38a286c6b6751eed3f13dd4339ba95fb1b84c1a1')

package() {
  install -Dm755 "${srcdir}/wgsl_analyzer-${pkgver}" "${pkgdir}/usr/bin/wgsl_analyzer"
}
