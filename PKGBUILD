# Maintainer: Lauri Gustafsson <lauri at gustafla dot space>
pkgname=glsl_analyzer-bin
pkgver=1.4.2
pkgrel=1
pkgdesc='A language server for the GLSL shading language'
url='https://github.com/nolanderc/glsl_analyzer'
source_x86_64=("glsl_analyzer-${pkgver}-x86_64.zip::https://github.com/nolanderc/glsl_analyzer/releases/download/v$pkgver/x86_64-linux-musl.zip")
source_aarch64=("glsl_analyzer-${pkgver}-aarch64.zip::https://github.com/nolanderc/glsl_analyzer/releases/download/v$pkgver/aarch64-linux-musl.zip")
arch=('x86_64' 'aarch64')
license=('GPL3')
depends=()
conflicts=('glsl_analyzer')
provides=('glsl_analyzer')
sha256sums_x86_64=('a00f63612dad711b4d75c0f210e9596fdc114a302909ffbade956c5a3d10674c')
sha256sums_aarch64=('f4b4b43fbdd09175f617c0d8315cb1172d01670a5fced341cc82384bf7e4151c')

package() {
  install -Dm755 "${srcdir}/bin/glsl_analyzer" "${pkgdir}/usr/bin/glsl_analyzer"
}
