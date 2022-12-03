# Maintainer: Nathaniel Cook <nvcook42 |at| gmail |dot| com>

pkgname=minecraft-multi-server
pkgver=0.3.0
pkgrel=1
pkgdesc="Minecraft server template unit files and control script"
arch=('any')
url="https://github.com/nathanielc/$pkgname"
license=('MIT')
depends=('docker' 'bash' 'coreutils' 'mcrcon')
conflicts=('minecraft-server')
backup=('etc/minecraft')
install="${pkgname}.install"
source=("https://github.com/nathanielc/$pkgname/archive/v${pkgver}.tar.gz")
sha256sums=('6b87b1da2ff1b3f02e69e11f84aacd79846262e8d174cf1e1487b74e397c7568')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make PREFIX=$pkgdir install
}
