
# Maintainer: Pombes
pkgname=pombes-cleaner
pkgver=1.0.1
pkgrel=2
pkgdesc="A simple interactive Pacman cache cleaner for Arch Linux"
arch=('any')
url="https://aur.archlinux.org/packages/pombes-cleaner"
license=('MIT')
depends=('bash' 'pacman-contrib' 'sudo' 'coreutils')

source=('pombes-cleaner.sh' 'LICENSE')
sha256sums=('f3778c3887ff4b154b0813d9cc133ce83630a85eb2dcb250552af98668448995'
            'a37931cbf6c89f5e32b290f5e37ce816169a525ce0838a54d2bebd0b1282764e')

package() {
    install -Dm755 "$srcdir/pombes-cleaner.sh" \
        "$pkgdir/usr/bin/pombes-cleaner"

    install -Dm644 "$srcdir/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

