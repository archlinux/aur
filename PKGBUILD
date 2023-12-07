# Maintainer: Lauri Gustafsson <lauri at gustafla dot space>
pkgname=glsl_analyzer-bin
pkgver=1.4.4
pkgrel=2
pkgdesc='A language server for the GLSL shading language'
url='https://github.com/nolanderc/glsl_analyzer'
source_x86_64=("glsl_analyzer-${pkgver}-x86_64.zip::https://github.com/nolanderc/glsl_analyzer/releases/download/v$pkgver/x86_64-linux-musl.zip")
source_aarch64=("glsl_analyzer-${pkgver}-aarch64.zip::https://github.com/nolanderc/glsl_analyzer/releases/download/v$pkgver/aarch64-linux-musl.zip")
arch=('x86_64' 'aarch64')
license=('GPL3')
depends=()
conflicts=('glsl_analyzer')
provides=('glsl_analyzer')
sha256sums_x86_64=('fa56ac907be7a4edc8ccf43554fd26d5f6bcff976bd3fb5ab54ae1e366945060')
sha256sums_aarch64=('030e4fad49a4d04bfad1442a59719b583cd4dce9fac53c034e4f6619e9f11b02')

package() {
  install -Dm755 "${srcdir}/bin/glsl_analyzer" "${pkgdir}/usr/bin/glsl_analyzer"
}
