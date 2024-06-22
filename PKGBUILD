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
sha256sums=('3a97fae6b466d8abb5be4fc7fcfc955dd049b31fa7ee74a1ba9316a56306fe7a'
            '18d5358434a641338cd65c59ed57e1105c86172bcbd4abd98f1827399d26c6fb'
            'dce18e52948722a00555da5b3fb872d6f4de9d179322ddf7fc90b4fa13e682e1')
