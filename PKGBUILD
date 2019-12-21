# Maintainer: Anton Kudelin <kudelin at protonmail dot com>

_pkgname=browsermob-proxy
pkgname=python-browsermob-proxy
pkgver=0.8.0
pkgrel=1
pkgdesc="A library for interacting with the Browsermob Proxy"
arch=("any")
url="https://oss.theautomatedtester.co.uk/browsermob-proxy-py"
license=("Apache")
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/52/d0/ef4b7cd74fae2ecadc0130b206558ae5e43da9760f9069556aa48b318292/$_pkgname-$pkgver.tar.gz")
sha256sums=('fb345bc2207fccdb8a584694c8d02d01c2cfc539c9d43bbed38f0c54e1abbbaf')

build() {
  cd $srcdir/$_pkgname-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_pkgname-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
