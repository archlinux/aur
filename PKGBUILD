# Maintainer: Enmanuel Moreira <enmanuelmoreira@gmail.com>

pkgname=colima
pkgver=0.3.4
pkgrel=3
pkgdesc="Container runtimes on macOS (and Linux) with minimal setup."
arch=('x86_64')
url="https://github.com/abiosoft/colima"
license=('MIT')
source=("https://github.com/abiosoft/${pkgname}/releases/download/v${pkgver}/${pkgname}-Linux-x86_64")
sha256sums=('9d8ed5a4cf2e0c30ea8f42f97696893802c88c81b2acffacad51841b48050155')

package() {
  cd "${srcdir}"
  install -Dm755 ${pkgname}-Linux-x86_64 ${pkgdir}/usr/bin/${pkgname}
}
