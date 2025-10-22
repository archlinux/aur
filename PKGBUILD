# Maintainer: Your Name <your@email.com>
pkgname=cache-cleaner
pkgver=1.1.1
pkgrel=1
pkgdesc="Simple cache and temp cleaner for Arch Linux and AUR helpers"
arch=('any')
url="https://github.com/cristofer528yt/cache-cleaner"
license=('MIT')
depends=('pacman' 'bash')
optdepends=('yay: AUR helper support'
            'paru: AUR helper support'
            'trizen: AUR helper support')
source=("cache-cleaner")
sha256sums=('SKIP')

package() {
    install -Dm755 "$srcdir/cache-cleaner" "$pkgdir/usr/bin/cache-cleaner"
}
