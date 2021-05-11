# Maintainer: DisLogicator <supasecrethacker@gmail.com>

pkgname='rickrollrc'
pkgver=16.0.05
pkgrel=1
pkgdesc="Rick Astley invades your terminal. Type roll to instantly be never given up."
arch=('any')
url='https://www.github.com/keroserene/rickrollrc'
license=('WTFPL')
depends=('python')
source=(
    "https://raw.githubusercontent.com/keroserene/rickrollrc/master/roll.sh"
)
sha256sums=(
    'SKIP'
)

package() {
    msg2 "Are you ready to get the ultimate rickroll package?"
    install -Dm644 -t "${pkgdir}/usr/bin/" "${srcdir}/roll.sh"

}
