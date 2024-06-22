pkgname=paczf
pkgver=1.0.0
pkgrel=1
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
sha256sums=('ba0c99f5d9b2b46914cf96db094e6d6aac3b6b4cef5de499fa8896220ef3646f'
            '16cd68f4d8b839b11501034a52dbb987598eee23f541e437acef54243e78a8f5'
            'b7a9072a76508c8d1be0cb9e6793548b0fae320382d7797f6869942a5983feac')
