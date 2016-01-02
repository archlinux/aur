# Maintainer: Javier Tia <javier dot tia at gmail dot com>

pkgname=samuel
pkgver=0.1.8
pkgrel=4
pkgdesc="An open source Draughts Game for Linux"
arch=('any')
url="http://johncheetham.com/projects/samuel/"
license=('GPL3')
depends=('pygtk')
source=("${url}/$pkgname-$pkgver.tar.gz")
sha256sums=('fc4f837199f2e920918b0a3c499e8bfdd364a1f47089f3b48b3a93922af0fc89')

package() {
   cd $srcdir/$pkgname-$pkgver

   python2 setup.py install --root $pkgdir
}
