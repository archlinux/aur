# Maintainer: Gavin Lyons <glyons66@hotmail.com>
# https://github.com/gavinlyonsrepo/bashmultitool
pkgname=bashmultitool
pkgver=1.1
pkgrel=2
pkgdesc="A library for bash shell program containing useful functions, written in bash import into scripts"
arch=('any')
url="https://github.com/gavinlyonsrepo/bashmultitool"
license=('MIT')

source=("https://github.com/gavinlyonsrepo/bashmultitool/archive/$pkgver.tar.gz")

md5sums=('c07b1f8041515c6addb48a8b0176a76b')

package() {

    cd "$srcdir/${pkgname}-${pkgver}"

    install -D -m644 README.md "$pkgdir/usr/share/doc/${pkgname}/Readme.md"
    install -D -m644 documentation/Features.md "$pkgdir/usr/share/doc/${pkgname}/Features.md"
    install -D -m644 documentation/changelog.md "$pkgdir/usr/share/doc/${pkgname}/changelog.md"
    install -D -m644 documentation/License.md "$pkgdir/usr/share/licenses/${pkgname}/License.md"


    install -d  "$pkgdir"/usr/lib/bashmultitool
    install -D -m644  lib/* "$pkgdir"/usr/lib/bashmultitool
}
