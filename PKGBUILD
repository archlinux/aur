# $Id$
# Maintainer: lxhillwind <lxhillwind@gmail.com>

pkgname=posix-standard
pkgver=POSIX.1_2017
pkgrel=1
pkgdesc="Archives of the html version of posix standard"
arch=('any')
url="http://pubs.opengroup.org/onlinepubs/9699919799/"
license=('CUSTOM')
source=(http://pubs.opengroup.org/onlinepubs/9699919799/download/susv4-2018.tar.bz2)
sha256sums=('73cc1347aa7e19d69265c62570696c8b9d2d06665c5d81d6acb1ea825b25534b')

package() {
    mkdir -p "$pkgdir"/usr/share/doc/$pkgname/html
    cp -rf "$srcdir"/*/* "$pkgdir"/usr/share/doc/$pkgname/html/
    printf "\x1b[1m[NOTE]\x1b[0m\n"
    printf "You should read the document here:\n"
    printf "\thttp://pubs.opengroup.org/onlinepubs/terms.htm#c082\n"
    printf "If you do not agree, uninstall this package.\n"
}
