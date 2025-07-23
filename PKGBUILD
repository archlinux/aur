# Maintainer: Tuure Piitulainen <tuure.piitulainen@gmail.com>

pkgname="windowlist"
pkgver="0.1.0"
pkgrel=2
pkgdesc="Polybar custom module - List all open windows, click to switch focus or minimize"
arch=("x86_64")
url="https://github.com/tuurep/windowlist"
license=("MIT")
depends=("libx11" "glibc")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("de3ad6673d6e36840cac147a4fda276dc92cad1501533a3db4334eb0f99b964f")

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  BINDIR="${pkgdir}/usr/bin" make install
  install -Dm644 ./LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
