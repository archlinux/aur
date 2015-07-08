# Contributor: Douglas Soares de Andrade <dsa@aur.archlinux.org>
# Contributor: William Rea <sillywilly@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=python2-pypdf
pkgver=1.13
pkgrel=2
pkgdesc="A Pure-Python library built as a PDF toolkit"
arch=('any')
url="http://pybrary.net/pyPdf"
license=('BSD')
depends=('python2')
conflicts=('pypdf')
provides=('pypdf')
source=(http://pybrary.net/pyPdf/pyPdf-$pkgver.tar.gz 
	license.txt)
md5sums=('7a75ef56f227b78ae62d6e38d4b6b1da'
         '19b1b4bc0a9a8c4b7b2f5689a16cec2c')

package() {
    cd ${srcdir}/pyPdf-${pkgver}

    python2 setup.py install --root=${pkgdir}
    install -D -m644 ../license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}

