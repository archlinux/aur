#Maintainer: Dylan Delgado <dylan1496 at live dot com>

pkgname=prefactor
pkgver=0.8.0
pkgrel=1
pkgdesc="Command-line utility to find small factors of big numbers using George Woltman's Gwnum library."
arch=('x86_64')
url="https://github.com/patnashev/prefactor"
license=('unknown')
source=('https://github.com/patnashev/prefactor/releases/download/v0.8.0/prefactor-0.8.0-linux64.7z')
sha256sums=('c8a91c55a4a6dd5e3cfa7d4a10e94e488ad613a37002c6b3d03c9ef4284138fc')


package() {
    cd ${srcdir}/
    install -dm755 "${pkgdir}"/usr/bin
    cp -r prefactor "${pkgdir}"/usr/bin
}
