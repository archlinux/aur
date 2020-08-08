# Maintainer: reno.esper@gmail.com
# Maintainer: geert@hendrickx.be

pkgname=mongodb-mtools
_pkgname=mtools
pkgver=1.6.4
pkgrel=1
arch=('x86_64')
url="https://github.com/rueckstiess/mtools"
pkgdesc="A collection of scripts to set up MongoDB test environments and parse and visualize MongoDB log files"
license=('Apache License')
depends=('python' 'python-dateutil' 'python-setuptools')
optdepends=('python-psutil' 'python-pymongo' 'python-matplotlib' 'python-numpy')
makedepends=('python-setuptools')
source=("https://github.com/rueckstiess/mtools/archive/v$pkgver.tar.gz")
sha256sums=('420e22180130fc8c2b78b3a6cd9389f36badf5edfa58c34ca54729641ae5b666')

package() {
  cd $srcdir/$_pkgname-${pkgver}
  python setup.py install --root=$pkgdir
}
