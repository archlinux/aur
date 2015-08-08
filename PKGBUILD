# Maintainer: XavierCLL

pkgname=krop
pkgver=0.4.7
pkgrel=3
pkgdesc="A tool to crop PDF files, with an eye towards eReaders."
arch=('any')
url="http://arminstraub.com/computer/krop"
license=('GPL3')
depends=('python2-poppler-qt4' 'python2-pypdf2')
install=$pkgname.install
source=(http://arminstraub.com/downloads/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('43b7c11f09b484a5516bcaf24cd0919e')

package() {
  cd $srcdir/$pkgname-$pkgver
  python2 setup.py install --root $pkgdir

  # Desktop icon
  install -Dm644 $pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop  
}