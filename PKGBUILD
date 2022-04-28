# $Id$
# Contributor: Enmanuel Moreira <enmanuelmoreira@gmail.com>

_name=colima
pkgname=colima
pkgver=0.3.4
pkgrel=1
pkgdesc="Container runtimes on macOS (and Linux) with minimal setup."
arch=('x86_64')
url="https://github.com/abiosoft/colima"
license=('MIT')
source=("https://github.com/abiosoft/${_name}/releases/download/v${pkgver}/${_name}-Linux-x86_64")
sha256sums=('9d8ed5a4cf2e0c30ea8f42f97696893802c88c81b2acffacad51841b48050155')

package() {
  cd "${srcdir}"
  install -Dm755 ${_name}-Linux-x86_64 ${pkgdir}/usr/bin/${_name}
}
