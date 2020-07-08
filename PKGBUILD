# maintainer: thom wiggers
# Submitter: portaloffreedom

pkgname=python-vlc
pkgver=3.0.10114
pkgrel=1
pkgdesc="VLC bindings for python"
url="http://wiki.videolan.org/PythonBinding"
license=("GPL2")
arch=("any")
depends=('python' 'vlc')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/3a/17/e8bd7e99af5972b9927e9ab994fad1d5e878960b4e4d0fd8e29f28fef5c1/python-vlc-3.0.10114.tar.gz")

package() {
  cd $srcdir/$pkgname-$pkgver
  python setup.py install --root $pkgdir
}


sha256sums=('c1a8a295bea8277fa3d9a07dcdf873fe18c5f11a0e4d1f618df47c316fe0003b')
