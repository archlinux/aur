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
sha256sums=('fc4a82e390bf48b0d340872de32021ea22907ba53ba7dc988ebdd31ac6b4eac1'
            '3c9c39497a0a137010583559a3d6cd62d035115f22040f35599b84616b1ba208'
            'a4350cc08ded162336399608a929adc28efea96b3e5ed70281b2d71b71f9b844')
