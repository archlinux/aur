# Maintainer: Lauri Gustafsson <lauri at gustafla dot space>
pkgname=glsl_analyzer-bin
pkgver=1.4.5
pkgrel=1
pkgdesc='A language server for the GLSL shading language'
url='https://github.com/nolanderc/glsl_analyzer'
source_x86_64=("glsl_analyzer-${pkgver}.zip::https://github.com/nolanderc/glsl_analyzer/releases/download/v$pkgver/x86_64-linux-musl.zip")
source_aarch64=("glsl_analyzer-${pkgver}.zip::https://github.com/nolanderc/glsl_analyzer/releases/download/v$pkgver/aarch64-linux-musl.zip")
arch=('x86_64' 'aarch64')
license=('GPL3')
depends=()
conflicts=('glsl_analyzer')
provides=('glsl_analyzer')
sha256sums_x86_64=('e0eade1a0b5ff87199bf859604b037cf2dd203c067bad907279f12d4248089c0')
sha256sums_aarch64=('33d7fbfafa4a1c6751aa6382b3f7dedd55a349b60d4ea2a1b08518b1edd57b51')

package() {
  install -Dm755 "${srcdir}/bin/glsl_analyzer" "${pkgdir}/usr/bin/glsl_analyzer"
}
