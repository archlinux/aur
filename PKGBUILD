# Maintainer: XavierCLL <xavier.corredor.llano (a) gmail.com>

pkgname=krop
pkgver=0.4.13
pkgrel=1
pkgdesc="A tool to crop PDF files, with an eye towards eReaders."
arch=('any')
url="http://arminstraub.com/computer/krop"
license=('GPL3')
depends=('python' 'python-poppler-qt4' 'python-pypdf2' 'python-pyqt4')
install=$pkgname.install
source=(http://arminstraub.com/downloads/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('46ec5ccbfe97ca64e78c8c57a49e199a')

package() {
  cd $pkgname-$pkgver
  python setup.py install --root $pkgdir

  # Desktop icon
  install -Dm644 $pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop  
}
