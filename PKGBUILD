# Maintainer: Gavin Lyons <glyons66@hotmail.com>
# https://github.com/gavinlyonsrepo/bashmultitool
pkgname=bashmultitool
pkgver=2.0
pkgrel=1
pkgdesc="A library for bash shell programs containing useful functions, written in bash, can be imported into scripts"
arch=('any')
url="https://github.com/gavinlyonsrepo/bashmultitool"
license=('MIT')

source=("https://github.com/gavinlyonsrepo/bashmultitool/archive/$pkgver.tar.gz")

sha256sums=('2c38d9e5e6c9f8ba63c7a5ee8cc354bc70f9d71b17f3a942db753eadcc2f6734')

package() {

    cd "$srcdir/${pkgname}-${pkgver}"
    install -D -m755 main/bashmultitool "$pkgdir"/usr/bin/"${pkgname}" 
    install -D -m644 README.md "$pkgdir/usr/share/doc/${pkgname}/Readme.md"

    install -d  "$pkgdir"/usr/share/doc/bashmultitool
    install -D -m644  documentation/* "$pkgdir"/usr/share/doc/bashmultitool

    install -d  "$pkgdir"/usr/lib/bashmultitool
    install -D -m644  lib/* "$pkgdir"/usr/lib/bashmultitool
}
