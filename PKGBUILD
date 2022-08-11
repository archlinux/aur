pkgname="runman"
pkgver="1.0.1"
pkgrel="1"
pkgdesc="A simple C++ code quick compile and run tool."
arch=("x86_64")
license=("custom")
source=("Run")
depends=('gcc')
sha512sums=("SKIP")
package() {
  mkdir -p "${pkgdir}/usr/bin"
  cp "${srcdir}/Run" "${pkgdir}/usr/bin/Run"
  chmod +x "${pkgdir}/usr/bin/Run"
}
