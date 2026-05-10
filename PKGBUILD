# Maintainer: gabrielearchapt <castielloangela512@gmail.com>
pkgname=g-helper
pkgver=1.4
pkgrel=1
pkgdesc="Gabriele's Advanced AUR Bridge with Smart Search (v1.4)"
arch=('any')
url="https://tuo-utente.github.io"
license=('GPL3')
depends=('bash' 'git' 'pacman' 'binutils' 'gcc' 'make' 'curl' 'jq')
source=('g-helper')
sha256sums=('02367cd29766732b6ba0492588de34da8606391b8798f72ea028ca53c2b9a783')

package() {
  # Installiamo lo script con i permessi corretti
  install -Dm755 "${srcdir}/g-helper" "${pkgdir}/usr/bin/g-helper"
}
