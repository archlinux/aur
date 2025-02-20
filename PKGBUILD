# Maintainer: Lauri Gustafsson <lauri at gustafla dot space>
pkgname=wgsl-analyzer-bin
pkgver=0.9.5
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
sha256sums=('bf9e6ed02bfd570438cb2ad06601ffc114b0b85a82f5e4a50d0ead9daf5ef95f')

package() {
  install -Dm755 "${srcdir}/wgsl_analyzer-${pkgver}" "${pkgdir}/usr/bin/wgsl_analyzer"
}
