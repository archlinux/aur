pkgname=paczf-yay
pkgver=1.0.0
pkgrel=2
pkgdesc='A TUI frontend for pacman/yay using fzf'
arch=('any')
license=('MPL-2.0')
depends=('fzf' 'less' 'yay')
conflicts=('paczf')
source=('pacget' 'pacls' 'pacrm')
package() {
    install -Dm755 pacget ${pkgdir}/usr/bin/pacget
    install -Dm755 pacrm ${pkgdir}/usr/bin/pacrm
    install -Dm755 pacls ${pkgdir}/usr/bin/pacls
}
sha256sums=('17029390403836a51118d512abb5adb13971f66aef1453822169dfa40cd6d4af'
            'dfcfaa1fcc14d58d659bf2b685d023fde787c083b541cca04f5a3c5a8fdf78d9'
            'a93688c8953623e73a3ccf1aa0da6140ec227e8de69d4568a0848a923bfa5f00')
