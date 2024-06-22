pkgname=paczf
pkgver=1.0.0
pkgrel=2
pkgdesc='A TUI frontend for pacman/paru using fzf'
arch=('any')
license=('MPL-2.0')
depends=('sh' 'fzf' 'paru' 'pacman' 'less')
source=(
    'https://codeberg.org/bankenstein/paczf/src/branch/master/pacget'
    'https://codeberg.org/bankenstein/paczf/src/branch/master/pacls'
    'https://codeberg.org/bankenstein/paczf/src/branch/master/pacrm'
    )
package() {
    install -Dm755 pacget ${pkgdir}/usr/bin/pacget
    install -Dm755 pacrm ${pkgdir}/usr/bin/pacrm
    install -Dm755 pacls ${pkgdir}/usr/bin/pacls
}
sha256sums=('42636f882b1fb5d2820ac71eaf6848782bc7d554bc66c72921898eff23157849'
            'ba0fe09be4ed196963f62389735fa9c79ffebec42185e605f66a33bbf20e45cc'
            '969cb57a1706f114dc9f3cfb0d06cfdd61ad5aa87692eca88aae0b3537e6e636')
