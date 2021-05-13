# Maintainer: DisLogicator <supasecrethacker@gmail.com>
pkgname=bah
pkgver=0.0.1
pkgrel=1
pkgdesc="A CLI multi-featured AUR manager and pacman wrapper suited for debian apt users"
arch=('any')
url="https://github.com/DisLogicator/bah/"
license=('WTFPL')
depends=('pacman' 'make' 'nano')
source=(
    "https://raw.githubusercontent.com/DisLogicator/bah/main/LICENSE"
    "https://raw.githubusercontent.com/DisLogicator/bah/main/bah"
)
md5sums=('SKIP'
        'SKIP')

package() {
  install -Dm755 -t "${pkgdir}/usr/bin/" "${srcdir}/bah"
  install -Dm644 -t "${pkgdir}/usr/share/licenses/bah/LICENSE" "${srcdir}/LICENSE"
}
