pkgname="spinner-wheel"
pkgver="1.0.0"
pkgrel="1"
pkgdesc="A spinner wheel in your terminal."
arch=("x86_64")
url=""
depends=("grep" "awk" "sed")
optdepends=("nano")
license=("MIT")
source=("spinner-wheel.sh")
sha512sums=("SKIP")

package() {
  mkdir -p "${pkgdir}/usr/bin"
  mkdir "spinner_wheels"
  cp "${srcdir}/spinner-wheel.sh" "${pkgdir}/usr/bin/spinner-wheel"
  chmod +x "${pkgdir}/usr/bin/spinner-wheel"
}
