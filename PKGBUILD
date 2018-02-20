# Maintainer: XavierCLL <xavier.corredor.llano (a) gmail.com>

pkgname=krop
pkgver=0.5.0
pkgrel=1
pkgdesc="A tool to crop PDF files, with an eye towards eReaders."
arch=('any')
url="http://arminstraub.com/computer/krop"
license=('GPL3')
depends=('python' 'python-poppler-qt5' 'python-pypdf2' 'python-pyqt5')
install=$pkgname.install
source=(http://arminstraub.com/downloads/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('ce1f54ac2be97fd48ac3c036b00e0c3f')

package() {
  cd $pkgname-$pkgver
  python setup.py install --root $pkgdir

  # Desktop icon
  install -Dm644 $pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop  
}
