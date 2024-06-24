pkgname=paczf
pkgver=1.0.0
pkgrel=3
pkgdesc='A TUI frontend for pacman/paru using fzf'
arch=('any')
license=('MPL-2.0')
depends=('sh' 'fzf' 'paru' 'pacman' 'less')
source=(
    'https://codeberg.org/bankenstein/paczf/raw/branch/master/pacget'
    'https://codeberg.org/bankenstein/paczf/raw/branch/master/pacls'
    'https://codeberg.org/bankenstein/paczf/raw/branch/master/pacrm'
    )
package() {
    install -Dm755 pacget ${pkgdir}/usr/bin/pacget
    install -Dm755 pacrm ${pkgdir}/usr/bin/pacrm
    install -Dm755 pacls ${pkgdir}/usr/bin/pacls
}
sha256sums=(
    'SKIP'
    'SKIP'
    'SKIP'
    )
