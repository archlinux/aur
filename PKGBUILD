# Maintainer: Lauri Gustafsson <lauri at gustafla dot space>
pkgname=glsl_analyzer-bin
pkgver=1.5.1
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
sha256sums_x86_64=('bb96c807af53e5c8877148a54f9c2c2708db1867820cb82d6cb139491a85053a')
sha256sums_aarch64=('70b5104e0e8b6eed17fe485c403a7daef628eb85fe49351559cfca0570efd598')

package() {
  install -Dm755 "${srcdir}/bin/glsl_analyzer" "${pkgdir}/usr/bin/glsl_analyzer"
}
