# Maintainer: Edwin Peters <slimed13 at hotmail dot com>

pkgname=python2-reedsolomon-git
pkgver=c9ec28a 
pkgrel=1
pkgdesc="Pure-Python Reed Solomon encoder/decoder"
arch=('any')
url="https://github.com/tomerfiliba/reedsolomon"
license=('BSD')
depends=('python2' )
optdepends=('cython2' )
makedepends=('python2-setuptools' 'git')
source=(git+https://github.com/tomerfiliba/reedsolomon.git)
sha256sums=(SKIP)

package() {
  cd ${srcdir}/reedsolomon

  # ignores any LDFLAGS set in makepkg.conf
  unset LDFLAGS

  python2 ./setup.py install --root=${pkgdir}

}