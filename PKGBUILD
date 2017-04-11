# $Id$
# Maintainer: lxhillwind <lxhillwind@gmail.com>

pkgname=posix-standard
pkgver=POSIX.1_2008
pkgrel=1
pkgdesc="Archives of the html version of posix standard"
arch=('any')
url="http://pubs.opengroup.org/onlinepubs/9699919799/"
license=('CUSTOM')
source=(http://pubs.opengroup.org/onlinepubs/9699919799/download/susv4tc2.tar.bz2)
sha256sums=('9b50e290912dff356687b7585ea2d7a7e746231e1dd4adcb20833fa54e1f4d35')

package() {
    mkdir -p "$pkgdir"/usr/share/doc/$pkgname/html
    cp -rf "$srcdir"/*/* "$pkgdir"/usr/share/doc/$pkgname/html/
}
