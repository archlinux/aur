# Maintainer: Lauri Gustafsson <lauri at gustafla dot space>
pkgname=glsl_analyzer-bin
pkgver=1.7.1
pkgrel=1
pkgdesc='A language server for the GLSL shading language'
url='https://github.com/nolanderc/glsl_analyzer'
source_x86_64=("glsl_analyzer-${pkgver}-${CARCH}.zip::https://github.com/nolanderc/glsl_analyzer/releases/download/v$pkgver/${CARCH}-linux-musl.zip")
source_aarch64=("glsl_analyzer-${pkgver}-${CARCH}.zip::https://github.com/nolanderc/glsl_analyzer/releases/download/v$pkgver/${CARCH}-linux-musl.zip")
arch=('x86_64' 'aarch64')
license=('GPL3')
depends=()
conflicts=('glsl_analyzer')
provides=('glsl_analyzer')
sha256sums_x86_64=('7c929b304e0d34abf4305d07895c409861f054613c3ae4070baa7ca15c916e7a')
sha256sums_aarch64=('dda05d727979c34333b86562bb706122ab95d17cd7298665e8afbaba79f76ea6')

package() {
  install -Dm755 "${srcdir}/bin/glsl_analyzer" "${pkgdir}/usr/bin/glsl_analyzer"
}
