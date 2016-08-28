# Maintainer: M0Rf30

pkgname=python2-dmidecode
pkgver=3.12.2
pkgrel=1
arch=('i686' 'x86_64')
url="https://git.fedorahosted.org/cgit/python-dmidecode.git"
pkgdesc="Python module to access DMI data"
license=('GPL2')
depends=('python2' 'dmidecode')
makedepends=('python2')
source=("https://github.com/nima/python-dmidecode/archive/v$pkgver.tar.gz")

package() {
  cd $srcdir/python-dmidecode-${pkgver}
  export CFLAGS+=" -std=gnu89"
  make build
  python2 src/setup.py install --root=$pkgdir/ 

}

md5sums=('458d83ac45316ec40df327b183b2030e')
