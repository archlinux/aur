# Maintainer: Jonathan Capps (cappsy@gmail.com)
pkgname="tzyfetch"
pkgver="1.0.0"
pkgrel=5
pkgdesc="An extremely simple fetch utility, built for a single line output with a three character distro logo."
arch=("any")
license=("MIT")
makedepends=("git")
source=("tzyfetch::git+https://github.com/cappsyco/tzyfetch.git")
noextract=()
sha256sums=("SKIP")
sha512sums=("SKIP")

package() {
  mkdir -p "${pkgdir}/usr/bin"
  cp -r "${srcdir}/tzyfetch/tzyfetch.sh" "${pkgdir}/usr/bin/tzyfetch"
  chmod +x "${pkgdir}/usr/bin/tzyfetch"
}
