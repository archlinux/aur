# Maintainer: Bevan Thomas <bevant@gmail.com>

pkgname=openshot-qt
pkgver=2.0.6
pkgrel=1
epoch=1
pkgdesc="an open-source, non-linear, next gen video editor, based on libopenshot."
arch=('any')
url="http://www.openshotvideo.com/"
license=('GPL')
conflicts=('openshot' 'openshot-bzr')
depends=('python' 'python-pyqt5' 'desktop-file-utils' 'shared-mime-info' 'libopenshot' 'qt5-webkit')
source=(https://launchpad.net/openshot/2.0/$pkgver/+download/$pkgname-$pkgver.tar.gz)
md5sums=('SKIP')

package() {
  cd $srcdir/$pkgname-$pkgver
  python setup.py install --root=$pkgdir/ --optimize=1
}
