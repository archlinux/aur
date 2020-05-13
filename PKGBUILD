# Maintainer: reno.esper@gmail.com
# Maintainer: geert@hendrickx.be

pkgname=mongodb-mtools
_pkgname=mtools
pkgver=1.6.3
pkgrel=1
arch=('x86_64')
url="https://github.com/rueckstiess/mtools"
pkgdesc="A collection of scripts to set up MongoDB test environments and parse and visualize MongoDB log files"
license=('Apache License')
depends=('python' 'python-dateutil' 'python-setuptools')
optdepends=('python-psutil' 'python-pymongo' 'python-matplotlib' 'python-numpy')
makedepends=('python-setuptools')
source=("https://github.com/rueckstiess/mtools/archive/v$pkgver.tar.gz")
sha256sums=('0a4cb7f256457d8fc89c4726e593866f42895355694d9c9018f5f4c679adda54')

package() {
  cd $srcdir/$_pkgname-${pkgver}
  python setup.py install --root=$pkgdir
}
