# Original Author: chendaniely<chendaniely@gmail.com>

pkgname=nteract-bin
pkgver=0.0.13
pkgrel=1
pkgdesc="Interactive literate coding notebook"
url='https://nteract.io'
arch=('x86_64')
depends=('')
license=('BSD-3-Clause')
md5sums_x86_64=('c7389edaa93aa178ddd4bb025937bb25')
source_x86_64=("https://github.com/nteract/nteract/releases/download/v$pkgver/nteract-linux-x64.tar.gz")

build() {
    cd "${srcdir}"
    bsdtar -xf nteract-linux-x64.tar.gz
}

package() {
    mv $srcdir/ $pkgdir/opt
    rm $pkgdir/opt/nteract-linux-x64.tar.gz
}
