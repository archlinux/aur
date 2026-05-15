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
  cp "${srcdir}/spinner-wheel.sh" "${pkgdir}/usr/bin/spin"
  chmod +x "${pkgdir}/usr/bin/spin"
}
