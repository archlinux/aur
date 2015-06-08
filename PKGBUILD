# Maintainer: Daniel Nagy <danielnagy at gmx de>

pkgname=python2-akismet
pkgver=0.2.0
pkgrel=1
pkgdesc="A Python interface to the Akismet anti comment-spam API."
url="http://www.voidspace.org.uk/python/modules.shtml#akismet"
depends=( 'python2' )
license=( 'BSD' )
arch=('any')
source=( "https://pypi.python.org/packages/source/a/akismet/akismet-$pkgver.tar.gz")
md5sums=('bd4b471d88aadad00a6fd70dea97e718')

build() {
    cd $srcdir/akismet-$pkgver
    python2 setup.py build
}

package() {
    cd $srcdir/akismet-$pkgver
    python2 setup.py install --root="$pkgdir" --optimize=1 
}
