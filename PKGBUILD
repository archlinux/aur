# Maintainer: Lauri Gustafsson <lauri at gustafla dot space>
pkgname=glsl_analyzer-bin
pkgver=1.7.0
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
sha256sums_x86_64=('51d61469104e03e8e0a18da4bd383c0f52fdfc6388c6675c2aaaee9e9adffa68')
sha256sums_aarch64=('41fcf2af9d89bd4ad632a8ebea2bb2568f40c7c93180915a76ba0052e02601aa')

package() {
  install -Dm755 "${srcdir}/bin/glsl_analyzer" "${pkgdir}/usr/bin/glsl_analyzer"
}
