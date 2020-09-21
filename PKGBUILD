# Maintainer: Geno <geno+dev@fireorbit.de>

pkgname=python-magcode-core
_pkgname=py-magcode-core
pkgver=1.4.13
pkgrel=2
pkgdesc="MAG Code Core utility module"
arch=('any')
url="https://github.com/grantma/py-magcode-core"
license=('GPL3')
depends=('python3')
source=("https://github.com/grantma/${_pkgname}/archive/v$pkgver.zip")
sha256sums=('470367b6c54bd306051462b4dd1eda8078f2b29538e92cd83eb3a19dc65a5e11')

build () {
  cd ${srcdir}/${_pkgname}-${pkgver}
  python setup.py build
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
