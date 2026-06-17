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
sha256sums=('aa297be255f9db8a2fecb165b6490e1224f6676ebbd31f17931182db7d7fdf5d')

package() {
    install -Dm755 "$srcdir/pkgdrop" "$pkgdir/usr/bin/pkgdrop"
}