# Maintainer: Dario Giovannetti <dev at dariogiovannetti dot net>

pkgname='python2-texthistory'
pkgver='1.0.1'
pkgrel=1
pkgdesc="Python2 undo/redo engine for plain text and wxPython TextCtrl"
arch=('any')
url="https://github.com/kynikos/lib.py.text-history"
license=('GPL3')
depends=('python2')
optdepends=('wxpython: support for wx.TextCtrl')
source=("http://downloads.sourceforge.net/project/kynikos/lib.py.text-history/$pkgname-$pkgver.tar.bz2")
sha256sums=('938f40c0cedb824550296fd1501f3ba1d4715126b645515c8672858efbd2a3b4')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python2 setup.py install --root="$pkgdir" --optimize=1
}
