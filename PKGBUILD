# Maintainer: XavierCLL <xavier.corredor.llano (a) gmail.com>

pkgname=krop
pkgver=0.4.10
pkgrel=1
pkgdesc="A tool to crop PDF files, with an eye towards eReaders."
arch=('any')
url="http://arminstraub.com/computer/krop"
license=('GPL3')
depends=('python2' 'python2-poppler-qt4' 'python2-pypdf2' 'python2-pyqt4')
install=$pkgname.install
source=(http://arminstraub.com/downloads/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('4f03ad32e84c3788d0ab23eebf4a5a35')

package() {
  cd $srcdir/$pkgname-$pkgver
  python2 setup.py install --root $pkgdir

  # Desktop icon
  install -Dm644 $pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop  
}
