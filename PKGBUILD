# Maintainer: Alex Whitt <alex.joseph.whitt@gmail.com>
pkgname=python-p4python
pkgver=2016.2.1498648
pkgrel=1
pkgdesc="Python interface to Perforce API"
url="https://www.perforce.com/perforce/doc.current/manuals/p4script/03_python.html"
arch=('any')
license=('custom')
depends=('python')
source=($pkgname-$pkgver.tar.gz::"https://pypi.python.org/packages/ad/f8/5d31e3b042eee7c8f6e09d482a3816d8b5c2d01a66073d4e48960afdd101/p4python-${pkgver}.tar.gz")
md5sums=('d958a7501ade5331a6d889689a5dc862')

package() {
  cd $srcdir/p4python-$pkgver
  python setup.py install --root=$pkgdir
  install -Dm644 LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
