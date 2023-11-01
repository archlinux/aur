# Maintainer: Lauri Gustafsson <lauri at gustafla dot space>
pkgname=glsl_analyzer-bin
pkgver=1.4.2
pkgrel=1
pkgdesc='A language server for the GLSL shading language'
url='https://github.com/nolanderc/glsl_analyzer'
source=("glsl_analyzer-${pkgver}.zip::https://github.com/nolanderc/glsl_analyzer/releases/download/v$pkgver/x86_64-linux-musl.zip")
arch=('x86_64')
license=('GPL3')
depends=()
conflicts=('glsl_analyzer')
provides=('glsl_analyzer')
sha256sums=('a00f63612dad711b4d75c0f210e9596fdc114a302909ffbade956c5a3d10674c')

package() {
  install -Dm755 "${srcdir}/bin/glsl_analyzer" "${pkgdir}/usr/bin/glsl_analyzer"
}
