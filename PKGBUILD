# Maintainer: Vinicius Correa <vinicius dot correa at zoho dot com>
_pkgname=storm
pkgname=python-storm
pkgver=0.20
pkgrel=1
pkgdesc="An object-relational mapper (ORM) for Python"
arch=('any')
url="https://storm.canonical.com"
license=('LGPL')
depends=('python' 'python-six' 'python-future')
makedepends=('git')
source=("https://launchpad.net/~stoq-dev/+archive/ubuntu/stoq3/+sourcefiles/storm/0.20.0.100-2~py3-1bionic/storm_0.20.0.100-2~py3-1bionic.tar.gz")
md5sums=('b16a6966fc5db564bdc01ed8a58cdf8e')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}.0.99"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}.0.99"
  python setup.py install --root="${pkgdir}" --optimize=1
}
