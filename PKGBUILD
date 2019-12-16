# maintainer: thom wiggers
# Submitter: portaloffreedom

pkgname=python-vlc
pkgver=3.0.7110
pkgrel=1
pkgdesc="VLC bindings for python"
url="http://wiki.videolan.org/PythonBinding"
license=("GPL2")
arch=("any")
depends=('python' 'vlc')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/a8/51/299f4804c43f99d718ed43a63b1ea0712932e25b6bbe1ee1817cb8e954f7/python-vlc-3.0.7110.tar.gz")

package() {
  cd $srcdir/$pkgname-$pkgver
  python setup.py install --root $pkgdir
}


sha256sums=('821bca0dbe08fbff97a65e56ff2318ad7d499330876579c39f01f3fb38c7b679')
