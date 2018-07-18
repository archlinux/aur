# Maintainer: Alberto Vázquez <beto.v25@gmail.com>
pkgname=rpcalc
pkgver=0.8.2
pkgrel=1
pkgdesc="RPN calculator with qt5 GUI"
arch=('any')
url="http://rpcalc.bellz.org/"
license=('unknown')
depends=('python' 'python-pyqt5' 'qt5-base')
source=("https://github.com/doug-101/rpCalc/releases/download/v0.8.2/rpcalc-0.8.2.tar.gz")
md5sums=('c26f183f1ade58f504282b676f2ecbc7')

package() {
	cd "$srcdir/rpCalc"
        sed -i -e 's/\/usr\/local/\/usr/' install.py
        python install.py -b "$pkgdir"
}
