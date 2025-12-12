pkgname=paczf
pkgver=1.0.0
pkgrel=7
pkgdesc='A TUI frontend for pacman/paru using fzf'
arch=('any')
license=('MPL-2.0')
depends=('sh' 'fzf' 'paru' 'pacman' 'less' 'yay')
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
sha256sums=('59f6ac778247b425f6f85ef21e872021b9918dcb8e3ba8b4a2f8d4e373dd7fd0'
            'dfcfaa1fcc14d58d659bf2b685d023fde787c083b541cca04f5a3c5a8fdf78d9'
            'e7bfd84b723660898dcf0f579b2f2ea0398d5ff9192c11dca05ae434675d39b5')
