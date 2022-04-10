# Maintainer: Gavin Lyons <glyons66@hotmail.com>
# https://github.com/gavinlyonsrepo/bashmultitool
pkgname=bashmultitool
pkgver=1.7
pkgrel=8
pkgdesc="A library for bash shell programs containing useful functions, written in bash, can be imported into scripts"
arch=('any')
url="https://github.com/gavinlyonsrepo/bashmultitool"
license=('MIT')

source=("https://github.com/gavinlyonsrepo/bashmultitool/archive/$pkgver.tar.gz")

sha256sums=('c09e7f1e529b2dad200fb7423e72d39de0c02b3d7f2ce1e2819f9ed1db23431f')

package() {

    cd "$srcdir/${pkgname}-${pkgver}"
    install -D -m755 bashmultitool.sh "$pkgdir"/usr/bin/"${pkgname}" 
    install -D -m644 README.md "$pkgdir/usr/share/doc/${pkgname}/Readme.md"

    install -d  "$pkgdir"/usr/share/doc/bashmultitool
    install -D -m644  documentation/* "$pkgdir"/usr/share/doc/bashmultitool

    install -d  "$pkgdir"/usr/lib/bashmultitool
    install -D -m644  lib/* "$pkgdir"/usr/lib/bashmultitool
}
