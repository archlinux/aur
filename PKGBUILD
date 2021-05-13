# Maintainer: DisLogicator <supasecrethacker@gmail.com>
pkgname=bah
pkgver=0.0.2
pkgrel=1
pkgdesc="A CLI multi-featured AUR manager and pacman wrapper suited for debian apt users written in bash"
arch=('any')
url="https://github.com/DisLogicator/bah/"
license=('WTFPL')
depends=('pacman' 'make')
source=(
    "https://raw.githubusercontent.com/DisLogicator/bah/main/LICENSE"
    "https://raw.githubusercontent.com/DisLogicator/bah/main/bah"
    "https://raw.githubusercontent.com/DisLogicator/bah/main/bte"
)
md5sums=('SKIP'
        'SKIP'
        'SKIP')

package() {
  install -Dm755 -t "${pkgdir}/usr/bin/" "${srcdir}/bah"
  install -Dm755 -t "${pkgdir}/usr/bin/" "${srcdir}/bte"
  install -Dm644 -t "${pkgdir}/usr/share/licenses/bah/LICENSE" "${srcdir}/LICENSE"
}
