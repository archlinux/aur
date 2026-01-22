# Maintainer: Your Name <youremail@domain.com>
pkgname=arch-cleaner
pkgver=1.0.0
pkgrel=1
pkgdesc="A utility to clean Arch Linux system (orphans, cache, partial downloads)"
arch=('any')
url="https://github.com/ranjanssgj/arch-cleaner"
license=('GPL3')
depends=('python' 'pacman')
optdepends=('pacman-contrib: for paccache support')
source=("arch_cleaner.py")
sha256sums=('SKIP')

package() {
    install -Dm755 "$srcdir/arch_cleaner.py" "$pkgdir/usr/bin/arch-cleaner"
}
