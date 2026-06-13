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
sha256sums=('e1f67fcd1c1dbdf9498f8e1e3dfd45e302c5f8f5a6ca8ce1d77aabfda44e9ea1')

package() {
    install -Dm755 "$srcdir/pkgdrop" "$pkgdir/usr/bin/pkgdrop"
}