# Maintainer: DisLogicator <supasecrethacker@gmail.com>

pkgname='rickrollrc'
pkgver=1.1
pkgrel=1
pkgdesc="Rick Astley invades your terminal. Type roll to instantly be never given up."
arch=('any')
url='https://www.github.com/keroserene/rickrollrc'
license=('WTFPL')
depends=('python')
source=(
    "https://raw.githubusercontent.com/DisLogicator/RickAstley/master/roll"
)
sha256sums=(
    'SKIP'
)

package() {
    mkdir ${pkgdir}/usr
    mkdir ${pkgdir}/usr/bin
    chmod +x roll
    install -Dm755 -t "${pkgdir}/usr/bin/" "${srcdir}/roll"
}
