# Maintainer: Gavin Lyons <glyons66@hotmail.com>
# https://github.com/gavinlyonsrepo/bashmultitool
pkgname=bashmultitool
pkgver=1.2
pkgrel=3
pkgdesc="A library for bash shell programs containing useful functions, written in bash, can be imported into scripts"
arch=('any')
url="https://github.com/gavinlyonsrepo/bashmultitool"
license=('MIT')

source=("https://github.com/gavinlyonsrepo/bashmultitool/archive/$pkgver.tar.gz")

md5sums=('a1febfc8b27a913b495933a0b7f31339')

package() {

    cd "$srcdir/${pkgname}-${pkgver}"

    install -D -m644 README.md "$pkgdir/usr/share/doc/${pkgname}/Readme.md"
    install -D -m644 documentation/Features.md "$pkgdir/usr/share/doc/${pkgname}/Features.md"
    install -D -m644 documentation/changelog.md "$pkgdir/usr/share/doc/${pkgname}/changelog.md"
    install -D -m644 documentation/License.md "$pkgdir/usr/share/licenses/${pkgname}/License.md"


    install -d  "$pkgdir"/usr/lib/bashmultitool
    install -D -m644  lib/* "$pkgdir"/usr/lib/bashmultitool
}
