# maintainer: thom wiggers
# Submitter: portaloffreedom

pkgname=python-vlc
pkgver=3.0.11115
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


sha256sums=('a4d3bdddfce84a8fb1b2d5447193a0239c55c16ca246e5194d48efd59c4e236b')
