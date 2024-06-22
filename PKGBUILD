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
sha256sums=('ac78da5772bda56251894fcfc3a43ef279702372e2e01877c793f8a983c0fe71'
            'fdedcdf3e0bd01187e67b8e98096e51201a0d928a6ed34be2bfbbf538ea0e3d5'
            'ba0bc52c365aaf73a18e6681407cd435b39907e25fa7e8536be64da9b723bf51')
