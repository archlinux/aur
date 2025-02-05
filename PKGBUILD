# Maintainer: Lauri Gustafsson <lauri at gustafla dot space>
pkgname=wgsl-analyzer-bin
pkgver=0.9.4
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
sha256sums=('43661937303bede260c08daf122cd92c6e083e86778e7793ff78655189c9793f')

package() {
  install -Dm755 "${srcdir}/wgsl_analyzer-${pkgver}" "${pkgdir}/usr/bin/wgsl_analyzer"
}
