# Maintainer: theyonecodes <theyonecodes@gmail.com>
pkgname=pkgdrop
pkgver=3.0.0
pkgrel=1
pkgdesc="Universal package installer for Arch Linux"
arch=('any')
url="https://github.com/theyonecodes/pkgdrop"
license=('MIT')
depends=('bash')
optdepends=('pacman: for .pkg.tar.* packages'
            'debtap: for .deb packages')
source=("pkgdrop::https://raw.githubusercontent.com/theyonecodes/pkgdrop/main/src/pkgdrop")
sha256sums=('66f2246d5ede4a49b384d11251510f9d0b1ef2b0b6634abf6c2240b16ca6ba24')

package() {
    install -Dm755 "$srcdir/pkgdrop" "$pkgdir/usr/bin/pkgdrop"
}