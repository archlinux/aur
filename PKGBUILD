# Maintainer: Lauri Gustafsson <lauri at gustafla dot space>
pkgname=wgsl-analyzer-bin
pkgver=0.6.3
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
sha256sums=('8741fcf146f9c0f89813a13408d91a9ac3925120ffbdadf6cc254e2302c0a5e9')

package() {
  install -Dm755 "${srcdir}/wgsl_analyzer-${pkgver}" "${pkgdir}/usr/bin/wgsl_analyzer"
}
