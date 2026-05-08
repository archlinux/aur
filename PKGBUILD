# Maintainer: gabrielearchapt <castielloangela512@gmail.com>
pkgname=g-helper
pkgver=1.3
pkgrel=1
pkgdesc="Gabriele's optimized AUR bridge helper with auto-cleanup (v1.3)"
arch=('any')
url="https://tuo-sito.github.io"
license=('GPL3')
depends=('bash' 'git' 'pacman' 'binutils' 'gcc' 'make')
source=('g-helper')
sha256sums=('cc5a3ca7300e7569862a30ddc931064c3f87eb220d9087b486da80eb104b00e7')

package() {
  install -Dm755 "${srcdir}/g-helper" "${pkgdir}/usr/bin/g-helper"
}
