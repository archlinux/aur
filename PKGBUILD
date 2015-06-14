# Maintainer: Dario Giovannetti <dev at dariogiovannetti dot net>

pkgname='python-texthistory'
pkgver='1.0.1'
pkgrel=1
pkgdesc="Python undo/redo engine for plain text and wxPython TextCtrl"
arch=('any')
url="https://github.com/kynikos/lib.py.text-history"
license=('GPL3')
depends=('python')
source=("http://downloads.sourceforge.net/project/kynikos/lib.py.text-history/$pkgname-$pkgver.tar.bz2")
sha256sums=('201b88b662e6d5392fabd063eedd3a9297b0215c8d7e2690b5fd00431e147eab')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}
