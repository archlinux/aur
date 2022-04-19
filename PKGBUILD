# maintainer: thom wiggers
# Submitter: portaloffreedom

pkgname=python-vlc
pkgver=3.0.16120
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


sha256sums=('92f98fee088f72bd6d063b3b3312d0bd29b37e7ad65ddeb3a7303320300c2807')
