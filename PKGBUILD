# Maintainer: Victor Fernandez Rico <vfrico at gmail dot com>
pkgname=pimagizer
pkgver=0.4.2
pkgrel=2
pkgdesc="A Python program with GTK ui created to resize images"
arch=('any')
url="http://cambiadeso.es/proyectos/pimagizer"
license=('GPL3')
#groups=()
depends=('python2' 'python2-pillow' 'desktop-file-utils' 'pygobject-devel')
# makedepends=()
#backup=()
options=(!emptydirs)
source=(https://launchpad.net/$pkgname/trunk/0.4.2/+download/$pkgname-$pkgver.tar.gz)
md5sums=(8412765f673203ee2c95a20b9922a08c)

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

