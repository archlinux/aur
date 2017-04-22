# Maintainer: reno.esper@gmail.com
# Maintainer: geert@hendrickx.be

pkgname=python2-mtools
_pkgname=mtools
pkgver=1.2.3
pkgrel=1
arch=('i686' 'x86_64')
url="https://github.com/rueckstiess/mtools"
pkgdesc="A collection of scripts to set up MongoDB test environments and parse and visualize MongoDB log files"
license=('Apache License')
depends=('python2' 'python2-dateutil' 'python2-setuptools')
optdepends=('python2-psutil' 'python2-pymongo' 'python2-matplotlib' 'python2-numpy')
makedepends=('python2-setuptools')
source=("https://github.com/rueckstiess/mtools/archive/v$pkgver.tar.gz")
sha256sums=('3fa09109bc986bef5081f743db43bc87c3b41f0414556c9bf0f1e10364389c0a')

package() {
  cd $srcdir/$_pkgname-${pkgver}
  python2 setup.py install --root=$pkgdir
}
