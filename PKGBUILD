# Maintainer: Nathaniel Cook <nvcook42 |at| gmail |dot| com>

pkgname=minecraft-multi-server
pkgver=0.1.1
pkgrel=1
pkgdesc="Minecraft server template unit files and control script"
arch=('any')
url="https://github.com/nathanielc/$pkgname"
license=('MIT')
depends=('docker' 'bash' 'coreutils' 'grep' 'sed')
conflicts=('minecraft-server')
backup=('etc/minecraft')
install="${pkgname}.install"
source=("https://github.com/nathanielc/$pkgname/archive/v${pkgver}.tar.gz")
md5sums=('7c7eb3576efe0de93c92b7889218bc1b')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make PREFIX=$pkgdir install
}
