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
source=("https://raw.githubusercontent.com/ranjanssgj/arch-cleaner/main/arch_cleaner.py"
        "https://raw.githubusercontent.com/ranjanssgj/arch-cleaner/main/LICENSE")
sha256sums=('fc2b600746c2e1b5689d8a3afb1fccca15de1c7859053180b197bc9d42fd20e2'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')

package() {
    install -Dm755 "$srcdir/arch_cleaner.py" "$pkgdir/usr/bin/arch-cleaner"
}
