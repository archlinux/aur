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
sha256sums=('265c3dd87b17d86c3025f935382c2c6bb428b9845424bf416076987b4648bc03')

package() {
    install -Dm755 "$srcdir/pkgdrop" "$pkgdir/usr/bin/pkgdrop"
}