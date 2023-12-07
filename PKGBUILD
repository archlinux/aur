# Maintainer: Aseem Athale <athaleaseem@gmail.com>
# Contributor: thom wiggers
# Submitter: portaloffreedom

pkgname=python-vlc
pkgver=3.0.20123
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


sha256sums=('244fbb9e392a0326841fca926d6d12a2a36c546982191f493f148fa19e66b1d4')
