# maintainer: thom wiggers
# Submitter: portaloffreedom

pkgname=python-vlc
pkgver=3.0.12118
pkgrel=1
pkgdesc="VLC bindings for python"
url="http://wiki.videolan.org/PythonBinding"
license=("GPL2")
arch=("any")
depends=('python' 'vlc')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")

package() {
  cd $srcdir/$pkgname-$pkgver
  python setup.py install --root $pkgdir
}


sha256sums=('566f2f7c303f6800851cacc016df1c6eeec094ad63e0a49d87db9d698094f1fb')
