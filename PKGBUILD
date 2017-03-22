# Original Author: chendaniely<chendaniely@gmail.com>

pkgname=nteract-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Interactive literate coding notebook"
url='https://nteract.io'
arch=('x86_64')
depends=('')
license=('BSD-3-Clause')
md5sums_x86_64=('4b4dfa763a1ed92e8d530b204686eca2')
# https://github.com/nteract/nteract/releases/download/v0.1.0/nteract_0.1.0_amd64.deb
source_x86_64=("https://github.com/nteract/nteract/releases/download/v$pkgver/nteract_${pkgver}_amd64.deb")

build() {
    cd "${srcdir}"
    bsdtar -xf nteract-linux-x64.tar.gz
}

package() {
    mv $srcdir/ $pkgdir/opt
    rm $pkgdir/opt/nteract-linux-x64.tar.gz
}
