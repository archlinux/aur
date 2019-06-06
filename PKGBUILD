# Maintainer: Edwin Peters <slimed13 at hotmail dot com>

pkgname=python-unireedsolomon-git
pkgver=f375f61
pkgrel=1
pkgdesc="Documented Universal Errors-and-erasures Reed Solomon Codec written in pure Python"
arch=('any')
url="https://github.com/lrq3000/unireedsolomon"
license=('MIT')
depends=('python' )
optdepends=('cython' )
makedepends=('python-setuptools' 'git')
source=(git+https://github.com/lrq3000/unireedsolomon.git)
sha256sums=(SKIP)

package() {
  cd ${srcdir}/unireedsolomon

  # ignores any LDFLAGS set in makepkg.conf
  unset LDFLAGS

  python ./setup.py install --root=${pkgdir}

}

