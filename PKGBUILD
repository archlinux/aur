# Maintainer: reno.esper@gmail.com

pkgname=python-mtools
_pkgname=mtools
pkgver=1.2.2
pkgrel=1
arch=('i686' 'x86_64')
url="https://github.com/rueckstiess/mtools"
pkgdesc="A collection of scripts to set up MongoDB test environments and parse and visualize MongoDB log files"
license=('Apache License')
depends=('python')
optdepends=('python-psutil' 'python-pymongo' 'python-matplotlib' 'python-numpy')
makedepends=('python')
source=("https://github.com/rueckstiess/mtools/archive/v$pkgver.tar.gz")

package() {
  cd $srcdir/$_pkgname-${pkgver}
  python setup.py install --root=$pkgdir
}

md5sums=('238bb5da5da84c6c638963e6dae42eb2')
