pkgname=paczf
pkgver=1.0.0
pkgrel=0
pkgdesc='A TUI frontend for pacman/paru using fzf'
arch=('any')
license=('MPL-2.0')
depends=('sh' 'fzf' 'paru' 'pacman' 'less')
source=(
    'https://codeberg.org/bankenstein/paczf/src/branch/master/pacget'
    'https://codeberg.org/bankenstein/paczf/src/branch/master/paclist'
    'https://codeberg.org/bankenstein/paczf/src/branch/master/pacrm'
    )
package() {
    install -Dm755 pacget ${pkgdir}/usr/bin/pacget
    install -Dm755 pacrm ${pkgdir}/usr/bin/pacrm
    install -Dm755 paclist ${pkgdir}/usr/bin/paclist
}
sha256sums=('7800314ce3fec14c150326929219e609ca4697c4468ad68f2d05babca84715c6'
            '29feb152bab23cbf1677d4adced5d1433fee0186c1dca93653b7a8faf91a7a30'
            '9d409b747a861cbf62589b318e298c3c320722ea5990dfba9beb18323f68c088')
