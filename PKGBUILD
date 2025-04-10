# Maintainer: Lauri Gustafsson <lauri at gustafla dot space>
pkgname=glsl_analyzer-bin
pkgver=1.6.0
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
sha256sums_x86_64=('df15afd4af548a1211ab103d3eee6a715b73521911b8af718102304daab67d5e')
sha256sums_aarch64=('c888a627adc57823be5391f5cdf78073a93143a6841dcc656fa0da929b9a8df6')

package() {
  install -Dm755 "${srcdir}/bin/glsl_analyzer" "${pkgdir}/usr/bin/glsl_analyzer"
}
