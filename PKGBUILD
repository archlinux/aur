pkgname=pkg-install
pkgver=1.0.0
pkgrel=2
pkgdesc="Terminal package manager inspired by Omarchys very simple package manager."
arch=('x86_64')
url="https://aur.archlinux.org/packages/pkg-install"
license=('MIT')
depends=('bash' 'dialog' 'sudo')
optdepends=('yay: Required for AUR package installation')
source=(
    'pkg-install'
    'ionarch-pkg-install'
    'ionarch-pkg-aur-install'
    'ionarch-pkg-remove'
)
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

package() {
    install -Dm755 pkg-install "$pkgdir/usr/bin/pkg-install"
    install -Dm755 ionarch-pkg-install "$pkgdir/usr/lib/pkg-install/ionarch-pkg-install"
    install -Dm755 ionarch-pkg-aur-install "$pkgdir/usr/lib/pkg-install/ionarch-pkg-aur-install"
    install -Dm755 ionarch-pkg-remove "$pkgdir/usr/lib/pkg-install/ionarch-pkg-remove"
}
