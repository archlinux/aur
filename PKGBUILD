# Maintainer: raininja <daniel.mclellan@gmail.com
pkgname=modoboa
pkgver=1.3.4
pkgrel=1
pkgdesc="Modoboa is a django mail hosting and management platform"
arch=(any)
url="www.modoboa.org"
license=('GPL')
makedepends=('python2' 'cairo' 'rrdtool' 'pango' 'python2-rrdtool' 'python2-lxml' 'zlib')
optdepends=('python2-virtualenv' 'mysql' 'postgresql' 'sqlite' 'python2-mysql-connector' 'python2-psycopg2' 'python2-aspw' )
provides=('modoboa')
conflicts=('modoboa-git')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/m/$pkgname/$pkgname-$pkgver.tar.gz)
sha512sums=('9aecea8e0c8282292ba1cc11749956967ceb66332157267338bf08a05ffdc13bfeae64968cffb3df955ee7d73ad25a9370e639c363fe6de4167044de40413e6b')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
