# Maintainer: M0Rf30

pkgname=python2-pybitcointools
pkgver=1.1.15
pkgrel=1
pkgdesc="Python Bitcoin Tools"
arch=(any)
url="https://github.com/vbuterin/pybitcointools"
license=('MIT')
depends=('python2')
makedepends=('python2-setuptools')
source=(https://pypi.python.org/packages/source/p/pybitcointools/pybitcointools-$pkgver.tar.gz)
conflicts=('python2-pybitcointools-git')
replaces=('python2-pybitcointools-git')

package(){
  cd pybitcointools-${pkgver}
  python2 setup.py install --root="$pkgdir"
}

md5sums=('7439cd762f4441b5978b3554cc948b90')
